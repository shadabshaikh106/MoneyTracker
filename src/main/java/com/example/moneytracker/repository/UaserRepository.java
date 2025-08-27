package com.example.moneytracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.moneytracker.entities.User;

@Repository
public interface UaserRepository extends JpaRepository<User, Integer>{

	boolean existsByUsername(String username);

	User findByMobile(Long mobile);

	User findByEmail(String input);

	User findByUsername(String username);   

}
