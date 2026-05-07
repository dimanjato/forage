package com.example.demo.service;

import com.example.demo.model.Cheque;
import com.example.demo.repository.ChequeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ChequeService {

    @Autowired
    private ChequeRepository repo;

    public List<Cheque> getAll() {
        return repo.findAll();
    }

    public Cheque save(Cheque d) {
        return repo.save(d);
    }

    public Cheque getById(int id) {
        return repo.findById(id).orElse(null);
    }

    public void delete(int id) {
        repo.deleteById(id);
    }
}