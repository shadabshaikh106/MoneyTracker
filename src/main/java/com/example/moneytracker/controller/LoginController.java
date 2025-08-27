package com.example.moneytracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moneytracker.entities.User;
import com.example.moneytracker.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	
	@Autowired
	UserService userservice;  

	@RequestMapping("/")
	public String showLoginpage() {
		return "login";
		
	}
	// step no 1 find use by username 
	
	@PostMapping("/process")
	public String handelLogin(@RequestParam("username") String username,@RequestParam("password") String password,
			HttpSession session ,Model model) {
		
		User user = userservice.findByUsername(username);
		
		// checked if the user is not null and the password match to the user password 
		if(!(user !=null && user.getPassword().equals(password)))
		{
			
			model.addAttribute("error", "Invalid user name or password");
			
			return "login";
			
			 
		}
		
		
		
	
		// Step 3 : Valid Login
		
		   
	session.setAttribute("loggedInUser", user);	
	session.setAttribute("username", user.getUsername());
	session.setAttribute("userId", user.getId());
	
	return "redirect:/dashboard/";   // this will render dashboard.jsp

	}
	
	
	
}
