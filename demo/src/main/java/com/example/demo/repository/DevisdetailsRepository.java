package com.example.demo.repository;

import com.example.demo.model.Devisdetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DevisdetailsRepository extends JpaRepository<Devisdetails, Integer> {
    List<Devisdetails> findByIdDevis(int idDevis);
}