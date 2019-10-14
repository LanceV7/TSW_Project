-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dressyounow2
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acquisto` (
  `IdProdotto` int(5) NOT NULL,
  `fattura` int(11) DEFAULT NULL,
  `quantità` int(2) NOT NULL,
  KEY `IdProdotto` (`IdProdotto`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`IdProdotto`) REFERENCES `prodotto` (`idprodotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,1,2),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amministratore`
--

DROP TABLE IF EXISTS `amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `amministratore` (
  `LoginA` varchar(60) NOT NULL,
  `pass` varchar(60) NOT NULL,
  PRIMARY KEY (`LoginA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amministratore`
--

LOCK TABLES `amministratore` WRITE;
/*!40000 ALTER TABLE `amministratore` DISABLE KEYS */;
INSERT INTO `amministratore` VALUES ('davide98@gmail.com','davide98'),('vins98@gmail.com','vins98');
/*!40000 ALTER TABLE `amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fattura` (
  `codiceFattura` int(11) NOT NULL AUTO_INCREMENT,
  `registrato` varchar(60) DEFAULT NULL,
  `dataFattura` date NOT NULL,
  `Indirizzo` int(11) NOT NULL,
  PRIMARY KEY (`codiceFattura`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
INSERT INTO `fattura` VALUES (1,'matteo@alice.it','2019-06-20',1),(2,'giulia@tiscali.it','2019-09-20',2),(3,'rosalia@libero.it','2019-09-10',3);
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `indirizzo` (
  `registrato` varchar(60) DEFAULT NULL,
  `CodiceIndirizzo` int(11) NOT NULL AUTO_INCREMENT,
  `via` varchar(50) NOT NULL,
  `cap` int(5) NOT NULL,
  `nCv` int(11) NOT NULL,
  `Città` varchar(60) NOT NULL,
  `Provincia` varchar(60) NOT NULL,
  `Nazione` varchar(40) DEFAULT 'italia',
  PRIMARY KEY (`CodiceIndirizzo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES ('matteo@alice.it',5,'via parmenide',84069,1,'Roscigno','Salerno','italia'),('giulia@tiscali.it',6,'via giuliani',84012,28,'Roma','Roma','italia'),('rosalia@libero.it',7,'via tommasini ',84061,7,'Felitto','Salerno','italia'),('andrea@libero.it',8,'via roma',85178,16,'Aquara','Salerno','italia');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodotto` (
  `IdProdotto` int(5) NOT NULL,
  `Quantità` int(3) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descrizione` varchar(900) NOT NULL,
  `Genere` varchar(3) NOT NULL,
  `Categoria` varchar(25) NOT NULL,
  `Prezzo` decimal(6,2) NOT NULL,
  `Brand` varchar(20) NOT NULL,
  `Colore` varchar(15) NOT NULL,
  `Foto` text,
  `Sconto` decimal(4,2) DEFAULT '0.00',
  `Acquistabile` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IdProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,50,'BANDEAU BODYCON DRESS','Composizione e istruzioni di lavaggio Composizione: 95% poliestere, 5% elastan Materiale: Jersey Avvertenze: Non asciugare in asciugatrice, Lavaggio a macchina a 30 gradi, Lavaggio delicato ,Scollo: Smanicato, Chiusura: Cerniera,Fantasia: Monocromo','F','Vestito Intero',17.99,'MISSGUIDED','Nero','https://img01.ztat.net/article/M0/Q2/1C/15/VQ/11/M0Q21C15V-Q11@8.jpg?imwidth=1800',0.00,1),(2,50,'LUCIA DRESS ','Composizione e istruzioni di lavaggio Composizione: 88% poliestere, 12% elastan Materiale: Jersey Avvertenze: Lavaggio a mano Chiusura: Cerniera ,Dettagli: Spalline regolabili, Coppe imbottite, Bustino con stecche interne, Borchie','F','Vestito Intero',104.99,'GUESS','Nero','https://img01.ztat.net/article/GU/12/1C/0F/4Q/11/GU121C0F4-Q11@14.jpg?imwidth=1800',0.00,1),(3,50,'CROSS BACK CAMI-ROSSO','Composizione: 100% poliestere Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Scollo: Schiena scoperta,Fantasia: Monocromo,Dettagli: Cucitura sul seno','F','T-Shirt e Top',15.29,'New Look','Rosso','https://img01.ztat.net/article/74ad7b52a37f4d628d38d7918662d1f1/d9c11e713c3149b0a776e0c91c8dcd46.jpeg?imwidth=1800',0.00,1),(4,50,'CROSS BACK CAMI-BLU','Composizione: 100% poliestere Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Scollo: Schiena scoperta,Fantasia: Monocromo,Dettagli: Cucitura sul seno','F','T-Shirt e Top',15.29,'New Look','Blu','https://img01.ztat.net/article/aef94353860b4172b32a4bbc78aa0ed2/e9f61af2c91040f686f7e7d2fbcee0d7.jpeg?imwidth=1800',0.00,1),(5,50,'CROSS BACK CAMI-ROSA','Composizione: 100% poliestere Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Scollo: Schiena scoperta,Fantasia: Monocromo,Dettagli: Cucitura sul seno','F','T-Shirt e Top',15.29,'New Look','Rosa','https://img01.ztat.net/article/86476eb8921a4239ae8cbd3a7978e430/4697aa25b15e4a67be101c2995198bad.jpeg?imwidth=1800',0.00,1),(6,50,'SHRUNKEN INSTITUTIONAL-NERO','Composizione: 100% cotone,Materiale: Jersey,Avvertenze: Lavaggio a macchina a 40 gradi, Lavaggio delicato,Scollo: Tondo,Fantasia: Stampa','F','T-Shirt e Top',25.49,'Calvin Klein','Nero','https://img01.ztat.net/article/C1/82/1D/07/LQ/11/C1821D07L-Q11@8.jpg?imwidth=1800',0.00,1),(7,50,'SHRUNKEN INSTITUTIONAL-BIANCO','Composizione: 100% cotone,Materiale: Jersey,Avvertenze: Lavaggio a macchina a 40 gradi, Lavaggio delicato,Scollo: Tondo,Fantasia: Stampa','F','T-Shirt e Top',25.49,'Calvin Klein','Bianco','https://img01.ztat.net/article/C1/82/1D/07/LA/11/C1821D07L-A11@6.jpg?imwidth=1800',0.00,1),(8,50,'SHRUNKEN INSTITUTIONAL-ROSSO','Composizione: 100% cotone,Materiale: Jersey,Avvertenze: Lavaggio a macchina a 40 gradi, Lavaggio delicato,Scollo: Tondo,Fantasia: Stampa','F','T-Shirt e Top',25.49,'Calvin Klein','Rosso','https://img01.ztat.net/article/C1/82/1D/07/LG/11/C1821D07L-G11@12.1.jpg?imwidth=1800',0.00,1),(9,50,'BOBBY TIE BUTTON BLOUSE-NERO','Composizione: 100% poliestere,Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato,Scollo: A V profondo,Chiusura: Bottoni,Fantasia: Monocromo','F','Camicie',21.99,'New Look','Nero','https://img01.ztat.net/article/799afcb26e67498ebf6ab35e7ced8f2e/3504619dbb01482db5dcaa4e8a9105d1.jpeg?imwidth=1800',0.00,1),(10,50,'BOBBY TIE BUTTON BLOUSE-BIANCO','Composizione: 100% poliestere,Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato,Scollo: A V profondo,Chiusura: Bottoni,Fantasia: Monocromo','F','Camicie',21.99,'New Look','Bianco','https://img01.ztat.net/article/a027e633f4a44ab9a56a992a399d6e18/d7821577a4d04f69baf8be6af7bbb29d.jpeg?imwidth=1800',0.00,1),(11,50,'JEFF PATCH POCKET-BIANCO','Composizione: 100% viscosa, Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Colletto: Italiano, Chiusura: Bottoni, Trasparenza: Leggera, Fantasia: Monocromo','F','Camicie',22.99,'New Look','Bianco','https://img01.ztat.net/article/a027e633f4a44ab9a56a992a399d6e18/d7821577a4d04f69baf8be6af7bbb29d.jpeg?imwidth=1800',0.00,1),(12,50,'JEFF PATCH POCKET-NERO','Composizione: 100% viscosa, Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Colletto: Italiano, Chiusura: Bottoni, Trasparenza: Leggera, Fantasia: Monocromo','F','Camicie',22.99,'New Look','Nero','https://img01.ztat.net/article/NL/02/1E/0U/BQ/11/NL021E0UB-Q11@4.jpg?imwidth=1800',0.00,1),(13,50,'JEFF PATCH POCKET-ROSA','Composizione: 100% viscosa, Avvertenze: Lavaggio a macchina a 40 gradi, Non asciugare in asciugatrice, Lavaggio delicato, Colletto: Italiano, Chiusura: Bottoni, Trasparenza: Leggera, Fantasia: Monocromo','F','Camicie',22.99,'New Look','Rosa','https://img01.ztat.net/article/NL/02/1E/0U/BJ/11/NL021E0UB-J11@10.jpg?imwidth=1800',0.00,1),(14,50,'NMMELISSA POCKET','Composizione: 100% viscosa, Fodera: 100% cotone, Avvertenze: Non asciugare in asciugatrice, Lavaggio a macchina a 30 gradi, Restringimento massimo del 5%, Lavaggio delicato, Scollo: Incrociato, Tasche: Tasche laterali, Fantasia: Monocromo, Dettagli: Cerniera, Spalline regolabili','F','Tute-Jumpsuit',34.99,'Nois May','Nero','https://img01.ztat.net/article/NM/32/1T/00/SQ/11/NM321T00S-Q11@7.jpg?imwidth=1800',0.00,1),(15,50,'EXCLUSIVE SUMMER CAPSULE','Composizione: 42% viscosa, 40% cotone, 18% lino, Fodera: 100% viscosa, Avvertenze: Lavaggio a mano, vScollo: Schiena scoperta, Fantasia: Monocromo, Dettagli: Abbottonatura, Cucitura sul seno, Spalline regolabili, Nastro','F','Tute-Jumpsuit',39.99,'Glamours','Verde','https://img01.ztat.net/article/GL/92/1T/01/AM/11/GL921T01A-M11@9.jpg?imwidth=1800',0.00,1),(16,50,'VACANCY SET','Composizione: 100% poliestere, Composizione parte inferiore: 100% poliestere, Materiale: Jersey, Avvertenze: Lavaggio a macchina a 40 gradi, Tipo di sport: Training, Colletto: Coreana, Chiusura: Cerniera, Tasche: Tasche laterali, Polsini: Coste elastiche, elastico, Dettagli: Tasche anteriori, Fascia elastica','F','Abbigliamento Sportivo',79.99,'Kappa','Blu','https://img01.ztat.net/article/10/K4/1K/00/0K/11/10K41K000-K11@14.1.jpg?imwidth=1800',0.00,1),(17,50,'GRAPHIC SUIT','Composizione: 66% cotone, 34% poliestere, Composizione parte inferiore: 66% cotone, 34% poliestere, Materiale: Sportivi, Avvertenze: Non asciugare in asciugatrice, Tipo di sport: Training, Colletto: Coreana, Chiusura: Cerniera, Tasche: Tasche laterali, Polsini: Coste elastiche, elastico, Dettagli: Tasche anteriori, Fascia elastica','F','Abbigliamento Sportivo',69.99,'Puma','Bianco','https://img01.ztat.net/article/PU/14/1K/00/WA/11/PU141K00W-A11@22.jpg?imwidth=1800',0.00,1),(18,50,'FELPA ADIDAS ORIGINAL','Composizione: 77% cotone, 23% poliestere, Materiale: Sportivi, Avvertenze: Lavaggio a macchina a 30 gradi','F','Felpe',59.99,'Adidas','Nero','https://img01.ztat.net/article/7d730ba3baf842a3919ff664f2789b38/7aeafad4825a46cb9920b7a8bb71ef1e.jpeg?imwidth=1800',0.00,1),(19,50,'GRAPHIC UNBASIC HOODIE-NERO','Composizione: 100% cotone, Materiale: Sportivi, Colletto: Cappuccio, Cappuccio: Cappuccio con coulisse, Fantasia: Stampa','F','Felpe',69.99,'Levi\'s','Nero','https://img01.ztat.net/article/LE/22/1J/01/RQ/11/LE221J01R-Q11@4.jpg?imwidth=1800',0.00,1),(20,50,'DEZIE - Jeans Skinny Fit - GRIGIO','Composizione: 98% cotone, 2% elastan, Materiale: Jeans, Avvertenze: Lavaggio a macchina a 40 gradi, Chiusura: Cerniera nascosta, Tasche: Tasca cargo, Tasche posteriori, Fantasia: Monocromo','F','Jeans',59.99,'Dr.Demin','Grigio','https://img01.ztat.net/article/DR/12/1A/01/6M/11/DR121A016-M11@12.jpg?imwidth=1800',0.00,1),(21,50,'DEZIE - Jeans Skinny Fit - NERO','Composizione: 98% cotone, 2% elastan, Materiale: Jeans, Avvertenze: Lavaggio a macchina a 40 gradi, Chiusura: Cerniera nascosta, Tasche: Tasca cargo, Tasche posteriori, Fantasia: Monocromo','F','Jeans',59.99,'Dr.Demin','Nero','https://img01.ztat.net/article/DR/12/1A/01/6Q/11/DR121A016-Q11@10.jpg?imwidth=1800',0.00,1),(22,50,'SHAPING BERMUDA ','Composizione: 79% cotone, 19% poliestere, 2% elastan, Materiale: Jeans, Elementi non tessili di origine animale: Si, Avvertenze: Lavaggio a macchina a 30 gradi, Vita: Normale, Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali','F','Jeans',59.99,'Levi\'s','Blu','https://img01.ztat.net/article/L0/M2/1S/00/0K/14/L0M21S000-K14@8.jpg?imwidth=1800',0.00,1),(23,50,'STELLA ANKLE ZIP - VERDE','Composizione: 91% cotone, 6% elastomultiestere, 3% elastan, Materiale: Jeans, Elementi non tessili di origine animale: Si, Avvertenze: Non asciugare in asciugatrice, Vita: Normale, Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali, Dettagli: Cerniera','F','Pantaloni',139.99,'Replay','Verde','https://img01.ztat.net/article/RE/32/1A/08/LA/11/RE321A08L-A11@11.jpg?imwidth=1800',0.00,1),(24,50,'STELLA ANKLE ZIP - ROSSO ','Composizione: 91% cotone, 6% elastomultiestere, 3% elastan, Materiale: Jeans, Elementi non tessili di origine animale: Si, Avvertenze: Non asciugare in asciugatrice, Vita: Normale, Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali, Dettagli: Cerniera','F','Pantaloni',139.99,'Replay','Rosso','https://img01.ztat.net/article/RE/32/1A/08/LA/12/RE321A08L-A12@4.jpg?imwidth=1800',0.00,1),(25,50,'BERLIN STRIPE','Composizione: 99% cotone, 1% elastan, Vita: Normale, Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali, Fantasia: Righe, Dettagli: Cerniera','F','Pantaloni',119.99,'Mos Mosh','Blu','https://img01.ztat.net/article/MX/92/1A/05/NA/11/MX921A05N-A11@18.1.jpg?imwidth=1800',0.00,1),(26,50,'Gonna a campana','Composizione: 100% poliestere, Fodera: 100% poliestere, Materiale: Chiffon, Avvertenze: Non asciugare in asciugatrice','F','Gonne',16.99,'Even&Odd','Nero','https://img01.ztat.net/article/EV/42/1B/06/9Q/11/EV421B069-Q11@5.jpg?imwidth=1800',0.00,1),(27,50,'GRAPHIC SKIRT - Gonna lunga - NERO','Composizione: 100% poliestere, Fodera: 97% cotone, 3% elastan, Materiale: Merletto','F','Gonne',149.99,'IVY & OAK','Nero','https://img01.ztat.net/article/IV/32/1B/01/8K/11/IV321B018-K11@7.jpg?imwidth=1800',0.00,1),(28,50,'GRAPHIC SKIRT - Gonna lunga - VERDE','Composizione: 100% poliestere, Fodera: 97% cotone, 3% elastan, Materiale: Merletto','F','Gonne',149.99,'IVY & OAK','Verde','https://img01.ztat.net/article/IV/32/1B/01/8M/11/IV321B018-M11@7.jpg?imwidth=1800',0.00,1),(29,50,'GRAPHIC SKIRT - Gonna lunga - BIANCO','Composizione: 100% poliestere, Fodera: 97% cotone, 3% elastan, Materiale: Merletto','F','Gonne',149.99,'IVY & OAK','Bianco','https://img01.ztat.net/article/IV/32/1B/01/8A/11/IV321B018-A11@1.2.jpg?imwidth=1800',0.00,1),(30,50,'Giacca in similpelle - GRIGIO','Composizione: 50% poliestere-50% viscosa, Colletto: Coreana, Tasche: Chiusura a cerniera, Fantasia: Monocromo','F','Giacche',39.99,'ONLY','Grigio','https://img01.ztat.net/article/ON/32/1U/09/6C/11/ON321U096-C11@10.jpg?imwidth=1800',0.00,1),(31,50,'Giacca in similpelle - NERO','Composizione: 50% poliestere-50% viscosa, Colletto: Coreana, Tasche: Chiusura a cerniera, Fantasia: Monocromo','F','Giacche',39.99,'ONLY','Nero','https://img01.ztat.net/article/ON/32/1U/09/6Q/11/ON321U096-Q11@14.1.jpg?imwidth=1800',0.00,1),(32,50,'Giacca in similpelle - BLU','Composizione: 50% poliestere-50% viscosa, Colletto: Coreana, Tasche: Chiusura a cerniera, Fantasia: Monocromo','F','Giacche',39.99,'ONLY','Blu','https://img01.ztat.net/article/ON/32/1U/09/6K/11/ON321U096-K11@6.jpg?imwidth=1800&filter=packshot',0.00,1),(33,50,'ONLFLORA BIKER - NERO','Composizione: 100% viscosa, Fodera: 100% poliestere, Materiale: Fintapelle, Colletto: Bavero, Chiusura: Cerniera','F','Giacche',39.99,'ONLY','Nero','https://img01.ztat.net/article/ON/32/1G/0U/VQ/11/ON321G0UV-Q11@13.jpg?imwidth=1800',0.00,1),(34,50,'ONLFLORA BIKER - MARRONE','Composizione: 100% viscosa, Fodera: 100% poliestere, Materiale: Fintapelle, Colletto: Bavero, Chiusura: Cerniera','F','Giacche',39.99,'ONLY','Marrone','https://img01.ztat.net/article/ON/32/1G/0U/VO/11/ON321G0UV-O11@21.jpg?imwidth=1800',0.00,1),(35,50,'ONLFLORA BIKER - GIALLO','Composizione: 100% viscosa, Fodera: 100% poliestere, Materiale: Fintapelle, Colletto: Bavero, Chiusura: Cerniera','F','Giacche',39.99,'ONLY','Giallo','https://img01.ztat.net/article/ON/32/1G/0U/VE/11/ON321G0UV-E11@19.jpg?imwidth=1800',0.00,1),(36,50,'VMAVENUE FAUX SHORT JACKET - ROSA','Composizione: 100% poliestere, Fodera: 100% poliestere, Materiale: Pelliccia sintetica, Avvertenze: Restringimento massimo del 5%','F','Giacche',49.99,'Vero Moda','Rosa','https://img01.ztat.net/article/VE/12/1U/05/5J/11/VE121U055-J11@10.jpg?imwidth=1800',0.00,1),(37,50,'VMAVENUE FAUX SHORT JACKET - BEIGE','Composizione: 100% poliestere, Fodera: 100% poliestere, Materiale: Pelliccia sintetica, Avvertenze: Restringimento massimo del 5%','F','Giacche',49.99,'Vero Moda','Beige','https://img01.ztat.net/article/VE/12/1U/05/5B/11/VE121U055-B11@13.jpg?imwidth=1800',0.00,1),(38,50,'VMAVENUE FAUX SHORT JACKET - NERO','Composizione: 100% poliestere, Fodera: 100% poliestere, Materiale: Pelliccia sintetica, Avvertenze: Restringimento massimo del 5%','F','Giacche',49.99,'Vero Moda','Nero','https://img01.ztat.net/article/VE/12/1U/05/5K/11/VE121U055-K11@10.jpg?imwidth=1800',0.00,1),(39,50,'BRIDAL YASBEO NEW','Composizione: 90% poliestere, 7% cotone, 3% elastan, Fodera: 100% poliestere, Elementi non tessili di origine animale: Si, Avvertenze: Lavaggio a macchina a 30 gradi','F','Cappotti',89.99,'Yas','Bianco','https://img01.ztat.net/article/Y0/12/1G/02/AA/11/Y0121G02A-A11@16.jpg?imwidth=1800',0.00,1),(40,50,'BUTTON FRONT DOLLY','Composizione: 100% poliestere, Fodera: 100% poliestere, Avvertenze: Lavaggio a secco','F','Cappotti',89.99,'Dorothy Perkins','Rosa','https://img01.ztat.net/article/a0cba0f5b61e4b648651c1e76f350965/0a22107546ff46d1a9ef430295b34593.jpeg?imwidth=1800',0.00,1),(41,50,'BMOWT-JUST-B T-SHIRT - T-shirt GRIGIO','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',29.99,'Diesel','Grigio','https://img01.ztat.net/article/DI/12/2O/07/TC/11/DI122O07T-C11@9.jpg?imwidth=1800',0.00,1),(42,50,'BMOWT-JUST-B T-SHIRT - T-shirt TURCHESE','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',29.99,'Diesel','Turchese','https://img01.ztat.net/article/DI/12/2O/07/TL/11/DI122O07T-L11@6.jpg?imwidth=1800',0.00,1),(43,50,'PRADO TEE - T-shirt GRIGIO','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',18.74,'Ellesse','Grigio','https://img01.ztat.net/article/EL/92/2O/00/CC/11/EL922O00C-C11@10.jpg?imwidth=1800',0.00,1),(44,50,'PRADO TEE - T-shirt NERO','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',18.74,'Ellesse','Nero','https://img01.ztat.net/article/EL/92/2O/00/CQ/11/EL922O00C-Q11@8.jpg?imwidth=1800',0.00,1),(45,50,'PRADO TEE - T-shirt BLU','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',18.74,'Ellesse','Blu','https://img01.ztat.net/article/EL/92/2O/00/CK/11/EL922O00C-K11@10.1.jpg?imwidth=1800',0.00,1),(46,50,'PRADO TEE - T-shirt ROSA','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',18.74,'Ellesse','Rosa','https://img01.ztat.net/article/EL/92/2O/00/CJ/11/EL922O00C-J11@6.jpg?imwidth=1800',0.00,1),(47,50,'PRADO TEE - T-shirt GIALLO','Composizione: 100% cotone, Materiale: Jersey, Scollo: Tondo, Fantasia: Stampa','M','T-shirt e Polo',18.74,'Ellesse','Giallo','https://img01.ztat.net/article/EL/92/2O/00/CE/12/EL922O00C-E12@8.jpg?imwidth=1800',0.00,1),(48,50,'MODERN POLO - Polo nero','Composizione: 100% cotone, Materiale: Piquè, Colletto: Polo','M','T-shirt e Polo',24.74,'Levi\'s','Nero','https://img01.ztat.net/article/LE/22/2P/00/IQ/11/LE222P00I-Q11@7.jpg?imwidth=1800',0.00,1),(49,50,'MODERN POLO - Polo blu','Composizione: 100% cotone, Materiale: Piquè, Colletto: Polo','M','T-shirt e Polo',24.74,'Levi\'s','Blu','https://img01.ztat.net/article/LE/22/2P/00/IK/11/LE222P00I-K11@8.jpg?imwidth=1800',0.00,1),(50,50,'HOODED WORKER ','Composizione: 100% cotone,Colletto: Cappuccio, Chiusura: Bottoni, Fantasia: Stampa','M','Camicie',34.99,'Levi\'s','Nero','https://img01.ztat.net/article/LE/22/2D/06/UQ/11/LE222D06U-Q11@10.jpg?imwidth=1800',0.00,1),(51,50,'BARSTOW WESTERN','Composizione: 100% cotone, Materiale: Jeans, Elementi non tessili di origine animale: Si ,Colletto: Kent, Chiusura: Bottoni, Fantasia: Monocromo','M','Camicie',79.99,'Levi\'s','Nero','https://img01.ztat.net/article/LE/22/2D/05/9Q/12/LE222D059-Q12@10.jpg?imwidth=1800',0.00,1),(52,50,'CHERUB PRINT SHORT SLEEVE REVERE','Composizione: 100% poliestere, Materiale: Jersey, Colletto: Bavero, Chiusura: Bottoni, Fantasia: Floreale ','M','Camicie',11.50,'Boohoo Man','Nero','https://img01.ztat.net/article/BO/H2/2D/01/XQ/11/BOH22D01X-Q11@4.jpg?imwidth=1800',0.00,1),(53,50,'FELPA','Composizione: 69% poliestere, 31% cotone, Materiale: Sportivi, Scollo: Tondo, Fantasia: Stampa fotografica, Dettagli: Fascia elastica','M','Maglie e Felpe',13.70,'YourTurn','Bianco','https://img01.ztat.net/article/YO/12/2S/0A/AA/11/YO122S0AA-A11@10.jpg?imwidth=1800',0.00,1),(54,50,'FELPA PREMIUM - NERO','Composizione: 100% cotone, Materiale: Sportivi, Scollo: Tondo, Fantasia: Melange, Dettagli: Fascia elastica','M','Maglie e Felpe',76.99,'Lacoste','Nero','https://img01.ztat.net/article/LA/22/2S/02/1C/11/LA222S021-C11@6.jpg?imwidth=1800',0.00,1),(55,50,'FELPA PREMIUM - VERDE','Composizione: 100% cotone, Materiale: Sportivi, Scollo: Tondo, Fantasia: Melange, Dettagli: Fascia elastica','M','Maglie e Felpe',76.99,'Lacoste','Verde','https://img01.ztat.net/article/LA/22/2S/02/1M/11/LA222S021-M11@4.jpg?imwidth=1800',0.00,1),(56,50,'FELPA CON CAPPUCCIO - NERO','Composizione: 65% poliestere, 35% cotone, Materiale: Sportivi, Colletto: Cappuccio, Cappuccio: Cappuccio con coulisse, Fantasia: Stampa, Dettagli: Fascia elastica','M','Maglie e Felpe',12.50,'YourTurn','Nero','https://img01.ztat.net/article/YO/12/2S/08/NM/11/YO122S08N-M11@10.jpg?imwidth=1800',0.00,1),(57,50,'FELPA CON CAPPUCCIO - VERDE','Composizione: 65% poliestere, 35% cotone, Materiale: Sportivi, Colletto: Cappuccio, Cappuccio: Cappuccio con coulisse, Fantasia: Stampa, Dettagli: Fascia elastica','M','Maglie e Felpe',12.50,'YourTurn','Verde Scuro','https://img01.ztat.net/article/YO/12/2S/08/NM/11/YO122S08N-M11@10.jpg?imwidth=1800',0.00,1),(58,50,'Shorts di jeans','Composizione: 100% cotone; Materiale: Jeans; Vita: Normale; Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali','M','Jeans',19.50,'Kiomi','Grigio','https://img01.ztat.net/article/K4/42/2F/01/EC/11/K4422F01E-C11@10.1.jpg?imwidth=1800',0.00,1),(59,50,'Jeans Skinny Fit','Composizione: 98% cotone, 2% elastan; Materiale: Jeans; Vita: Normale; Chiusura: Cerniera nascosta, Tasche: Tasche posteriori, Tasche laterali','M','Jeans',17.50,'YourTurn','Blu','https://img01.ztat.net/article/YO/12/2G/A2/7K/12/YO122GA27-K12@10.jpg?imwidth=1800',0.00,1),(60,50,'JJIGLENN JJORIGINAL - Jeans slim fit','Composizione: 70% cotone, 28% poliestere, 2% elastan; Materiale: Jeans; Vita: Normale; Chiusura: Abbottonatura a scatto, Tasche: Tasche posteriori, Tasche laterali','M','Jeans',31.99,'Jack & Jhons','Nero','https://img01.ztat.net/article/JA/22/2G/0V/DQ/11/JA222G0VD-Q11@4.jpg?imwidth=1800',0.00,1),(61,50,'Chino','Composizione: 60% cotone, 36% poliestere, 4% elastan; Vita: Normale; Chiusura: Cerniera nascosta; Tasche: Tasche posteriori, Tasche laterali; Fantasia: Monocromo; Dettagli: Tasche anteriori','M','Pantaloni',39.99,'Pier One','Blu','https://img01.ztat.net/article/PI/92/2E/A0/SK/11/PI922EA0S-K11@10.jpg?imwidth=1800',0.00,1),(62,50,'BAROQUE JOGGERS ','Composizione: 95% poliestere, 5% elastan; Materiale: Jersey; Vita: Normale; Tasche: Tasche laterali; Fantasia: Stampa; Dettagli: Fascia elastica','M','Pantaloni',24.99,'Boohoo Man','Multicolore','https://img01.ztat.net/article/BO/H2/2E/02/1T/11/BOH22E021-T11@8.jpg?imwidth=1800',0.00,1),(63,50,'CLASSIC JACKET - Giacca di pelle','Composizione: 100% pelle; Fodera: 100% cotone; Elementi non tessili di origine animale: Si; Colletto: Coreana; Chiusura: Cerniera; Tasche: Chiusura a cerniera, Tasca interna; Fantasia: Monocromo; Dettagli: Cerniera','M','Giacche',229.99,'Selected Homme','Nero','https://img01.ztat.net/article/SE/62/2T/04/EQ/11/SE622T04E-Q11@18.1.jpg?imwidth=1800',0.00,1),(64,50,'Giacca sportiva','Composizione: 100% poliestere; Fodera: Non imbottito; Colletto: Alto; Chiusura: Cerniera; Tasche: Chiusura a cerniera; Fantasia: Stampa; Dettagli: Fascia elastica','M','Giacche',38.00,'Nike','Nero','https://img01.ztat.net/article/NI/12/2T/01/UQ/11/NI122T01U-Q11@2.2.jpg?imwidth=1800',0.00,1),(65,50,'Giacca elegante','Composizione: 100% cotone; Fodera: 65% poliestere, 35% cotone; Colletto: Bavero; Chiusura: Bottoni; Tasche: Tasche con patta, Tasca interna','M','Giacche',41.99,'Pier One','Blu','https://img01.ztat.net/article/PI/92/2A/01/FK/11/PI922A01F-K11@7.jpg?imwidth=1800',0.00,1),(66,50,'Cappotto classico - BLU','Composizione: 86% poliestere, 7% lana, 4% acrilica, 1% poliammide, 1% viscosa, 1% cotone; Fodera: 100% poliestere; Colletto: Bavero; Chiusura: Bottoni; Tasche: Tasche con patta, Tasca interna; Fantasia: Melange','M','Cappotti',69.99,'Pier One','Blu','https://img01.ztat.net/article/PI/92/2T/00/PK/11/PI922T00P-K11@8.jpg?imwidth=1800',0.00,1),(67,50,'Cappotto classico - MARRONE','Composizione: 86% poliestere, 7% lana, 4% acrilica, 1% poliammide, 1% viscosa, 1% cotone; Fodera: 100% poliestere; Colletto: Bavero; Chiusura: Bottoni; Tasche: Tasche con patta, Tasca interna; Fantasia: Melange','M','Cappotti',69.99,'Pier One','Marrone','https://img01.ztat.net/article/PI/92/2T/00/PO/11/PI922T00P-O11@10.jpg?imwidth=1800',0.00,1),(68,50,'Cappotto classico - NERO','Composizione: 86% poliestere, 7% lana, 4% acrilica, 1% poliammide, 1% viscosa, 1% cotone; Fodera: 100% poliestere; Colletto: Bavero; Chiusura: Bottoni; Tasche: Tasche con patta, Tasca interna; Fantasia: Melange','M','Cappotti',69.99,'Pier One','Nero','https://img01.ztat.net/article/PI/92/2T/00/PQ/11/PI922T00P-Q11@10.jpg?imwidth=1800',0.00,1),(69,50,'Parka','Composizione: 100% poliestere; Materiale dell\'imbottitura: 100% poliestere; Fodera: 100% poliestere; Fodera: Leggermente imbottito','M','Cappotti',29.99,'Alcott','Nero','https://img01.ztat.net/article/AQ/82/2T/00/0Q/11/AQ822T000-Q11@12.jpg?imwidth=1800',0.00,1),(70,50,'TREVAIL HOODIE - Piumino','Composizione: 100% poliestere; Materiale dell\'imbottitura: 90% duvet, 10% piume; Fodera: 100% poliestere; Fodera: Imbottitura calda; Elementi non tessili di origine animale: Si','M','Cappotti',249.99,'The North Face','Nero','https://img01.ztat.net/article/TH/34/2F/05/1Q/11/TH342F051-Q11@20.jpg?imwidth=1800',0.00,1);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrato`
--

DROP TABLE IF EXISTS `registrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registrato` (
  `loginA` varchar(60) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`loginA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrato`
--

LOCK TABLES `registrato` WRITE;
/*!40000 ALTER TABLE `registrato` DISABLE KEYS */;
INSERT INTO `registrato` VALUES ('andrea@libero.it','andrea','andrea','caputo'),('anna@virgilio.it','anna','anna','peduto'),('giulia@tiscali.it','giulia','giulia','musto'),('matteo@alice.it','matteo','matteo','russo'),('rosalia@libero.it','rosalia','rosalia','capozzolo');
/*!40000 ALTER TABLE `registrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taglia`
--

DROP TABLE IF EXISTS `taglia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taglia` (
  `misura` varchar(2) NOT NULL,
  `IdProdotto` int(5) NOT NULL,
  `Quantità` int(2) DEFAULT '0',
  KEY `IdProdotto` (`IdProdotto`),
  CONSTRAINT `taglia_ibfk_1` FOREIGN KEY (`IdProdotto`) REFERENCES `prodotto` (`idprodotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taglia`
--

LOCK TABLES `taglia` WRITE;
/*!40000 ALTER TABLE `taglia` DISABLE KEYS */;
/*!40000 ALTER TABLE `taglia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `IdUtente` varchar(10) NOT NULL,
  `Nome` varchar(10) NOT NULL,
  `Cognome` varchar(10) NOT NULL,
  `Sesso` varchar(1) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Cellulare` varchar(10) NOT NULL,
  PRIMARY KEY (`IdUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('annuccia98','Anna','Sorrentino','F','annuccia@gmail.com','annuccia98','3394456321'),('drake','Davide','Adinolfi','M','drake@gmail.com','drake98','3401919832'),('Fiona88','Fiona','Di Gennaro','F','fionadigennaro@gmail.com','fiona880','3398934567'),('genny67','Gennaro','Senatore','M','genny67@gmail.com','genny67','3401234567');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 18:48:49
