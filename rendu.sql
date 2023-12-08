-- Exercice 1
-- Listez l’ensemble des jeux enregistré dans la table « games ».
USE videogames;
SELECT * FROM games;

-- Exercice 2 :
-- Listez l’ensemble de jeux sans les doublons.
USE videogames;
SELECT DISTINCT g_name FROM games;

-- Exercice 3 :
-- Affichez le nom, le mode de jeu, la date de sortie et le pegi de tous les jeux triés par ordre alphabétiques.
USE videogames;
SELECT g_name, g_mode,g_published_at,g_pegi FROM games
ORDER BY g_name ASC;

-- Exercice 4 :
-- Affichez le nom, le mode de jeu, la date de sortie et le pegi des 10 jeux les plus récents.
USE videogames;
SELECT g_name, g_mode,g_published_at,g_pegi FROM games
ORDER BY g_published_at DESC LIMIT 10;

-- Exercice 5 :
-- Affichez le nom et le mode de jeu des jeux qui se jouent uniquement dans un seul mode
USE videogames;
SELECT g_name, g_mode FROM games
WHERE g_mode = 'Solo' OR g_mode = 'Multijoueur';
-- Exercice 6 :
-- Affichez le nom et la date de sortie des jeux sortie entre 2015 et 2020 triés par année
USE videogames;
SELECT g_name, g_published_at FROM games
WHERE g_published_at BETWEEN '2015-01-01 00:00:00' AND '2020-12-31 23:59:59';

-- Exercice 7 :
-- Affichez le nom et le mode de jeu des jeux qui peuvent se jouer en mode solo
USE videogames;
SELECT g_name, g_mode FROM games
WHERE g_mode LIKE '%Solo%';

-- Exercice 8 :
-- Affichez les informations des différents jeux "witcher" disponibles.
USE videogames;
SELECT * FROM games
WHERE g_name LIKE '%witcher%';

-- Exercice 9 :
-- Affichez les informations de tous les jeux sauf les jeux «Halo".
USE videogames;
SELECT * FROM games 
WHERE g_name NOT LIKE '%halo%';

-- Exercice 10 :
-- Lister les jeux sortis en 2012, 2016 et 2020.
USE videogames;
SELECT * FROM games 
WHERE g_published_at LIKE '%2012%'
OR g_published_at LIKE '%2016%'
OR g_published_at LIKE '%2020%';

-- Exercice 11 :
-- Affichez le nom de jeu et le studio de tous les jeux. Utiliser une jointure naturelle.
USE videogames;
SELECT g_name, s_name 
FROM games NATURAL JOIN studios;

-- Exercice 12 :
-- Affichez le nom de jeu, le studio, la nationalité de la société des jeux disponibles. Utiliser une jointure avec join
USE videogames;
SELECT g_name, s_name, s_nationality 
FROM games NATURAL JOIN studios;

-- Exercice 13 :
-- Affichez le nom et le mode de jeu des jeux console grand public triés par pegi croissant
USE videogames;
SELECT DISTINCT g_name,g_mode FROM games NATURAL JOIN platforms
WHERE p_name NOT LIKE '%MAC%'
AND p_name NOT LIKE '%PC%'
AND p_name NOT LIKE '%Stadia%'
AND p_name NOT LIKE '%Steam%'
ORDER BY g_pegi ASC;

-- Exercice 14 :
-- Affichez le nom de jeu et les plateformes de tous les jeux triés par ordre alphabétique
USE videogames;
SELECT g_name,p_name FROM games NATURAL JOIN platforms
ORDER BY g_name ASC;

-- Exercice 15 :
-- Calculez le nombre total de jeux.
USE videogames;
SELECT COUNT(*) FROM games NATURAL JOIN platforms;

-- Exercice 16 :
-- Affichez le nombre de jeux uniques.
USE videogames;
SELECT COUNT(*) FROM games;

-- Exercice 17 :
-- Calculez le nombre de jeux par studio.
USE videogames;
SELECT s_name, count(*) FROM games NATURAL JOIN studios
GROUP BY s_name;

-- Exercice 18 :
-- Calculez le nombre de jeux par studio et par plateforme
USE videogames;
SELECT s_name, p_id, COUNT(*) FROM games NATURAL JOIN studios NATURAL JOIN games_platforms
GROUP BY s_name, p_id;
-- Exercice 19 :
-- Affichez les jeux disponibles sur au moins 4 plateformes
USE videogames;
SELECT g_name, COUNT(*) AS nbre_plateforme FROM games NATURAL JOIN games_platforms
WHERE nbre_plateforme >= '4'
GROUP BY g_name


