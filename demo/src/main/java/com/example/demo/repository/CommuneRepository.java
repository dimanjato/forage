package com.example.demo.repository;

import com.example.demo.model.Commune;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommuneRepository extends JpaRepository<Commune, Integer> {
    
}
