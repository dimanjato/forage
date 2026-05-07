package com.example.demo.service;

import java.time.LocalDate;

import com.example.demo.model.Status;

public class DemandeService {

    // creer la status_demande lie
    public void createStatusDemande(int idDemande, String statusStr) {
        Status status = new Status();
        status.setIdDemande(idDemande);
        status.setStatus(statusStr);
        status.setJourDemande(java.sql.Date.valueOf(LocalDate.now())); // Utilise la date actuelle
        // Enregistrer le status dans la base de données
        // StatusRepository.save(status); // Assurez-vous d'avoir un repository pour Status
    }
}
