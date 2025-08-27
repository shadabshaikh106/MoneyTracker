package com.example.moneytracker.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.moneytracker.entities.User;
import com.example.moneytracker.exceptionhandler.InputValidationException;
import com.example.moneytracker.repository.UaserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UaserRepository repo;

	@Override
	public boolean isUsernameTaken(String username) {

		return repo.existsByUsername(username);
	}

	@Override
	public void saveuser(User user) {
		repo.save(user);

	}

	@Override
	public User findByEmailOrMobile(String input) {
	    // Check if input is a 10-digit number (mobile)
	    if (input.matches("^\\d{10}$")) {
	        Long mobile = Long.parseLong(input);
	        return repo.findByMobile(mobile);
	    }
	    // Check if input is a valid email
	    else if (input.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
	        return repo.findByEmail(input);
	    }
	    // If input doesn't match either format
	    else {
	        throw new InputValidationException("Please enter a valid 10-digit mobile number or a valid email address.");
	    }
	}

	@Override
	public User findByUsername(String username) {
		
		return repo.findByUsername(username);
	}

	@Override
	public Double getUserBalance(Integer userId) {
	User user=	repo.findById(userId).orElse(null);
		return user.getBalance()!=null ? user.getBalance():0.0;
	}

		
		
		
		
		
		
			}


