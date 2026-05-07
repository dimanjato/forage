package com.example.demo.controller;

import com.example.demo.model.Commune;
import com.example.demo.repository.CommuneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommuneController {

    @Autowired
    private CommuneRepository communeRepository;

    @GetMapping("/commune/form")
    public String showForm() {
        return "commune_form";
    }

    @PostMapping("/commune/save")
    public String saveCommune(@ModelAttribute Commune commune) {
        communeRepository.save(commune);
        return "redirect:/commune/form";
    }
}
