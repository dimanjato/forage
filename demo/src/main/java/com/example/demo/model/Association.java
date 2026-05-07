package com.example.demo.model;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name ="association")
public class Association {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column (name = "id")
    private int id;
    @Column (name = "id_status")
    private int id_status ;
    @Column(name = "id_demande")
    private int id_demande;
    @Column (name = "date_debut" )
    private Date date_debut;
    @Column (name = "date_fin")
    private Date date_fin;

    // getter et setter 
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id= id;
    }
    
    public int getId_status(){
        return id_status;
    }
    public void setId_status(int id_status){
        this.id_status =id_status;

    }

    public int getId_demande(){
        return id_demande;
    }
    public void setId_demande(int id_demande){
        this.id_demande = id_demande;
    }

    public Date getDate_debut(){
        return date_debut;
    }
    public void setDate_debut(Date date_debut){
        this.date_debut = date_debut;
    }

    public Date getDate_fin(){
        return date_fin;
    }
    public void setDate_fin(Date date_fin){
        this.date_fin = date_fin;
    }
}
