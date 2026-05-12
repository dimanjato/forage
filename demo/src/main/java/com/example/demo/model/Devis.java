package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.time.LocalDateTime; // Utilisation de java.time pour les dates/heures modernes

@Entity
@Table(name = "devis")
public class Devis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "id_demande")
    private int idDemande; // Clé étrangère vers Demande

    @Column(name = "observation")
    private String observation;

    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP) // Mappe à DATETIME en SQL
    private LocalDateTime createdAt;

    @Column(name = "type_devis")
    private String typeDevis;

    // Constructeur par défaut
    public Devis() {
        this.createdAt = LocalDateTime.now(); // Initialise la date de création par défaut
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdDemande() {
        return idDemande;
    }

    public void setIdDemande(int idDemande) {
        this.idDemande = idDemande;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getTypeDevis() {
        return typeDevis;
    }

    public void setTypeDevis(String typeDevis) {
        this.typeDevis = typeDevis;
    }
}