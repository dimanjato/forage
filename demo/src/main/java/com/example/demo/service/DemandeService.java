package com.example.demo.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Demande;
import com.example.demo.model.DemandeStatus;
import com.example.demo.repository.DemandeRepository;
import com.example.demo.repository.DemandeStatusRepository;

@Service
public class DemandeService {

    private final DemandeRepository demandeRepository;
    private final DemandeStatusRepository demandeStatusRepository;

    public DemandeService(DemandeRepository demandeRepository, DemandeStatusRepository demandeStatusRepository) {
        this.demandeRepository = demandeRepository;
        this.demandeStatusRepository = demandeStatusRepository;
    }

    @Transactional
    public Demande saveDemandeAvecStatus(Demande demande, int idStatus, java.sql.Date dateDebut) {
        Demande savedDemande = demandeRepository.save(demande);

        DemandeStatus demandeStatus = new DemandeStatus();
        demandeStatus.setIdDemande(savedDemande.getId());
        demandeStatus.setIdStatus(idStatus);
        demandeStatus.setDateDebut(dateDebut != null ? dateDebut : java.sql.Date.valueOf(LocalDate.now()));
        demandeStatus.setDateFin(null);

        demandeStatusRepository.save(demandeStatus);

        return savedDemande;
    }
}
