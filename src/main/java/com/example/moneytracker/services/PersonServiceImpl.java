package com.example.moneytracker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.moneytracker.entities.Person;
import com.example.moneytracker.repository.PersonRepository;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    public PersonRepository personRepository;

    @Override
    public void save(Person person) {
         personRepository.save(person);
    }

    @Override
    public List<Person> getAllByUserId(Integer userId) {
        return personRepository.findByUser_Id(userId);
    }

    @Override
    public Person findById(Integer id) {
        return personRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteById(Integer id) {
        personRepository.deleteById(id);
    }
}