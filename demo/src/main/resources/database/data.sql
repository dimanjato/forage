-- =========================
-- DONNEES DE TEST
-- =========================

-- REGION
INSERT INTO region(nom) VALUES
('Analamanga'),
('Vakinankaratra'),
('Atsinanana');

-- DISTRICT
INSERT INTO district(nom, id_region) VALUES
('Antananarivo Renivohitra', 1),
('Ambohidratrimo', 1),
('Antsirabe I', 2),
('Toamasina I', 3);

-- COMMUNE
INSERT INTO commune(nom, id_districte) VALUES
('Analakely', 1),
('Isotry', 1),
('Talatamaty', 2),
('Ivato', 2),
('Antsirabe Ville', 3),
('Toamasina Centre', 4);

-- CLIENT
INSERT INTO client(nom, prenom, adresse) VALUES
('Rakoto', 'Jean', 'Lot II A 45 Analakely'),
('Rabe', 'Marie', 'Lot III F 12 Ivato'),
('Andrianina', 'Paul', 'Antsirabe Centre'),
('Randria', 'Luc', 'Toamasina Centre'),
('Rasoa', 'Clara', 'Talatamaty');

-- DEMANDE
INSERT INTO demande(id_client, lieux, commune, reference) VALUES
(1, 'Forage eau potable école primaire', 1, 'DEM-2026-001'),
(2, 'Forage pour agriculture', 4, 'DEM-2026-002'),
(3, 'Forage quartier sud', 5, 'DEM-2026-003'),
(4, 'Installation pompe hydraulique', 6, 'DEM-2026-004'),
(5, 'Forage usage domestique', 3, 'DEM-2026-005');

-- STATUS
INSERT INTO status(status) VALUES
('En attente'),
('Validation'),
('En cours'),
('Terminé'),
('Refusé');

-- DEMANDE STATUS
INSERT INTO demande_status(id_status, id_demande, date_debut, date_fin) VALUES
(1, 1, '2026-01-10', '2026-01-12'),
(2, 1, '2026-01-13', NULL),

(1, 2, '2026-02-01', '2026-02-03'),
(3, 2, '2026-02-04', NULL),

(1, 3, '2026-03-05', '2026-03-07'),
(4, 3, '2026-03-08', '2026-03-20'),

(1, 4, '2026-04-01', NULL),

(1, 5, '2026-04-10', '2026-04-12'),
(5, 5, '2026-04-13', '2026-04-15');