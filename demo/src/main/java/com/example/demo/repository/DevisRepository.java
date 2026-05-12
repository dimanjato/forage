package com.example.demo.repository;

import com.example.demo.model.Devis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DevisRepository extends JpaRepository<Devis, Integer> {
    // Permet de trouver tous les en-têtes de devis pour une demande donnée
    List<Devis> findByIdDemande(int idDemande);
}