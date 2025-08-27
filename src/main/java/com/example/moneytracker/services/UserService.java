package com.example.moneytracker.services;

import com.example.moneytracker.entities.User;

public interface UserService {

	boolean isUsernameTaken(String username);

	void saveuser(User user);

	User findByEmailOrMobile(String input);

	User findByUsername(String username);

	Double getUserBalance(Integer userId);

}
