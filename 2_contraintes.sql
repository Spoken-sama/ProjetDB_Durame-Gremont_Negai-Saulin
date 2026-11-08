USE Ibis;

-- HOTELS
ALTER TABLE Hotels
ADD CONSTRAINT chk_hotel_etoiles
CHECK (nombre_etoiles BETWEEN 1 AND 5);

ALTER TABLE Hotels
ADD CONSTRAINT chk_hotel_mail
CHECK (mail LIKE '%@%');

ALTER TABLE Hotels
ADD CONSTRAINT chk_hotel_tel
CHECK (LENGTH(numero_tel) = 10);


-- CHAMBRE
ALTER TABLE Chambre
ADD CONSTRAINT chk_chambre_etage
CHECK (etage >= 0);

ALTER TABLE Chambre
ADD CONSTRAINT chk_chambre_etat
CHECK (etat IN ('propre', 'a_nettoyer', 'maintenance'));

ALTER TABLE Chambre
ADD CONSTRAINT chk_chambre_type
CHECK (type IN ('simple', 'double', 'twin', 'familiale', 'suite'));

ALTER TABLE Chambre
ADD CONSTRAINT chk_chambre_libre
CHECK (libre IN ('oui', 'non'));


-- EMPLOYE
ALTER TABLE Employe
ADD CONSTRAINT chk_employe_mail
CHECK (mail LIKE '%@%');

ALTER TABLE Employe
ADD CONSTRAINT chk_employe_tel
CHECK (LENGTH(tel) = 10);

ALTER TABLE Employe
ADD CONSTRAINT chk_employe_dates
CHECK (
    date_fin_contrat IS NULL
    OR date_fin_contrat > date_debut_contrat
);


-- CLIENT
ALTER TABLE Client
ADD CONSTRAINT chk_client_mail
CHECK (mail LIKE '%@%');

ALTER TABLE Client
ADD CONSTRAINT chk_client_tel
CHECK (LENGTH(tel) = 10);


-- PRESTATION
ALTER TABLE Prestation
ADD CONSTRAINT chk_prestation_prix
CHECK (prix > 0);


-- RESERVATION
ALTER TABLE Reservation
ADD CONSTRAINT chk_reservation_personnes
CHECK (nombre_personne > 0);

ALTER TABLE Reservation
ADD CONSTRAINT chk_reservation_dates
CHECK (date_depart > date_arrive);

ALTER TABLE Reservation
ADD CONSTRAINT chk_reservation_cout
CHECK (`coût_chambre` > 0);
