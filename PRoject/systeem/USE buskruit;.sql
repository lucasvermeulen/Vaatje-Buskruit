

DROP TABLE IF EXISTS `dienst`;
CREATE TABLE `dienst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

USE buskruit;

DROP TABLE IF EXISTS `gebruiker`;
CREATE TABLE `gebruiker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inlognaam` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `wachtwoord` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `dienst` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `artikelnummer` int(6) NOT NULL,
   `omschrijving` varchar(100) COLLATE utf8_bin NOT NULL,
    `leverancier` varchar(30) COLLATE utf8_bin NOT NULL,
     `artikelgroep` varchar(25) COLLATE utf8_bin NOT NULL,
    `eenheid` varchar(25) COLLATE utf8_bin NOT NULL,
     `prijs` decimal(2,2) NOT NULL,
    `aantal` int(5) NOT NULL,
    `besteleenheid` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `artikelgroep`;
CREATE TABLE `artikelgroep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE `leverancier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



USE buskruit;
TRUNCATE product;
LOCK TABLES `product` WRITE;
INSERT INTO `product`
VALUES 
(123456,'Broccoli','1','1','stuk',1.99,15,0),
(123457,'Bloemkool','1','1','stuk',2.99,50,0),
(123458,'Aubergine','1','1','stuk',0.89,75,0),
(123459,'Salade ui','1','1','bosje',0.59,50,0),
(123460,'Snoepgroente tomaat','1','1','500g',2.99,75,0),
(123461,'Kruimige aardappel','1','1','1kg',1.09,25,0),
(123462,'Kruimige aardappel','1','1','5kg',2.75,25,0),
(123463,'Kaas geraspt mid 45+','2','2','200g',1.79,45,0),
(123464,'Kaas Pittig 45+ geraspt','2','2','200g',1.89,45,0),
(123465,'Kaas Jong 48+','2','2','400g',2.89,45,0),
(123466,'Kipfilet','3','2','150g',1.69,40,0),
(123467,'Gerookte spekreepjes','3','2','300g',2.69,40,0),
(123468,'Gerookte schouderham','3','2','150g',1.09,40,0),
(123469,'Boterhamworst','3','2','150g',0.99,45,0),
(123470,'Pindakaas','4','3','350g',2.69,65,0),
(123471,'Appelstroop','5','3','450g',0.69,65,0),
(123472,'Hazelnootpasta','6','3','630g',4.99,65,0),
(123473,'Vruchtenhagel','7','3','400g',1.35,65,0),
(123474,'Chocoladehagel puur','7','3','390g',2.49,56,0),
(123475,'Hagelslag melk','8','3','400g',1.69,57,0),
(123476,'Rimboe kroko vlokken puur/vanille','8','3','200g',1.99,35,0),
(123477,'Vlokken puur','7','3','300g',1.99,55,0),
(123478,'Cola Zero sugar','9','4','1l',1.85,100,0),
(123479,'Cola Regular','9','4','1l',1.85,150,0),
(123480,'Fanta Orange','10','4','1,5l',1.95,125,0),
(123481,'Aroma rood filter koffie','11','5','250g',3.29,250,0),
(123482,'Aroma rood filter koffie','11','5','500g',6.15,125,0),
(123483,'Koffiemelk Halvamel','12','5','455ml',1.25,122,0),
(123484,'Senseo Classic Koffiepads','11','5','36st',3.69,100,0),
(123485,'Opschuimmelk voor cappucino','12','5','1l',1.35,50,0),
(123486,'Huisblends Aroma snelfiltermaling','13','5','250g',2.89,75,0),
(123487,'Chips Naturel',"14",'6','225g',1.49,75,0),
(123488,'Chips Paprika',"14",'6','225g',1.49,85,0),
(123489,'Superchips paprika',"14",'6','200g',1.59,10,0),
(123490,'Nibb-it sticks','15','6','110g',1.35,5,0),
(123491,'Ontbijtkoek naturel gesneden','16','7','485g',1.75,15,0);
UNLOCK TABLES;

USE buskruit;
LOCK TABLES `artikelgroep` WRITE;
INSERT INTO `artikelgroep`
VALUES 
("Aardappels, groente en fruit1"),
("Kaas,vleeswaren"),
("Broodbeleg"),
("Frisdrank"),
("Koffie"),
("Chips"),
("Koek");
UNLOCK TABLES;

USE buskruit;
TRUNCATE leverancier;
LOCK TABLES `leverancier` WRITE;
INSERT INTO `leverancier`
VALUES 
("1","Boer Harms"),
("2","De Zaanse Hoeve"),
("3","Meester & Zn."),
("4","CalvÃ©"),
("5","Rinse"),
("6","Nutella"),
("7","De Ruijter"),
("8","Venz"),
("9","Coca-Cola"),
("10","Fanta"),
("11","Douwe Egberts"),
("12","Friesche vlag"),
("13","Perla"),
("14","Lay's"),
("15","Cheetos"),
("16","Peijnenburg");
UNLOCK TABLES;


USE buskruit;

SELECT p.id, p.omschrijving, l.leverancier_naam, a.artikelgroep_naam
FROM product AS p
INNER JOIN leverancier AS l ON p.leverancier=l.id
INNER JOIN artikelgroep AS a ON p.artikelgroep=a.id;


USE buskruit;

SELECT g.id, d.dienst_id
FROM gebruiker AS g
INNER JOIN dienst AS d ON g.dienst=d.id