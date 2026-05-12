DROP DATABASE IF EXISTS forage;
CREATE DATABASE forage;
USE forage;

CREATE TABLE region(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200)
);
CREATE TABLE district (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200),
    id_region INT,
    FOREIGN KEY (id_region) REFERENCES region(id)
);

CREATE TABLE commune (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200),
    id_districte INT,
    FOREIGN KEY (id_districte) REFERENCES district(id)
);

CREATE TABLE client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200),
    prenom VARCHAR(200),
    adresse VARCHAR(200)
);

CREATE TABLE demande (
    id        INT PRIMARY KEY AUTO_INCREMENT,
    id_client INT,
    lieux VARCHAR(200),
    commune INT,
    reference VARCHAR(200) UNIQUE,
    FOREIGN KEY (commune) REFERENCES commune(id)
);
--- status 
CREATE TABLE status (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    status     VARCHAR(200)
  
);

CREATE TABLE demande_status (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    id_status  INT,
    id_demande INT,
    date_debut DATE,
    date_fin   DATE,
    FOREIGN KEY (id_status)  REFERENCES status(id),
    FOREIGN KEY (id_demande) REFERENCES demande(id)
);


CREATE TABLE devis (
    id int primary key auto_increment,
    id_demande int,
    observation varchar(255),
    created_at datetime,
    type_devis 
    type varchar(50),
    FOREIGN KEY (id_demande) REFERENCES demande(id)
);

CREATE TABLE devis_detail(
    id int primary key auto_increment,
    id_devis int,
    libelle varchar(255),
    quantite int,
    prix_unitaire decimal(10,2),
    montant decimal(10,2),
    FOREIGN KEY (id_devis) REFERENCES devis(id)
);
