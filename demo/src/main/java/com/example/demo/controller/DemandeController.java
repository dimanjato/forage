package com.example.demo.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.Demande;
import com.example.demo.repository.ClientRepository;
import com.example.demo.repository.CommuneRepository;
import com.example.demo.repository.StatusRepository;
import com.example.demo.service.DemandeService;

@Controller
public class DemandeController {

    private final DemandeService demandeService;
    private final StatusRepository statusRepository;
    private final ClientRepository clientRepository;
    private final CommuneRepository communeRepository;

    public DemandeController(
            DemandeService demandeService,
            StatusRepository statusRepository,
            ClientRepository clientRepository,
            CommuneRepository communeRepository) {
        this.demandeService = demandeService;
        this.statusRepository = statusRepository;
        this.clientRepository = clientRepository;
        this.communeRepository = communeRepository;
    }

    @GetMapping("/demande/form")
    public String showForm(Model model) {
        model.addAttribute("demande", new Demande());
        model.addAttribute("clients", clientRepository.findAll());
        model.addAttribute("communes", communeRepository.findAll());
        model.addAttribute("statuses", statusRepository.findAll());
        return "demande_form";
    }

    @PostMapping("/demande/save")
    public String saveDemande(
            @ModelAttribute Demande demande,
            @RequestParam int idStatus,
            @RequestParam Date dateDebut,
            RedirectAttributes redirectAttributes) {
        demandeService.saveDemandeAvecStatus(demande, idStatus, dateDebut);
        redirectAttributes.addFlashAttribute("success", "Demande enregistree avec son status.");
        return "redirect:/demande/form";
    }
}
