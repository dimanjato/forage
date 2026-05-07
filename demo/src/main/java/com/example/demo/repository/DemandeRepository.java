package com.example.demo.repository;

import com.example.demo.model.Demande;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DemandeRepository extends JpaRepository<Demande, Integer> {
    
}
