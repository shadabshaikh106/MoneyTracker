package com.example.moneytracker.services;

import java.util.List;

import com.example.moneytracker.entities.Person;



public interface PersonService {

	void save(Person person);

	List<Person> getAllByUserId(Integer userId);

	Person findById(Integer id);  

	void deleteById(Integer id);
}