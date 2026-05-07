package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.*;
import com.example.demo.service.*;

@Controller
public class ChequeController {

    @Autowired
    private ChequeService chequeService;

    @GetMapping("/")
    public ModelAndView home() {
        List<Cheque> cheques = chequeService.getAll();
        ModelAndView mv = new ModelAndView("home");
        mv.addObject("cheques", cheques);
        return mv;
    }
}