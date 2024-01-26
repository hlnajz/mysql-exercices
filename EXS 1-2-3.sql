CREATE DATABASE gestionarticle;

USE gestionarticle;

CREATE TABLE `article`(
  `numart` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `desart` varchar(255),
  `puart` float(10),
  `email` varchar(255),
  `ville` varchar(255),
  `password` varchar(255)
);

CREATE TABLE `ligne_commande`(
  `num` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `numart` int(10),
  `quantite` int(10),
  FOREIGN KEY(numart) REFERENCES article(numart)
);

CREATE TABLE `commande`(
  `num` int(10),
  `datcom` date,
  FOREIGN KEY(num) REFERENCES ligne_commande(num)
);


-- EX1
-- 1
DELIMITER $$
CREATE PROCEDURE sp_articles()
BEGIN
	SELECT numart, desart
	FROM article;
END;

-- 2
CALL sp_articles


-- EX2
-- 1
CREATE PROCEDURE nombre_articles(cmd)
BEGIN
	SELECT COUNT(numart)
    FROM ligne_commande
    WHERE numcom = cmd;
END

-- 2
CALL nombre_articles(x)


-- EX3
-- 1
CREATE PROCEDURE deux_dates(data_1, date_2)
BEGIN
	SELECT art.(*)
    FROM article art, commande cmd, ligne_commande lcmd
    WHERE art.numart = lcmd.numart AND lcmd.num = cmd.num AND cmd.datcom BETWEEN(date_1, date_2)
END

-- 2
CALL deux_dates('1-1-2022', '31-12-2022');