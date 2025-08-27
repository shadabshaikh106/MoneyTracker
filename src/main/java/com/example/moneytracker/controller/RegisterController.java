package com.example.moneytracker.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.moneytracker.entities.User;
import com.example.moneytracker.services.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("moneytracker/register")
public class RegisterController {
	
	@Autowired
	UserService userservice;
	
	@RequestMapping("/form")
	public String showRegister() {
		return  "register";
		
	}
	
	
	
@PostMapping("/insert")
	public String handlerRegister(@ModelAttribute User user ,HttpServletRequest req,Model model)
	{
	String confirmpassword = req.getParameter("confirmpassword");

		
		if (userservice.isUsernameTaken(user.getUsername())) {
			
			model.addAttribute("error", "Username already exists");

			return "register";
		}
if (!user.getPassword().equals(confirmpassword) && user.getPassword().matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\\\d)(?=.*[@$!%?&])[A-Za-z\\\\d@$!%?&]{10,}$")){
			 
			model.addAttribute("error", "password do not match");
			return "register";
		}
		userservice.saveuser(user);



		   return "redirect:/login/";
	}

}
