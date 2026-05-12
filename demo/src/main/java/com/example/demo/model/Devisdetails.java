package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "devis_detail")
public class Devisdetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "id_devis")
    private int idDevis;

    @Column(name = "libelle")
    private String libelle;

    @Column(name = "unite")
    private String unite;

    @Column(name = "quantite")
    private double quantite;

    @Column(name = "prix_unitaire")
    private double prixUnitaire;

    @Column(name ="montant")
    private double montant;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public int getIdDevis() {
        return idDevis;
    }
    public void setIdDevis(int idDevis) {
        this.idDevis = idDevis;
    }
    public String getLibelle() {
        return libelle;
    }
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    public String getUnite() {
        return unite;
    }
    public void setUnite(String unite) {
        this.unite = unite;
    }
    public double getQuantite() {
        return quantite;
    }
    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }
    public double getPrixUnitaire() {
        return prixUnitaire;
    }
    public void setPrixUnitaire(double prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }
    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }
    


}
