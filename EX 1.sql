-- 1
SELECT *
FROM client
WHERE prenom="Muriel" AND password="test11";

-- 2
SELECT DISTINCT nom
FROM commande_ligne;

-- 3
SELECT DISTINCT nom , commande_id FROM commande_ligne;

-- 4
SELECT (prix_unitaire * quantite) total
FROM commande_ligne;

UPDATE commande_ligne
SET prix_total = prix_unitaire * quantite;

-- 5
SELECT cmd.id, SUM(cmdl.prix_total), cmd.date_achat , cl.nom , cl.prenom
FROM commande cmd, commande_ligne cmdl, client cl
WHERE cmd.id = cmdl.commande_id AND cl.id = cmd.client_id
GROUP BY cmd.id;

-- VIEW
CREATE VIEW vw_client AS
SELECT * FROM client;
-- WHERE UPPER(ville)= UPPER("Lyon");

DELIMITER $$
create function prix_total(id int)
returns int
reads sql data
	begin
		declare somme float;
		set somme=(select sum(prix_total)
					from commande_ligne
					where commande_id = id);
		return somme;
	end $$
DELIMITER ;

SELECT prix_total(3) prix_total