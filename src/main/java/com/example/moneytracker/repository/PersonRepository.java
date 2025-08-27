package com.example.moneytracker.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.moneytracker.entities.Person;


@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
	
	
    List<Person> findByUser_Id(Integer userId); // Data JPA will generate the query and find the List on the bases of this user_id
}