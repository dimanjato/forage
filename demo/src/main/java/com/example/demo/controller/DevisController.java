package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.demo.model.Demande; // Assurez-vous que Demande.java existe

import com.example.demo.repository.DemandeRepository;
import com.example.demo.service.DevisService;

@Controller
public class DevisController {

    private final DemandeRepository demandeRepository;
    private final DevisService devisService;

    public DevisController(DemandeRepository demandeRepository, DevisService devisService) {
        this.demandeRepository = demandeRepository;
        this.devisService = devisService;
    }

    @GetMapping("/devis/form")
    public String showForm(
            @RequestParam(required = false) Integer idDemande,
            @RequestParam(required = false) Integer idDevis, // Nouveau paramètre pour sélectionner un en-tête de devis spécifique
            Model model) {

        model.addAttribute("demandes", demandeRepository.findAll());
        model.addAttribute("idDemande", idDemande);
        model.addAttribute("idDevis", idDevis); // Ajoute l'ID du devis sélectionné au modèle

        if (idDemande != null) {
            Optional<Demande> demandeOpt = demandeRepository.findById(idDemande);
            if (demandeOpt.isPresent()) {
                Demande demandeSelectionnee = demandeOpt.get();
                model.addAttribute("demandeSelectionnee", demandeSelectionnee);

                // Récupère tous les en-têtes de devis pour la demande sélectionnée
                List<com.example.demo.model.Devis> devisHeaders = devisService.findDevisHeadersByDemande(idDemande);
                model.addAttribute("devisHeaders", devisHeaders);

                // Si un en-tête de devis spécifique est sélectionné, charge ses détails
                if (idDevis != null && idDevis != 0) { // Vérifie aussi pour 0, si utilisé pour "nouveau"
                    Optional<com.example.demo.model.Devis> selectedDevisHeader = devisHeaders.stream()
                                                                      .filter(d -> d.getId() == idDevis)
                                                                      .findFirst();
                    if (selectedDevisHeader.isPresent()) {
                        model.addAttribute("devisSelectionne", selectedDevisHeader.get());
                        model.addAttribute("devisDetails", devisService.findDevisDetailsByDevisId(idDevis));
                    } else {
                        // Gérer le cas où idDevis est fourni mais non trouvé pour l'idDemande
                        model.addAttribute("error", "En-tête de devis non trouvé pour la demande sélectionnée.");
                    }
                }
            } else {
                model.addAttribute("error", "Demande non trouvée.");
            }
        }

        return "devis_form";
    }

    @PostMapping("/devis/save")
    public String saveDevis( // Gère maintenant la création/sélection de l'en-tête et l'enregistrement des détails
            @RequestParam int idDemande,
            @RequestParam(required = false) Integer idDevis, // Peut être null si on crée un nouvel en-tête de devis
            @RequestParam(required = false) String observation, // Nouveau champ pour l'en-tête de devis
            @RequestParam(required = false) String typeDevis, // Nouveau champ pour l'en-tête de devis
            @RequestParam("designation") List<String> designations,
            @RequestParam("unite") List<String> unites,
            @RequestParam("quantite") List<String> quantites,
            @RequestParam("prixUnitaire") List<String> prixUnitaires,
            RedirectAttributes redirectAttributes) {

        try {
            // Récupère ou crée l'en-tête de devis
            com.example.demo.model.Devis devisHeader = devisService.getOrCreateDevisHeader(idDemande, Optional.ofNullable(idDevis), observation, typeDevis);

            // Enregistre les détails du devis liés à l'en-tête de devis
            List<?> saved = devisService.saveLignes(devisHeader.getId(), designations, unites, quantites, prixUnitaires);
            redirectAttributes.addFlashAttribute("success", saved.size() + " ligne(s) de devis enregistrée(s) pour le devis ID " + devisHeader.getId() + ".");
            return "redirect:/devis/form?idDemande=" + idDemande + "&idDevis=" + devisHeader.getId();
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/devis/form?idDemande=" + idDemande; // Redirige vers la sélection de demande si l'en-tête n'est pas trouvé
        } catch (Exception e) {
            // Capture toute autre erreur inattendue lors de l'enregistrement
            redirectAttributes.addFlashAttribute("error", "Une erreur est survenue lors de l'enregistrement du devis : " + e.getMessage());
            // Tente de rediriger vers l'état actuel si possible
            return "redirect:/devis/form?idDemande=" + idDemande + (idDevis != null ? "&idDevis=" + idDevis : "");
        }
    }
}
