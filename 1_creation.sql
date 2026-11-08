DROP SCHEMA IF EXISTS Ibis;
CREATE SCHEMA IF NOT EXISTS Ibis;
USE Ibis;

CREATE TABLE Hotels(
   id_pk INT,
   adresse VARCHAR(50) NOT NULL,
   Nom VARCHAR(50),
   numero_tel VARCHAR(50),
   mail VARCHAR(50),
   nombre_etoiles INT,
   PRIMARY KEY(id_pk),
   UNIQUE(adresse)
);

CREATE TABLE Chambre(
   numero INT,
   etage INT,
   type VARCHAR(50),
   etat VARCHAR(50),
   accesibilite BOOLEAN,
   libre VARCHAR(50),
   id_pk INT NOT NULL,
   PRIMARY KEY(id_pk, numero),
   FOREIGN KEY(id_pk) REFERENCES Hotels(id_pk)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employe(
   id INT,
   fonction VARCHAR(50),
   Horraire VARCHAR(50),
   mail VARCHAR(50),
   nom_prenom VARCHAR(50),
   tel VARCHAR(20),
   date_debut_contrat DATE,
   date_fin_contrat DATE,
   id_1 INT,
   id_pk INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES Employe(id)
      ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(id_pk) REFERENCES Hotels(id_pk)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Prestation(
   id_ VARCHAR(50),
   type VARCHAR(50),
   description VARCHAR(50),
   prix INT,
   PRIMARY KEY(id_)
);

CREATE TABLE Client(
   id INT,
   nom_prenom VARCHAR(50),
   mail VARCHAR(50),
   tel VARCHAR(20),
   carte_fidelite BOOLEAN,
   PRIMARY KEY(id)
);

CREATE TABLE Reservation(
   id_reservation INT,
   date_arrive DATE,
   date_depart DATE,
   nombre_personne INT,
   coût_chambre INT,
   regle BOOLEAN,
   id_client INT NOT NULL,
   id_pk INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_client) REFERENCES Client(id)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_pk) REFERENCES Hotels(id_pk)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Concerne(
   id_reservation INT,
   id_pk INT,
   numero INT,
   PRIMARY KEY(id_reservation, id_pk, numero),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_pk, numero) REFERENCES Chambre(id_pk, numero)
      ON DELETE CASCADE ON UPDATE CASCADE
);
