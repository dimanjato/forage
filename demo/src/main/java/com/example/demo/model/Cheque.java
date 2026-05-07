package com.example.demo.model;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "Cheque")
public class Cheque {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCheque")
    private int idCheque;

    @Column(name = "numCheque")
    private String numCheque;

    @Column(name = "numCompte")
    private String numCompte;

    @Column(name = "datevalide")
    private LocalDate datevalide;

    public int getIdCheque() {
        return idCheque;
    }
    public void setIdCheque(int idCheque) {
        this.idCheque = idCheque;
    }

    public String getNumCheque() {
        return numCheque;
    }
    public void setNumCheque(String numCheque) {
        this.numCheque = numCheque;
    }

    public String getNumCompte() {
        return numCompte;
    }
    public void setNumCompte(String numCompte) {
        this.numCompte = numCompte;
    }

    public LocalDate getDatevalide() {
        return datevalide;
    }
    public void setDatevalide(LocalDate datevalide) {
        this.datevalide = datevalide;
    }

}
