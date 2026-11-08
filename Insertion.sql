USE Ibis;

-- ============================================================
-- 1. Hotels (5)
-- ============================================================
INSERT INTO Hotels (id_pk, adresse, Nom, numero_tel, mail, nombre_etoiles) VALUES
(1, '12 rue de Chalon, 75012 Paris', 'Ibis Paris Gare de Lyon', '0143456789', 'paris.gdl@ibis-demo.fr', 3),
(2, '8 place Charles Beraudier, 69003 Lyon', 'Ibis Lyon Part-Dieu', '0472123456', 'lyon.partdieu@ibis-demo.fr', 3),
(3, '15 quai du Port, 13002 Marseille', 'Ibis Marseille Vieux-Port', '0491234567', 'marseille.vieuxport@ibis-demo.fr', 2),
(4, '20 avenue des Quinconces, 33000 Bordeaux', 'Ibis Bordeaux Centre', '0556123456', 'bordeaux.centre@ibis-demo.fr', 3),
(5, '25 rue de Bethune, 59800 Lille', 'Ibis Lille Centre', '0320123456', 'lille.centre@ibis-demo.fr', 2);

-- ============================================================
-- 2. Chambre (30 = 6 par hotel)
-- ============================================================
INSERT INTO Chambre (numero, etage, type, etat, accesibilite, libre, id_pk) VALUES
-- Hotel 1
(101, 1, 'simple',    'propre',      TRUE,  'oui', 1),
(102, 1, 'double',    'propre',      FALSE, 'oui', 1),
(103, 1, 'twin',      'a_nettoyer',  FALSE, 'non', 1),
(201, 2, 'double',    'propre',      FALSE, 'oui', 1),
(202, 2, 'familiale', 'propre',      TRUE,  'oui', 1),
(203, 2, 'suite',     'maintenance', FALSE, 'non', 1),
-- Hotel 2
(101, 1, 'simple',    'propre',      TRUE,  'oui', 2),
(102, 1, 'double',    'propre',      FALSE, 'oui', 2),
(103, 1, 'twin',      'a_nettoyer',  FALSE, 'non', 2),
(201, 2, 'double',    'propre',      TRUE,  'oui', 2),
(202, 2, 'familiale', 'propre',      FALSE, 'oui', 2),
(203, 2, 'suite',     'propre',      FALSE, 'oui', 2),
-- Hotel 3
(101, 1, 'simple',    'propre',      TRUE,  'oui', 3),
(102, 1, 'double',    'propre',      FALSE, 'oui', 3),
(103, 1, 'twin',      'propre',      FALSE, 'oui', 3),
(201, 2, 'double',    'propre',      FALSE, 'oui', 3),
(202, 2, 'familiale', 'propre',      TRUE,  'oui', 3),
(203, 2, 'suite',     'maintenance', FALSE, 'non', 3),
-- Hotel 4
(101, 1, 'simple',    'propre',      TRUE,  'oui', 4),
(102, 1, 'double',    'propre',      FALSE, 'oui', 4),
(103, 1, 'twin',      'propre',      FALSE, 'oui', 4),
(201, 2, 'double',    'propre',      FALSE, 'oui', 4),
(202, 2, 'familiale', 'a_nettoyer',  TRUE,  'non', 4),
(203, 2, 'suite',     'propre',      FALSE, 'oui', 4),
-- Hotel 5
(101, 1, 'simple',    'propre',      TRUE,  'oui', 5),
(102, 1, 'double',    'propre',      FALSE, 'oui', 5),
(103, 1, 'twin',      'maintenance', FALSE, 'non', 5),
(201, 2, 'double',    'propre',      TRUE,  'non', 5),
(202, 2, 'familiale', 'propre',      FALSE, 'oui', 5),
(203, 2, 'suite',     'propre',      FALSE, 'oui', 5);

-- ============================================================
-- 3. Employe (15) : les directeurs d'abord (id_1 NULL),
--    puis les employes qui referencent un manager deja insere
-- ============================================================
INSERT INTO Employe (id, fonction, Horraire, mail, nom_prenom, tel, date_debut_contrat, date_fin_contrat, id_1, id_pk) VALUES
(1, 'directeur', '09h-17h', 'claire.dubois@ibis-demo.fr',  'Claire Dubois',  '0601020301', '2019-03-01', NULL, NULL, 1),
(2, 'directeur', '09h-17h', 'marc.lefevre@ibis-demo.fr',   'Marc Lefevre',   '0601020302', '2018-09-15', NULL, NULL, 2),
(3, 'directeur', '09h-17h', 'sophie.martin@ibis-demo.fr',  'Sophie Martin',  '0601020303', '2020-01-06', NULL, NULL, 3),
(4, 'directeur', '09h-17h', 'julien.bernard@ibis-demo.fr', 'Julien Bernard', '0601020304', '2021-05-03', NULL, NULL, 4),
(5, 'directeur', '09h-17h', 'nadia.benali@ibis-demo.fr',   'Nadia Benali',   '0601020305', '2017-11-20', NULL, NULL, 5);

INSERT INTO Employe (id, fonction, Horraire, mail, nom_prenom, tel, date_debut_contrat, date_fin_contrat, id_1, id_pk) VALUES
(6,  'gouvernante',      '07h-15h', 'isabelle.roux@ibis-demo.fr',  'Isabelle Roux',  '0612345601', '2020-02-10', NULL,         1, 1),
(7,  'femme_de_chambre', '07h-15h', 'amina.diallo@ibis-demo.fr',   'Amina Diallo',   '0612345602', '2023-06-01', '2027-05-31', 6, 1),
(8,  'receptionniste',   '15h-23h', 'lucas.moreau@ibis-demo.fr',   'Lucas Moreau',   '0612345603', '2022-04-11', NULL,         2, 2),
(9,  'technicien',       '09h-17h', 'karim.haddad@ibis-demo.fr',   'Karim Haddad',   '0612345604', '2021-10-04', NULL,         2, 2),
(10, 'receptionniste',   '23h-07h', 'emma.fournier@ibis-demo.fr',  'Emma Fournier',  '0612345605', '2024-01-15', '2026-12-31', 3, 3),
(11, 'technicien',       '09h-17h', 'paul.girard@ibis-demo.fr',    'Paul Girard',    '0612345606', '2019-09-02', NULL,         3, 3),
(12, 'receptionniste',   '07h-15h', 'chloe.lambert@ibis-demo.fr',  'Chloe Lambert',  '0612345607', '2022-08-22', NULL,         4, 4),
(13, 'femme_de_chambre', '07h-15h', 'fatou.sow@ibis-demo.fr',      'Fatou Sow',      '0612345608', '2025-03-03', '2027-03-02', 4, 4),
(14, 'receptionniste',   '15h-23h', 'hugo.mercier@ibis-demo.fr',   'Hugo Mercier',   '0612345609', '2023-11-13', NULL,         5, 5),
(15, 'technicien',       '09h-17h', 'lea.rousseau@ibis-demo.fr',   'Lea Rousseau',   '0612345610', '2025-09-01', NULL,         5, 5);

-- ============================================================
-- 4. Prestation (8)
-- ============================================================
INSERT INTO Prestation (id_, type, description, prix) VALUES
('PR01', 'restauration', 'Petit-dejeuner buffet', 14),
('PR02', 'service',      'Parking couvert', 12),
('PR03', 'transport',    'Navette aeroport', 25),
('PR04', 'restauration', 'Minibar', 8),
('PR05', 'service',      'Blanchisserie express', 15),
('PR06', 'restauration', 'Room service', 20),
('PR07', 'confort',      'Depart tardif (late check-out)', 10),
('PR08', 'confort',      'Lit bebe', 5);

-- ============================================================
-- 5. Client (20)
-- ============================================================
INSERT INTO Client (id, nom_prenom, mail, tel, carte_fidelite) VALUES
(1,  'Camille Garnier',   'camille.garnier@example.com',   '0678010101', TRUE),
(2,  'Antoine Lopez',     'antoine.lopez@example.com',     '0678010102', FALSE),
(3,  'Sarah Cohen',       'sarah.cohen@example.com',       '0678010103', TRUE),
(4,  'Mathieu Fontaine',  'mathieu.fontaine@example.com',  '0678010104', FALSE),
(5,  'Ines Morel',        'ines.morel@example.com',        '0678010105', FALSE),
(6,  'Nicolas Perrin',    'nicolas.perrin@example.com',    '0678010106', TRUE),
(7,  'Yasmine Khelifi',   'yasmine.khelifi@example.com',   '0678010107', TRUE),
(8,  'Pierre Gauthier',   'pierre.gauthier@example.com',   '0678010108', FALSE),
(9,  'Laura Rossi',       'laura.rossi@example.com',       '0678010109', FALSE),
(10, 'Maxime Chevalier',  'maxime.chevalier@example.com',  '0678010110', TRUE),
(11, 'Oceane Barbier',    'oceane.barbier@example.com',    '0678010111', FALSE),
(12, 'Thierry Marchand',  'thierry.marchand@example.com',  '0678010112', FALSE),
(13, 'Elodie Colin',      'elodie.colin@example.com',      '0678010113', TRUE),
(14, 'Samuel Roche',      'samuel.roche@example.com',      '0678010114', FALSE),
(15, 'Anais Lemoine',     'anais.lemoine@example.com',     '0678010115', FALSE),
(16, 'Bastien Noel',      'bastien.noel@example.com',      '0678010116', TRUE),
(17, 'Manon Duval',       'manon.duval@example.com',       '0678010117', FALSE),
(18, 'Omar Traore',       'omar.traore@example.com',       '0678010118', FALSE),
(19, 'Julie Vidal',       'julie.vidal@example.com',       '0678010119', TRUE),
(20, 'Romain Boyer',      'romain.boyer@example.com',      '0678010120', FALSE);

-- ============================================================
-- 6. Reservation (25)
-- ============================================================
INSERT INTO Reservation (id_reservation, date_arrive, date_depart, nombre_personne, `coût_chambre`, regle, id_client, id_pk) VALUES
(1,  '2026-01-10', '2026-01-12', 2, 190, TRUE,  1,  1),
(2,  '2026-02-14', '2026-02-16', 2, 190, TRUE,  2,  2),
(3,  '2026-03-05', '2026-03-08', 1, 210, TRUE,  3,  3),
(4,  '2026-03-20', '2026-03-23', 4, 390, TRUE,  4,  1),
(5,  '2026-04-02', '2026-04-04', 2, 190, TRUE,  5,  4),
(6,  '2026-04-18', '2026-04-21', 2, 285, TRUE,  6,  5),
(7,  '2026-05-01', '2026-05-05', 2, 720, TRUE,  7,  2),
(8,  '2026-05-22', '2026-05-24', 1, 140, TRUE,  8,  3),
(9,  '2026-06-10', '2026-06-14', 4, 520, TRUE,  9,  4),
(10, '2026-06-27', '2026-06-29', 2, 190, TRUE,  10, 1),
(11, '2026-07-08', '2026-07-15', 2, 665, TRUE,  11, 5),
(12, '2026-07-14', '2026-07-17', 2, 285, TRUE,  12, 2),
(13, '2026-07-25', '2026-07-28', 5, 675, TRUE,  13, 3),
(14, '2026-08-03', '2026-08-07', 2, 380, TRUE,  14, 4),
(15, '2026-08-15', '2026-08-18', 1, 210, TRUE,  15, 1),
(16, '2026-08-29', '2026-09-01', 2, 285, TRUE,  16, 5),
(17, '2026-09-12', '2026-09-14', 2, 190, TRUE,  1,  3),
(18, '2026-09-26', '2026-09-29', 3, 495, TRUE,  17, 2),
(19, '2026-10-10', '2026-10-12', 2, 190, TRUE,  18, 4),
(20, '2026-10-24', '2026-10-27', 2, 285, TRUE,  2,  1),
(21, '2026-11-06', '2026-11-10', 2, 380, FALSE, 19, 5),
(22, '2026-11-15', '2026-11-18', 4, 390, FALSE, 3,  2),
(23, '2026-11-28', '2026-12-02', 2, 380, FALSE, 20, 3),
(24, '2026-12-20', '2026-12-27', 4, 910, FALSE, 4,  1),
(25, '2026-12-30', '2027-01-02', 2, 285, FALSE, 7,  4);

-- ============================================================
-- 7. Concerne (27) : chaque chambre appartient a l'hotel de la reservation
-- ============================================================
INSERT INTO Concerne (id_reservation, id_pk, numero) VALUES
(1,  1, 102),
(2,  2, 201),
(3,  3, 101),
(4,  1, 202),
(5,  4, 102),
(6,  5, 103),
(7,  2, 203),
(8,  3, 101),
(9,  4, 202),
(10, 1, 201),
(11, 5, 201),
(12, 2, 102),
(13, 3, 202),
(13, 3, 201),
(14, 4, 201),
(15, 1, 101),
(16, 5, 102),
(17, 3, 102),
(18, 2, 103),
(18, 2, 101),
(19, 4, 103),
(20, 1, 102),
(21, 5, 201),
(22, 2, 202),
(23, 3, 201),
(24, 1, 202),
(25, 4, 102);