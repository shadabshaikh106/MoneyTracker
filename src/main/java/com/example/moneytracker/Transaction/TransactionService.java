package com.example.moneytracker.Transaction;

import java.util.List;

import com.example.moneytracker.entities.Transaction;

public interface TransactionService {

	Double getTotalBorrowed(Integer userId);

	Double getTotalLent(Integer userId);

	List<Transaction> getRecentTransactions(Integer userId, int limit);

	// transaction method is start here

	List<Transaction> findByUserId(Integer userId);

	List<Transaction> searchTransactions(Integer userId, String keyword);

	void save(Transaction transaction);

}
