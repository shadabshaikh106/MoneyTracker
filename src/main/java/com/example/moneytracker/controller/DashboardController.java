package com.example.moneytracker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.moneytracker.Transaction.TransactionService;
import com.example.moneytracker.entities.Transaction;
import com.example.moneytracker.entities.User;
import com.example.moneytracker.services.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	UserService   userservice;
	
	
	@Autowired
	TransactionService    transactionservice;
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession  session) {
		session.invalidate( );
		return "redirect:/login/";
	}
	
	
	@GetMapping("/")
	public String dashboard(HttpSession session,Model model,RedirectAttributes  redirectAttributes ) {	
		 User loggedInUser =(User) session.getAttribute("loggedInUser");	 
		 if(loggedInUser ==null) {			
		 redirectAttributes.addFlashAttribute("error", "Session time out please try again");
		 return "redirect:/login";
				}
		 
		 
				
				Integer userId = loggedInUser.getId();
				Double  balance =userservice.getUserBalance(userId);
				model.addAttribute("balance", balance);
				  
				Double borrowedAmount = transactionservice.getTotalBorrowed(userId);
				model.addAttribute("borrowedAmount", borrowedAmount);
				
				
				Double lentAmount= transactionservice.getTotalLent(userId);
				model.addAttribute("lentAmount", lentAmount);
				
				List<Transaction> recentTransactions = transactionservice.getRecentTransactions(userId,5);
				model.addAttribute("recentTransactions", recentTransactions);
				
				return "dashboard";
				
	}
	
	
	
	
	
	
	
	
	
	

}
