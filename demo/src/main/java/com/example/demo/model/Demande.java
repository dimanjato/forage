package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table (name = "demande")

public class Demande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id")
    private int id;

    @Column (name = "id_client")
    private int idClient;

    @Column (name = "lieux")
    private String lieux;

    @Column (name = "commune")
    private int commune;

    @Column (name = "reference")
    private String reference;

    @ManyToOne
    @JoinColumn(name = "commune", insertable = false, updatable = false)
    private Commune communeObj;

    @ManyToOne
    @JoinColumn(name = "id_client", insertable = false, updatable = false)
    private Client client;

    // geter et setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getIdClient() {
        return idClient;
    }
    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public String getLieux() {
        return lieux;
    }
    public void setLieux(String lieux) {
        this.lieux = lieux;
    }

    public String getReference() {
        return reference;
    }
    public void setReference(String reference) {
        this.reference = reference;
    }

    public void setCommune(int commune) {
        this.commune = commune;
    }
    public int getCommune() {
        return commune;
    }

    public Commune getCommuneObj() {
        return communeObj;
    }

    public void setCommuneObj(Commune communeObj) {
        this.communeObj = communeObj;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }
}
