package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Devisdetails;

public interface DevisDetailService extends JpaRepository<Devisdetails, Integer>{
   
}
