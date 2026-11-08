USE Ibis;
-- 4_interrogation.sql : interrogation de la base Ibis
--
-- Utilisateur : le directeur d'exploitation du reseau Ibis
-- Contexte    : preparation du bilan de fin d'annee 2026 et de la
--               campagne de fidelisation de fin d'annee
-- scenario complet dans le README


-- 1. projections et sélections, avec tri, données uniques et utilisation de masques, IN, BETWEEN (au moins 5)

-- Donnee recherchee : les hotels 3 etoiles du reseau, avec leurs coordonnees, par ordre alphabetique
SELECT Nom, adresse, numero_tel
FROM Hotels
WHERE nombre_etoiles = 3
ORDER BY Nom;

-- Donnee recherchee : la liste des fonctions occupees dans le reseau, sans doublon
SELECT DISTINCT fonction
FROM Employe
ORDER BY fonction;

-- Donnee recherchee : les clients dont le nom commence par M (masque LIKE), pour un envoi cible
SELECT nom_prenom, mail
FROM Client
WHERE nom_prenom LIKE 'M%'
ORDER BY nom_prenom;

-- Donnee recherchee : les reservations dont l'arrivee tombe en ete 2026 (BETWEEN), de la plus ancienne a la plus recente
SELECT id_reservation, date_arrive, date_depart, nombre_personne, `coût_chambre`
FROM Reservation
WHERE date_arrive BETWEEN '2026-06-21' AND '2026-09-22'
ORDER BY date_arrive;

-- Donnee recherchee : les chambres de type suite ou familiale (IN) qui ne sont pas en maintenance
SELECT id_pk, numero, type, etat
FROM Chambre
WHERE type IN ('suite', 'familiale')
  AND etat <> 'maintenance'
ORDER BY id_pk, numero;

-- Donnee recherchee : les reservations non reglees, de la plus chere a la moins chere (a relancer en priorite)
SELECT id_reservation, id_client, date_arrive, `coût_chambre`
FROM Reservation
WHERE regle = FALSE
ORDER BY `coût_chambre` DESC;


-- 2. fonctions d’agrégation permettant de calculer des statistiques, utilisées avec GROUP BY et HAVING, (au moins 5)



-- donnee recherchee : le nombre de chambres de chaque type dans le reseau
SELECT type, COUNT(*) AS nb_chambres
FROM Chambre
GROUP BY type
ORDER BY nb_chambres DESC;

-- Donnee recherchee : le chiffre d'affaires encaisse par hotel, pour les hotels depassant 1000 euros
SELECT id_pk, SUM(`coût_chambre`) AS ca_encaisse
FROM Reservation
WHERE regle = TRUE
GROUP BY id_pk
HAVING SUM(`coût_chambre`) > 1000
ORDER BY ca_encaisse DESC;

-- Donnee recherchee : statistiques globales sur le cout des reservations (nombre, total, moyenne, minimum, maximum)
SELECT COUNT(*)              AS nb_reservations,
       SUM(`coût_chambre`)   AS total,
       ROUND(AVG(`coût_chambre`), 2) AS moyenne,
       MIN(`coût_chambre`)   AS minimum,
       MAX(`coût_chambre`)   AS maximum
FROM Reservation;

-- Donnee recherchee : les clients ayant effectue au moins 2 reservations (clients fideles)
SELECT id_client, COUNT(*) AS nb_reservations
FROM Reservation
GROUP BY id_client
HAVING COUNT(*) >= 2
ORDER BY nb_reservations DESC, id_client;

-- Donnee recherchee : la duree moyenne de sejour (en nuits) par hotel
SELECT id_pk, ROUND(AVG(DATEDIFF(date_depart, date_arrive)), 2) AS duree_moyenne_nuits
FROM Reservation
GROUP BY id_pk
ORDER BY duree_moyenne_nuits DESC;

-- Donnee recherchee : le prix moyen des prestations par type, pour les types dont la moyenne depasse 10 euros
SELECT type, ROUND(AVG(prix), 2) AS prix_moyen
FROM Prestation
GROUP BY type
HAVING AVG(prix) > 10
ORDER BY prix_moyen DESC;


-- 3. jointures internes, externes, simples, multiples,… (au moins 5)

-- Donnee recherchee : pour chaque reservation, le nom du client et le nom de l'hotel
SELECT r.id_reservation, c.nom_prenom, h.Nom AS hotel, r.date_arrive, r.`coût_chambre`
FROM Reservation r
JOIN Client c ON c.id = r.id_client
JOIN Hotels h ON h.id_pk = r.id_pk
ORDER BY r.date_arrive;

-- Donnee recherchee : pour chaque reservation, les chambres reservees (numero et type) et le client
SELECT r.id_reservation, c.nom_prenom, ch.id_pk, ch.numero, ch.type
FROM Reservation r
JOIN Concerne co ON co.id_reservation = r.id_reservation
JOIN Chambre ch  ON ch.id_pk = co.id_pk AND ch.numero = co.numero
JOIN Client c    ON c.id = r.id_client
ORDER BY r.id_reservation, ch.numero;

-- Donnee recherchee : le nombre de fois que chaque chambre a ete reservee, y compris les chambres jamais reservees (0)
SELECT h.Nom AS hotel, ch.numero, COUNT(co.id_reservation) AS nb_reservations
FROM Chambre ch
JOIN Hotels h ON h.id_pk = ch.id_pk
LEFT JOIN Concerne co ON co.id_pk = ch.id_pk AND co.numero = ch.numero
GROUP BY h.Nom, ch.id_pk, ch.numero
ORDER BY nb_reservations, h.Nom, ch.numero;

-- Donnee recherchee : chaque employe avec le nom de son manager (NULL pour les directeurs)
SELECT e.nom_prenom AS employe, e.fonction, m.nom_prenom AS manager
FROM Employe e
LEFT JOIN Employe m ON m.id = e.id_1
ORDER BY e.id;

-- Donnee recherchee : le nombre de reservations de chaque hotel (tous les hotels sont listes, meme sans reservation)
SELECT h.Nom AS hotel, COUNT(r.id_reservation) AS nb_reservations
FROM Reservation r
RIGHT JOIN Hotels h ON h.id_pk = r.id_pk
GROUP BY h.id_pk, h.Nom
ORDER BY nb_reservations DESC;

-- Donnee recherchee : le nombre de nuitees-chambres vendues par hotel (indicateur d'occupation)
SELECT h.Nom AS hotel, SUM(DATEDIFF(r.date_depart, r.date_arrive)) AS nuitees_vendues
FROM Hotels h
JOIN Reservation r ON r.id_pk = h.id_pk
JOIN Concerne co   ON co.id_reservation = r.id_reservation
GROUP BY h.id_pk, h.Nom
ORDER BY nuitees_vendues DESC;

-- 4. requêtes imbriquées avec (NOT) IN, (NOT) EXISTS, ANY, ALL,… (au moins 5)

-- Donnee recherchee : les clients ayant deja reserve a l'hotel Ibis Lyon Part-Dieu
SELECT id, nom_prenom
FROM Client
WHERE id IN (SELECT r.id_client
             FROM Reservation r
             JOIN Hotels h ON h.id_pk = r.id_pk
             WHERE h.Nom = 'Ibis Lyon Part-Dieu')
ORDER BY nom_prenom;

-- Donnee recherchee : les employes qui ne sont le manager de personne
SELECT id, nom_prenom, fonction
FROM Employe
WHERE id NOT IN (SELECT id_1 FROM Employe WHERE id_1 IS NOT NULL)
ORDER BY id;

-- Donnee recherchee : les hotels ayant au moins une chambre en maintenance
SELECT h.Nom
FROM Hotels h
WHERE EXISTS (SELECT 1
              FROM Chambre ch
              WHERE ch.id_pk = h.id_pk
                AND ch.etat = 'maintenance');

-- Donnee recherchee : les chambres qui n'ont jamais ete reservees
SELECT ch.id_pk, ch.numero, ch.type
FROM Chambre ch
WHERE NOT EXISTS (SELECT 1
                  FROM Concerne co
                  WHERE co.id_pk = ch.id_pk
                    AND co.numero = ch.numero)
ORDER BY ch.id_pk, ch.numero;

-- Donnee recherchee : les reservations plus cheres que toutes les reservations de l'hotel de Marseille
SELECT id_reservation, id_pk, `coût_chambre`
FROM Reservation
WHERE `coût_chambre` > ALL (SELECT r2.`coût_chambre`
                            FROM Reservation r2
                            JOIN Hotels h ON h.id_pk = r2.id_pk
                            WHERE h.Nom = 'Ibis Marseille Vieux-Port')
ORDER BY `coût_chambre` DESC;

-- Donnee recherchee : les prestations plus cheres qu'au moins une prestation de type confort
SELECT id_, description, prix
FROM Prestation
WHERE prix > ANY (SELECT prix FROM Prestation WHERE type = 'confort')
ORDER BY prix DESC;

-- Donnee recherchee : les reservations dont le cout depasse la moyenne de toutes les reservations
SELECT id_reservation, `coût_chambre`
FROM Reservation
WHERE `coût_chambre` > (SELECT AVG(`coût_chambre`) FROM Reservation)
ORDER BY `coût_chambre` DESC;

-- Donnee recherchee : pour chaque hotel, la reservation la plus chere
SELECT r.id_pk, r.id_reservation, r.`coût_chambre`
FROM Reservation r
WHERE r.`coût_chambre` = (SELECT MAX(r2.`coût_chambre`)
                          FROM Reservation r2
                          WHERE r2.id_pk = r.id_pk)
ORDER BY r.id_pk;


-- 5. requête utilisant au moins 3 opérateurs différents de l’algèbre relationnelle

-- Donnee recherchee : les clients fideles (carte de fidelite) ayant une reservation non reglee, avec leur mail et la date d'arrivee, pour la campagne de relance
SELECT c.nom_prenom, c.mail, r.date_arrive
FROM Client c
JOIN Reservation r ON r.id_client = c.id
WHERE c.carte_fidelite = TRUE
  AND r.regle = FALSE;
