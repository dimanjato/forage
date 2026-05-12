package com.example.demo.service;

import com.example.demo.model.Devis;
import com.example.demo.model.Devisdetails;
import com.example.demo.repository.DevisRepository;
import com.example.demo.repository.DevisdetailsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class DevisService {

    private final DevisRepository devisRepository;
    private final DevisdetailsRepository devisdetailsRepository;

    public DevisService(DevisRepository devisRepository, DevisdetailsRepository devisdetailsRepository) {
        this.devisRepository = devisRepository;
        this.devisdetailsRepository = devisdetailsRepository;
    }

    // Trouve tous les en-têtes de devis pour une demande donnée
    public List<Devis> findDevisHeadersByDemande(int idDemande) {
        return devisRepository.findByIdDemande(idDemande);
    }

    // Trouve les détails d'un devis pour un en-tête de devis donné
    public List<Devisdetails> findDevisDetailsByDevisId(int idDevis) {
        return devisdetailsRepository.findByIdDevis(idDevis);
    }

    // Crée ou récupère un en-tête de devis
    @Transactional
    public Devis getOrCreateDevisHeader(int idDemande, Optional<Integer> idDevisOpt, String observation, String typeDevis) {
        Devis devisHeader;
        if (idDevisOpt.isPresent() && idDevisOpt.get() != 0) { // Si un ID de devis est fourni et n'est pas 0 (pour "nouveau")
            devisHeader = devisRepository.findById(idDevisOpt.get())
                                         .orElseThrow(() -> new IllegalArgumentException("En-tête de devis non trouvé avec l'ID : " + idDevisOpt.get()));
        } else { // Créer un nouvel en-tête de devis
            devisHeader = new Devis();
            devisHeader.setIdDemande(idDemande);
            devisHeader.setObservation(observation);
            devisHeader.setTypeDevis(typeDevis);
            devisHeader.setCreatedAt(LocalDateTime.now());
            devisHeader = devisRepository.save(devisHeader);
        }
        return devisHeader;
    }

    @Transactional
    public List<Devisdetails> saveLignes(int idDevis, List<String> designations, List<String> unites,
                                         List<String> quantites, List<String> prixUnitaires) {
        List<Devisdetails> savedLignes = new ArrayList<>();

        for (int i = 0; i < designations.size(); i++) { // Parcourir toutes les lignes potentielles
            String designation = designations.get(i);
            String unite = (i < unites.size()) ? unites.get(i) : ""; // Gérer les incohérences de taille de liste
            String qteStr = (i < quantites.size()) ? quantites.get(i) : "";
            String puStr = (i < prixUnitaires.size()) ? prixUnitaires.get(i) : "";

            // Enregistrer uniquement les lignes qui ont au moins une désignation, une quantité et un prix unitaire non vides
            if (!designation.trim().isEmpty() && !qteStr.trim().isEmpty() && !puStr.trim().isEmpty()) {
                Devisdetails detail = new Devisdetails();
                detail.setIdDevis(idDevis); // Maintenant lié à l'ID réel de l'en-tête de devis
                detail.setLibelle(designation);
                detail.setUnite(unite);

                try {
                    double qte = Double.parseDouble(qteStr);
                    double pu = Double.parseDouble(puStr);
                    detail.setQuantite(qte);
                    detail.setPrixUnitaire(pu);
                    detail.setMontant(qte * pu);
                    savedLignes.add(devisdetailsRepository.save(detail));
                } catch (NumberFormatException e) {
                    // Gérer les erreurs de format de nombre. Pour l'instant, affichage dans la console.
                    System.err.println("Format de nombre invalide pour la quantité ou le prix unitaire dans DevisService: " + e.getMessage());
                    // Optionnellement, lancer une exception personnalisée ou ajouter un message d'erreur à afficher à l'utilisateur
                }
            }
        }
        return savedLignes;
    }
}