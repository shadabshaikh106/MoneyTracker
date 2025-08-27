package com.example.moneytracker.repository;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.moneytracker.entities.Transaction;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    @Query("SELECT SUM(t.amount) FROM Transaction t WHERE t.type = ?1 AND t.user.id = ?2")
    Double sumByTypeAndUserId(String type, Integer userId);

    @Query("SELECT t FROM Transaction t WHERE t.user.id = ?1 ORDER BY t.createdAt DESC")
    List<Transaction> findRecentTransaction(Integer userId, PageRequest of);
    
    
    @Query("SELECT t FROM Transaction t WHERE t.user.id = :userId ORDER BY t.createdAt DESC")
	List<Transaction> findByUserId(Integer userId);
    

    @Query("SELECT t FROM Transaction t WHERE t.user.id = :userId AND " +
		       "(LOWER(t.personName) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
		       "OR STR(t.amount) LIKE CONCAT('%', :keyword, '%') " +
		       "OR LOWER(t.status) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
		       "OR LOWER(t.type) LIKE LOWER(CONCAT('%', :keyword, '%')) )")
		List<Transaction> searchTransactions( Integer userId,  String keyword);





}


