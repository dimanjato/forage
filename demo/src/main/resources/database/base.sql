-- DROP DATABASE IF EXISTS forage;

CREATE DATABASE forage;

use forage;

CREATE TABLE demande_status(
    id int primary key auto_increment,
    nom varchar(200),
    lieux varchar (200),
    reference varchar unique  
);

create table status_demande (
    id int primary key auto_increment,
    id_demande int ,
    jour_demande date 
    foreign key (id_demande) references demande_status(id)  
);
CREATE TABLE associatin(
   id int primary key, 
   id_status int,
   id_demande int ,
   date_debut date ,
   date_fin date 
   foreign key (id_status) references demande_status(id),
   foreign key (id_demande) references status_demande(id)
);
