# Projet MERISE — Gestion d'une chaîne hôtelière

## 1. Prompt utilisé

Tu travailles dans le domaine de l’hôtellerie. Ton entreprise a comme activité de proposer des services d’hébergement et des prestations complémentaires à ses clients. C’est une entreprise comme Ibis, Novotel ou encore Mercure. Les données ont été collectées sur les hôtels, les chambres, les employés, les clients, les réservations, les prestations proposées et les incidents rencontrés dans les établissements. Inspire-toi du site web suivant : https://all.accor.com/

Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.

D’abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

Fournis donc les règles de gestion et le dictionnaire de données.


---

## 2. Règles de gestion de l'entreprise hôtelière

L'entreprise est une chaîne hôtelière comparable à Ibis ou Novotel, qui propose des hébergements et des prestations complémentaires. Elle gère plusieurs établissements, leurs chambres, leurs employés, leurs clients, les réservations et les incidents.

Les règles suivantes décrivent le fonctionnement de l'entreprise du point de vue métier, sans imposer de choix de conception informatique.

### A. Hôtels et chambres

- L'entreprise possède ou exploite plusieurs hôtels, chacun identifié par un nom, une adresse et un classement en étoiles.
- Chaque hôtel dispose de ses propres coordonnées téléphoniques et électroniques.
- Un hôtel comprend plusieurs chambres, chacune possédant un numéro, un étage et un type (simple, double, familiale, suite, etc.).
- Chaque chambre appartient à un seul hôtel.
- Une chambre possède des caractéristiques particulières, notamment son accessibilité aux personnes à mobilité réduite.
- Chaque chambre possède un état indiquant si elle est disponible, occupée, en nettoyage ou hors service.
- Le tarif d'une chambre dépend de son type, de l'hôtel, de la période et des conditions de réservation.

### B. Employés

- Chaque hôtel emploie plusieurs personnes pour assurer son fonctionnement quotidien.
- Chaque employé est rattaché à un seul hôtel à un instant donné.
- Chaque employé possède des informations permettant de l'identifier et de le contacter.
- Chaque employé occupe un poste, par exemple réceptionniste, responsable, technicien de maintenance ou personnel d'entretien.
- Les employés peuvent intervenir dans le traitement des incidents rencontrés dans les hôtels.

### C. Clients

- L'entreprise accueille des clients qui peuvent réserver une ou plusieurs chambres au sein de ses établissements.
- Chaque client possède des informations d'identification et des coordonnées permettant de le contacter.
- Un client peut effectuer plusieurs réservations au fil du temps.
- Une réservation est associée à un seul client responsable de celle-ci, même si plusieurs personnes occupent les chambres réservées.
- Les informations du client doivent permettre de retrouver ses réservations et de gérer les échanges avec lui.

### D. Réservations et séjours

- Chaque réservation concerne un hôtel et est effectuée par un client.
- Une réservation comporte une date de création, une date d'arrivée prévue et une date de départ prévue.
- Une réservation peut concerner une ou plusieurs chambres, selon les besoins du client.
- Une chambre peut faire l'objet de plusieurs réservations à des dates différentes.
- Une même chambre ne peut pas être attribuée à deux réservations incompatibles sur une même période.
- Chaque réservation possède un statut, par exemple en attente, confirmée, annulée ou terminée.
- Le prix d'une réservation dépend des chambres réservées, de la durée du séjour et des conditions tarifaires applicables.
- Le nombre de personnes accueillies doit être compatible avec la capacité des chambres réservées.
- Les dates d'arrivée et de départ doivent respecter les conditions de séjour de l'établissement.

### E. Prestations complémentaires

- Les hôtels proposent des prestations complémentaires à l'hébergement, telles que le petit-déjeuner, le parking, le spa ou le service en chambre.
- Chaque prestation possède un nom, une description et un tarif.
- Les prestations disponibles peuvent varier d'un hôtel à un autre.
- Un client peut demander plusieurs prestations au cours de son séjour.
- Une prestation peut être demandée par plusieurs clients.
- Le montant des prestations consommées doit pouvoir être associé au séjour ou à la réservation correspondante.

### F. Incidents

- Des incidents peuvent survenir dans les établissements, par exemple une panne de climatisation, un problème de plomberie ou un dysfonctionnement informatique.
- Chaque incident est décrit par une date de signalement, une description et un niveau de gravité.
- Chaque incident concerne un hôtel et peut, lorsque cela est pertinent, concerner une chambre précise.
- Un incident peut être signalé par un employé ou par un client.
- Un incident peut être pris en charge par un ou plusieurs employés.
- Chaque incident possède un statut permettant de suivre son traitement, par exemple signalé, en cours de résolution ou résolu.
- La date de résolution et les actions réalisées doivent pouvoir être consignées pour assurer le suivi des incidents.

---

## 3. Dictionnaire de données brutes

Le dictionnaire de données recense les informations utiles à l'activité de l'entreprise. Il précise leur signification, leur type et leur taille, sans définir leur organisation future dans une base de données.

Les types sont exprimés de manière générique : `VARCHAR` pour le texte de longueur variable, `INT` pour les nombres entiers, `DATE` pour les dates et `DECIMAL` pour les valeurs monétaires.

Les tailles indiquées sont des propositions adaptées au domaine hôtelier. Elles pourront être ajustées pendant la conception.

| N° | Signification de la donnée                    | Type    | Taille                       |
| -: | --------------------------------------------- | ------- | ---------------------------- |
|  1 | Nom de l'hôtel                                | VARCHAR | 60 caractères                |
|  2 | Adresse postale de l'hôtel                    | VARCHAR | 120 caractères               |
|  3 | Numéro de téléphone de l'hôtel                | VARCHAR | 20 caractères                |
|  4 | Adresse électronique de l'hôtel               | VARCHAR | 100 caractères               |
|  5 | Classement de l'hôtel en étoiles              | INT     | 1 chiffre                    |
|  6 | Numéro de la chambre dans l'hôtel             | VARCHAR | 10 caractères                |
|  7 | Étage de la chambre                           | INT     | 2 chiffres                   |
|  8 | Type de chambre (simple, double, suite, etc.) | VARCHAR | 30 caractères                |
|  9 | État actuel de la chambre                     | VARCHAR | 20 caractères                |
| 10 | Indication d'accessibilité de la chambre      | BOOLEAN | 1 valeur logique             |
| 11 | Capacité maximale de la chambre en personnes  | INT     | 2 chiffres                   |
| 12 | Tarif par nuit de la chambre                  | DECIMAL | 8 chiffres, dont 2 décimales |
| 13 | Nom de famille de l'employé                   | VARCHAR | 50 caractères                |
| 14 | Prénom de l'employé                           | VARCHAR | 50 caractères                |
| 15 | Adresse électronique de l'employé             | VARCHAR | 100 caractères               |
| 16 | Numéro de téléphone de l'employé              | VARCHAR | 20 caractères                |
| 17 | Poste occupé par l'employé                    | VARCHAR | 40 caractères                |
| 18 | Nom de famille du client                      | VARCHAR | 50 caractères                |
| 19 | Prénom du client                              | VARCHAR | 50 caractères                |
| 20 | Adresse électronique du client                | VARCHAR | 100 caractères               |
| 21 | Numéro de téléphone du client                 | VARCHAR | 20 caractères                |
| 22 | Adresse postale du client                     | VARCHAR | 120 caractères               |
| 23 | Date de création de la réservation            | DATE    | 10 caractères                |
| 24 | Date d'arrivée prévue du client               | DATE    | 10 caractères                |
| 25 | Date de départ prévue du client               | DATE    | 10 caractères                |
| 26 | Statut de la réservation                      | VARCHAR | 20 caractères                |
| 27 | Nombre de personnes prévues pour le séjour    | INT     | 2 chiffres                   |
| 28 | Nom de la prestation complémentaire           | VARCHAR | 60 caractères                |
| 29 | Description de la prestation complémentaire   | VARCHAR | 255 caractères               |
| 30 | Tarif de la prestation complémentaire         | DECIMAL | 8 chiffres, dont 2 décimales |
| 31 | Date de signalement d'un incident             | DATE    | 10 caractères                |
| 32 | Description de l'incident rencontré           | VARCHAR | 255 caractères               |
| 33 | Niveau de gravité de l'incident               | VARCHAR | 20 caractères                |
| 34 | Statut de traitement de l'incident            | VARCHAR | 25 caractères                |
| 35 | Date de résolution de l'incident              | DATE    | 10 caractères                |

**Nombre total de données : 35.**

### Précisions sur le dictionnaire

- Les numéros de téléphone sont stockés sous forme de texte afin de conserver les indicatifs internationaux et les éventuels zéros initiaux.
- Les dates sont représentées par le type `DATE`. La taille de 10 caractères correspond à une représentation courante au format `AAAA-MM-JJ`.
- Les montants sont représentés par le type `DECIMAL`, avec deux décimales pour les centimes.
- Les identifiants techniques seront définis lors de la modélisation.
- Le numéro de chambre ne suffit pas nécessairement à identifier une chambre dans toute la chaîne : il doit être associé à l’hôtel auquel elle appartient.
- La disponibilité d’une chambre dépend notamment de son état et des réservations existantes pour la période concernée.

---

## 4. Précisions méthodologiques

Le dictionnaire est volontairement indépendant de la future modélisation. Pour éviter de mélanger l'analyse métier et la conception, quelques distinctions sont importantes :

- **Identifiants :** les identifiants uniques des hôtels, des chambres, des clients, des employés, des réservations et des incidents ne sont pas encore définis. Par exemple, le numéro d'une chambre peut se répéter dans plusieurs hôtels.
- **Relations :** les relations entre les hôtels, les chambres, les employés, les clients et les réservations seront traduites lors des étapes de modélisation suivantes.
- **Données répétables :** une réservation peut concerner plusieurs chambres et plusieurs prestations. La conception devra représenter ces situations sans dupliquer inutilement les informations.
- **Types de données :** un numéro de téléphone doit être stocké sous forme de texte, et non comme un entier, car il peut contenir un indicatif international, un signe `+` ou des zéros initiaux.
- **Contraintes temporelles :** l'indisponibilité d'une chambre doit être déterminée à partir des séjours prévus, de son état opérationnel et des éventuels travaux ou incidents.

Ce dictionnaire constitue une base de travail initiale. Dans une démarche MERISE complète, l'étudiant pourra ensuite vérifier les dépendances entre les données, repérer les éventuelles redondances et compléter les informations nécessaires avant de réaliser le modèle conceptuel des données (MCD).

---

## 5. Utilisation de l'intelligence artificielle

Le prompt ci-dessus a été utilisé pour générer une première proposition de règles de gestion et de dictionnaire de données. Ces éléments constituent une base de travail qui doit être relue et vérifiée avant les étapes suivantes de conception.

Les éventuelles modifications personnelles apportées à cette proposition pourront être précisées ici, afin de distinguer le résultat initial de l'IA du travail d'analyse et d'amélioration réalisé par l'étudiant.

---

## 6. Analyse du résultat et modifications apportées

La réponse générée par l’intelligence artificielle constitue une première base pour décrire le fonctionnement d’une chaîne hôtelière. Elle fournit des règles de gestion et un dictionnaire de 35 données. Ces éléments ont été examinés afin de vérifier leur cohérence avec le sujet et les besoins de modélisation.

Plusieurs points doivent être pris en compte lors de la construction du MCD. Le numéro d’une chambre n’est pas nécessairement unique à l’échelle de toute la chaîne hôtelière : il peut être identique dans plusieurs hôtels. L’identification d’une chambre doit donc tenir compte de l’hôtel auquel elle appartient.

Les règles de gestion impliquent également de représenter les relations entre les hôtels, les chambres, les employés, les clients, les réservations, les prestations et les incidents. Une réservation peut concerner plusieurs chambres, tandis qu’une chambre peut être réservée plusieurs fois à des périodes différentes. Les prestations peuvent être proposées par plusieurs hôtels et associées aux réservations concernées.

Certaines données présentes dans le modèle initial, comme les horaires et les dates de contrat des employés, le type de prestation, la carte de fidélité des clients et le statut de paiement des réservations, ne figurent pas dans le dictionnaire initial. Si elles sont conservées dans le modèle final, elles devront être ajoutées au dictionnaire en respectant la limite de 35 données demandée.

Enfin, le MCD devra intégrer les données retenues dans le dictionnaire et représenter clairement les entités, les associations, les identifiants et les cardinalités. Les éventuels écarts entre les règles de gestion, le dictionnaire et le modèle devront être vérifiés avant le rendu final.

---

## 7. MLD

Hotels = (id_pk INT, adresse VARCHAR(50), Nom VARCHAR(50), numérotel VARCHAR(50), mail VARCHAR(50), nombreétoiles INT);
Chambre = (numéro INT, étage INT, type VARCHAR(50), état VARCHAR(50), accesibilité LOGICAL, libre VARCHAR(50), #id_pk);
Employé = (id INT, fonction VARCHAR(50), Horraire VARCHAR(50), mail VARCHAR(50), nom_prénom VARCHAR(50), tel INT, date_début_contrat VARCHAR(50), date_fin_contrat VARCHAR(50), #id_1, #idpk);
Prestation = (id VARCHAR(50), type VARCHAR(50), description VARCHAR(50), prix CURRENCY);
Incident = (id INT, type INT, description VARCHAR(50), état VARCHAR(50), criticité INT, #id_1);
Client = (id VARCHAR(50), nom_prénom VARCHAR(50), mail VARCHAR(50), tel INT, cartefidélité LOGICAL, #numéro*, #id*);
Réservation = (numéro_reservation VARCHAR(50), date_arrivé VARCHAR(50), date_départ VARCHAR(50), nombre_personne VARCHAR(50), côut_chambre CURRENCY, réglé LOGICAL, #(id, nom_prénom));
Subit = (#numéro, #id);
Concerne = (#numéro, #numéro_reservation);
