package com.example.moneytracker.controller;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moneytracker.entities.User;
import com.example.moneytracker.exceptionhandler.InputValidationException;
import com.example.moneytracker.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotPasswordController {

	@Autowired
	UserService service;

	@RequestMapping("/forgotpassword")
	public String showForgotPasswordPage() {
		return "forgotpassword";
	}

	@PostMapping("/forgotpassword/process")
	public String processForgotPassword(@RequestParam("input") String input,
			@RequestParam(value = "otpEntered", required = false) String otpEntered, HttpSession session, Model model) {

		// Step 2 :

		if (otpEntered != null) {

			String storedOtp = (String) session.getAttribute("otp");
			String storedInput = (String) session.getAttribute("otpInput");

			if (storedOtp != null && storedOtp.equals(otpEntered) && input.equals(storedInput)) {

				return "redirect:/ResetPassword";

			} else {

				model.addAttribute("error", "Invalid OTP. Please try again.");

				model.addAttribute("otp", storedOtp); // Show OTP (for demo/ This will display the OTP on UI)

				model.addAttribute("showOtp", true); // Show OTP input box (This will show the OTP Box on UI and keep it visible on failure)
				model.addAttribute("input", input); // This will let my old value on the screen when the OTP fails[This
													// is related to ${input} from front-end ]

				return "forgotpassword";

			}

		}

		// Step 1 : User submits the form with Email/Mobile
try {
		User user = service.findByEmailOrMobile(input);

		if (user != null) {

			String otp = String.valueOf(1000 + new SecureRandom().nextInt(9000)); // 4-digit

			// It stores the session for OTP and Input (Email/Mobile)

			session.setAttribute("otp", otp);
			session.setAttribute("otpInput", input);
			session.setMaxInactiveInterval(120); // session will be active for 2mins

			//

			model.addAttribute("otp", otp); // This will display otp on screen
			model.addAttribute("showOtp", true); // This will display OTP box on screen to enter otp

			} else {

			model.addAttribute("error", "Email or mobile number is not registered.");
			model.addAttribute("input", input); // This will let my old value on the screen even it doesn't find user
			     
		}} catch (InputValidationException ex) {
		   
		    model.addAttribute("error", ex.getMessage());  // 🚨 This handles your custom validation errors from service layer
		    model.addAttribute("input", input); // preserve input [This will let my old value on the screen even it doesn't find user]
		}
		return "forgotpassword";

	}

}
