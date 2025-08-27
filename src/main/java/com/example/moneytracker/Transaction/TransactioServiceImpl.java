package com.example.moneytracker.Transaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.moneytracker.entities.Transaction;
import com.example.moneytracker.entities.User;
import com.example.moneytracker.exceptionhandler.InsufficientBalanceException;
import com.example.moneytracker.exceptionhandler.UserNotFoundException;
import com.example.moneytracker.repository.TransactionRepository;
import com.example.moneytracker.repository.UaserRepository;


@Service
public class TransactioServiceImpl implements TransactionService {
	
	@Autowired
	TransactionRepository  transactionrepo;
	
	@Autowired
	UaserRepository repo;
	
	

	@Override
	public Double getTotalBorrowed(Integer userId) {
		Double amount = transactionrepo.sumByTypeAndUserId("Borrow",userId);	
		return amount !=null ? amount: 0.0;
	}
	
	
	@Override
	public Double getTotalLent(Integer userId) {
		Double amount = transactionrepo.sumByTypeAndUserId("Lend",userId);
		return    amount!=null ? amount:0.0;
	}

	@Override
	public List<Transaction> getRecentTransactions(Integer userId, int limit) {
		
		return transactionrepo.findRecentTransaction(userId,PageRequest.of(0, limit));
	}
	
	
	
	//// This method is for transaction to add    


	@Override
	public void save(Transaction transaction) {
		
		 User dbUser = repo.findById(transaction.getUser().getId()) 
				  .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + transaction.getUser().getId()));
		
		 System.out.println(dbUser);
		    if ("Lend".equalsIgnoreCase(transaction.getType())) {
		    	 if ("Lend".equalsIgnoreCase(transaction.getType()) && dbUser.getBalance() < transaction.getAmount()) {
		    		        throw new InsufficientBalanceException("Insufficient balance! Available: ₹" + dbUser.getBalance());
		    		    }
		        dbUser.setBalance(dbUser.getBalance() - transaction.getAmount()); // Lending reduces balance
		    } else if ("Borrow".equalsIgnoreCase(transaction.getType())) {
		        dbUser.setBalance(dbUser.getBalance() + transaction.getAmount()); // Borrowing increases balance
		    }
		    
		    transactionrepo.save(transaction); 
		   repo .save(dbUser); 

		
	}


	@Override
	public List<Transaction> findByUserId(Integer userId) {
		return transactionrepo.findByUserId(userId);
	}
		
	
	


	@Override
	public List<Transaction> searchTransactions(Integer userId, String keyword) {
	
		return transactionrepo.searchTransactions(userId, keyword);
			

	}

 
	 
	
}
