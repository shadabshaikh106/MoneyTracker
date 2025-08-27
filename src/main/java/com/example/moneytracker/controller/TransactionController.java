package com.example.moneytracker.controller;

 
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moneytracker.Transaction.TransactionService;
import com.example.moneytracker.entities.Transaction;
import com.example.moneytracker.entities.User;
import com.example.moneytracker.exceptionhandler.InsufficientBalanceException;
import com.example.moneytracker.exceptionhandler.UserNotFoundException;

import jakarta.servlet.http.HttpSession;






@Controller
@RequestMapping("/transaction")
public class TransactionController {
	
	
	@Autowired
	TransactionService    transactionservice;
	
	
	@GetMapping("/")
	public String showAddForm(Model model) {
		model.addAttribute("transaction", new Transaction());
		return "addtransaction";
				
	}
	
	@PostMapping("/save")
    public String saveTransaction(@ModelAttribute Transaction transaction, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login/";
        }
        
        
        transaction.setUser(user);   
        
        transaction.setCreatedAt(LocalDateTime.now()); 
          
        
        try {
            transactionservice.save(transaction);   
            return "redirect:/dashboard/";
        } catch (UserNotFoundException | InsufficientBalanceException e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("transaction", transaction);
            return "addtransaction";
		
	
        }
	
	}
	
	
	 @GetMapping("/list")
	 public String listTransactions(HttpSession session, Model model) {
	     User user = (User) session.getAttribute("loggedInUser");
	     if (user == null) {
	            return "redirect:/login/";
	        }
	     
	     model.addAttribute("transactions", transactionservice.findByUserId(user.getId()));
	     return "viewTransactions";
	 }
	 
	 
	 @GetMapping("/searchTransactions")
	 public String searchTransactions(@RequestParam("keyword") String keyword,
	                                  HttpSession session, Model model) {
	     User user = (User) session.getAttribute("loggedInUser");
	     if (user == null) {
	    	 
	    	 return "redirect:/login";
	    	 
	     }

	     List<Transaction> results = transactionservice.searchTransactions(user.getId(), keyword);

	     model.addAttribute("searchResults", results);
	     model.addAttribute("balance", user.getBalance());
	     model.addAttribute("borrowedAmount", transactionservice.getTotalBorrowed(user.getId()));
	     model.addAttribute("lentAmount", transactionservice.getTotalLent(user.getId()));

	     return "dashboard"; 
	 
	 
	 
	 }
	 
	 
	 
	 
	 
	 

	}
