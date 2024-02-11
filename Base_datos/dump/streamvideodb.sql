-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: streamvideodb
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `peliculaId` int(11) DEFAULT NULL,
  `serieId` int(11) DEFAULT NULL,
  `nombreFicticio` varchar(50) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peliculaId` (`peliculaId`),
  KEY `serieId` (`serieId`),
  CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`peliculaId`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `actor_ibfk_2` FOREIGN KEY (`serieId`) REFERENCES `series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES
(1,'Mike','Myers',60,1,NULL,'Shrek','https://cdn.semana.es/wp-content/uploads/2021/05/mike-myers.jpg'),
(2,'Eddie','Murphy',62,1,NULL,'Asno','https://static.wikia.nocookie.net/doblaje/images/1/1a/EddieMurphy.jpg/revision/latest?cb=20191103185619&path-prefix=es'),
(3,'Cameron','Diaz',51,1,NULL,'Fiona','https://media.revistagq.com/photos/5ca5f469d71dd925d8957a38/1:1/w_900,h_900,c_limit/cameron_diaz_2618.jpg'),
(4,'Anna','Faris',47,2,NULL,'Cindy Campbell','https://people.com/thmb/jHN9IEWqzA3RHujVPvhQRrQ5BzU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(689x319:691x321)/anna-faris-overboard-premiere-110122-438934bd979d4a91b641eb2e9c9a50be.jpg'),
(5,'Shawn','Wayans',52,2,NULL,'Ray Wilkins','https://www.wane.com/wp-content/uploads/sites/21/2023/03/Shawn-Wayans.jpg?w=1280'),
(6,'Marlon','Wayans',50,2,NULL,'Shorty Meeks','https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-11/marlon-wayans-lc-231113-3c6f4a.jpg'),
(7,'Daniel','Radcliffe',33,3,NULL,'Harry Potter','https://m.media-amazon.com/images/M/MV5BZmE0NzNiNzQtYTVlYS00MjljLWE4MTgtYzYxNjU2NjZkM2M4XkEyXkFqcGdeQXVyNjY5NDgzNjQ@._V1_.jpg'),
(8,'Rupert','Grint',34,3,NULL,'Ron Weasley','https://media.revistagq.com/photos/63d7977084d3d5687a19067b/1:1/w_2504,h_2504,c_limit/GettyImages-1188778598.jpg'),
(9,'Emma','Watson',32,3,NULL,'Hermione Granger','https://media.cnn.com/api/v1/images/stellar/prod/230417120259-emma-watson-birthday-file-091522.jpg?c=original'),
(10,'Vin','Diesel',55,4,NULL,'Dominic Toretto','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Vin_Diesel_2013_SDCC_%28cropped%29.jpg/1200px-Vin_Diesel_2013_SDCC_%28cropped%29.jpg'),
(11,'Dwayne','Johnson',50,4,NULL,'Luke Hobbs','https://i.ytimg.com/vi/Mw3jK9YwOxk/maxresdefault.jpg'),
(12,'Jason','Statham',55,4,NULL,'Deckard Shaw','https://hips.hearstapps.com/hmg-prod/images/jason-statham-attends-the-fast-furious-hobbs-shaw-special-news-photo-1700212301.jpg?crop=0.694xw:1.00xh;0.209xw,0&resize=1200:*'),
(13,'Keanu','Reeves',58,5,NULL,'John Wick','https://m.media-amazon.com/images/M/MV5BNGJmMWEzOGQtMWZkNS00MGNiLTk5NGEtYzg1YzAyZTgzZTZmXkEyXkFqcGdeQXVyMTE1MTYxNDAw._V1_.jpg'),
(14,'Halle','Berry',56,5,NULL,'Sofia','https://static.wikia.nocookie.net/doblaje/images/6/68/Halle_Berry_2019.jpg/revision/latest?cb=20190503220115&path-prefix=es'),
(15,'Ian','McShane',80,5,NULL,'Winston','https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/03/07/09/ian-mcshane.jpg?quality=75&width=1200&auto=webp'),
(17,'Andrew','Lincoln',50,NULL,1,'Rick Grimes','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/78719_v9_bb.jpg'),
(18,'Norman','Reedus',45,NULL,1,'Daryl Dixon','https://people.com/thmb/UnflRdOaObMhRB0_wWZQHBAgjyc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(719x349:721x351)/norman-reedus-84569121b8ad439eb52a89f1217c2621.jpg'),
(19,'Melissa','McBride',59,NULL,1,'Carol Peletier','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/397746_v9_bc.jpg'),
(20,'Bryan','Cranston',66,NULL,2,'Walter White','https://hips.hearstapps.com/hmg-prod/images/rs-18374-121813-ww-1800-1387390916.jpg?crop=0.752xw:1.00xh;0,0&resize=2048:*'),
(21,'Aaron','Paul',43,NULL,2,'Jesse Pinkman','https://media.vanityfair.com/photos/5c8e9033b515803ea55ee6c8/4:3/w_1336,h_1002,c_limit/aaron-paul-breaking-bad-movie.jpg'),
(22,'Anna','Gunn',54,NULL,2,'Skyler White','https://www.usatoday.com/gcdn/-mm-/4df1855554f7c0890bf388e619378c062ae8d832/c=0-55-3900-2254/local/-/media/USATODAY/None/2014/10/02/1412274799000-Gracepoint-Anna-Gunn.jpg'),
(23,'Ricardo','Arroyo',56,NULL,3,'Amador Rivas','https://es.web.img2.acsta.net/r_1280_720/pictures/20/11/17/12/50/4713969.jpg'),
(24,'Paz','Padilla',55,NULL,3,'Chusa','https://s1.ppllstatics.com/lasprovincias/www/multimedia/202208/10/media/cortadas/Captura%20de%20pantalla%20(5)-RaARRT0RNTksmTBUEpfaU5N-1248x770@Las%20Provincias.png'),
(25,'José Luis','Gil',67,NULL,3,'Enrique Pastor','https://okdiario.com/img/2023/03/18/jose-luis-gil-1.jpg'),
(26,'José','Coronado',66,NULL,4,'Tirso Abantos','https://media.diariouno.com.ar/p/c9511126be7e46cbce9172eca0e0a642/adjuntos/298/imagenes/009/281/0009281664/1200x0/smart/vivir-permiso-3jpg.jpg'),
(27,'Luis','Zahera',57,NULL,4,'Ezequiel Fandiño','https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/11/14/16684180745977.jpg'),
(28,'Felipe','Londoño',29,NULL,4,'Nelson Gutiérrez','https://media.e-talenta.eu/foto/1584564.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjZmV0IiwiYXVkIjoiY2ZldCIsImlhdCI6MTY0MjM0MDQ0NiwiZXhwIjoxNjQyMzQ3NjQ2LCJkYXRhIjp7ImNkbl9zY29wZSI6ImZvdG8iLCJjZG5faWQiOjE1ODQ1NjQsInVzZXJfcHJvZmlsZUlkIjowLCJub0luZGV4IjpmYWxzZX19.hA-HBGW4sTeSMNNYFSQbgur-fp7FA8zD3BiRI9riECY'),
(29,'Wentworth','Miller',52,NULL,5,'Michael Scofield','https://static.wikia.nocookie.net/arrow/images/1/1d/Wentworth_Miller.png/revision/latest?cb=20141129190548&path-prefix=es'),
(30,'Dominic','Purcell',54,NULL,5,'Lincoln Burrows','https://facts.net/wp-content/uploads/2023/07/34-facts-about-dominic-purcell-1690163477.jpg'),
(31,'Sarah','Wayne',47,NULL,5,'Sara Tancredi','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/261190_v9_bb.jpg');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariospeliculas`
--

DROP TABLE IF EXISTS `comentariospeliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentariospeliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(800) DEFAULT NULL,
  `peliculaId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peliculaId` (`peliculaId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comentariospeliculas_ibfk_1` FOREIGN KEY (`peliculaId`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `comentariospeliculas_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariospeliculas`
--

LOCK TABLES `comentariospeliculas` WRITE;
/*!40000 ALTER TABLE `comentariospeliculas` DISABLE KEYS */;
INSERT INTO `comentariospeliculas` VALUES
(1,'Inception me voló la cabeza!',1,1),
(2,'The Shawshank Redemption es imprescindible',2,2),
(3,'The Dark Knight - Heath Ledger fue increíble',3,3),
(4,'Pulp Fiction - brillantez de Quentin Tarantino',4,4),
(5,'The Godfather - una obra maestra cinematográfica',5,5),
(6,'The Matrix - un viaje a lo desconocido',6,6),
(7,'Forrest Gump - un relato conmovedor',7,7),
(8,'Fight Club - impactante e intensa',8,8),
(9,'LOTR: Fellowship - fantasía épica',9,9),
(10,'Silence of the Lambs - thriller escalofriante',10,10);
/*!40000 ALTER TABLE `comentariospeliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariosseries`
--

DROP TABLE IF EXISTS `comentariosseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentariosseries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(800) DEFAULT NULL,
  `serieId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serieId` (`serieId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comentariosseries_ibfk_1` FOREIGN KEY (`serieId`) REFERENCES `series` (`id`),
  CONSTRAINT `comentariosseries_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariosseries`
--

LOCK TABLES `comentariosseries` WRITE;
/*!40000 ALTER TABLE `comentariosseries` DISABLE KEYS */;
INSERT INTO `comentariosseries` VALUES
(1,'Breaking Bad es una obra maestra!',1,1),
(2,'Stranger Things es tan nostálgica',2,2),
(3,'The Crown ofrece una experiencia real',3,3),
(4,'Game of Thrones es épica!',4,4),
(5,'Friends siempre me hace reír',5,5),
(6,'The Office es un clásico',6,6),
(7,'Black Mirror es alucinante',7,7),
(8,'Westworld - donde la realidad se difumina',8,8),
(9,'Narcos cuenta una historia envolvente',9,9),
(10,'The Mandalorian es una joya de Star Wars',10,10);
/*!40000 ALTER TABLE `comentariosseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peliculaId` int(11) DEFAULT NULL,
  `serieId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `esFavorito` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peliculaId` (`peliculaId`),
  KEY `serieId` (`serieId`),
  KEY `userId` (`userId`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`peliculaId`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`serieId`) REFERENCES `series` (`id`),
  CONSTRAINT `favoritos_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES
(1,1,1,1,1),
(2,2,2,2,1),
(3,3,3,3,1),
(4,4,4,4,1),
(5,5,5,5,1),
(6,6,6,6,1),
(7,7,7,7,1),
(8,8,8,8,1),
(9,9,9,9,1),
(10,10,10,10,1);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` varchar(200) DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `plataformaId` int(11) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `urlImagen` varchar(5500) DEFAULT NULL,
  `actorId` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `comentarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plataformaId` (`plataformaId`),
  KEY `FK_actorId_peliculas` (`actorId`),
  KEY `FK_comentarioId_peliculas` (`comentarioId`),
  CONSTRAINT `FK_actorId_peliculas` FOREIGN KEY (`actorId`) REFERENCES `actor` (`id`),
  CONSTRAINT `FK_comentarioId_peliculas` FOREIGN KEY (`comentarioId`) REFERENCES `comentariospeliculas` (`id`),
  CONSTRAINT `FK_plataformaId` FOREIGN KEY (`plataformaId`) REFERENCES `plataformas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES
(1,'Inception','Ciencia Ficción',2010,1,'Un thriller psicológico que desafía la mente. Dom Cobb se sumerge en los sueños para robar secretos empresariales.','https://4.bp.blogspot.com/_dAGq_7k2IB8/S_cWJtnAbjI/AAAAAAAABa8/kKVq2-TF-Os/s1600/Inception.jpg',1,148,5,1),
(2,'The Shawshank Redemption','Drama',1994,2,'La esperanza es algo bueno, quizás lo mejor de las cosas. La historia de Andy Dufresne en Shawshank.','https://pics.filmaffinity.com/Cadena_perpetua-576140557-mmed.jpg',2,142,5,2),
(3,'The Dark Knight','Acción',2008,1,'El reinado del caos del Joker. Batman enfrenta al criminal que busca sumir a Gotham en el caos.','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',3,152,5,3),
(4,'Pulp Fiction','Crimen',1994,3,'Un viaje salvaje por Los Ángeles. Las vidas de varios personajes se entrelazan en historias no lineales.','https://m.media-amazon.com/images/I/71QMaptCTdL._AC_UF894,1000_QL80_.jpg',4,154,4,4),
(5,'The Godfather','Crimen',1972,2,'Una oferta que no puedes rechazar. La historia de la familia Corleone en el mundo del crimen organizado.','https://m.media-amazon.com/images/I/81fc+fWtALL._AC_UF894,1000_QL80_.jpg',5,175,5,5),
(6,'The Matrix','Ciencia Ficción',1999,1,'La realidad es cosa del pasado. Neo descubre la verdad detrás del mundo aparentemente real.','https://decine21.com/images/noticias/0001/matrix-4-resumen-saga.jpg',6,136,4,6),
(7,'Forrest Gump','Drama',1994,3,'La vida es como una caja de chocolates. Forrest Gump vive una vida extraordinaria y se cruza con eventos históricos.','https://m.media-amazon.com/images/S/pv-target-images/2d0c9e38968936e6711c7fb2bc7895b82d8bb9178b5a854e14dffa4b17b88487.jpg',7,142,4,7),
(8,'Fight Club','Drama',1999,3,'La primera regla del Fight Club es... no hablar del Fight Club. Un viaje a la anarquía y la liberación personal.','https://m.media-amazon.com/images/I/71TdVILcp9L._AC_UF894,1000_QL80_.jpg',8,139,5,8),
(9,'The Lord of the Rings: The Fellowship of the Ring','Fantasía',2001,2,'Un anillo para gobernarlos a todos. La Comunidad del Anillo inicia una épica búsqueda en la Tierra Media.','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p28828_p_v10_am.jpg',9,178,5,9),
(10,'The Silence of the Lambs','Thriller',1991,3,'Hola, Clarice. La agente del FBI, Clarice Starling, busca la ayuda del Dr. Hannibal Lecter para atrapar a un asesino en serie.','https://m.media-amazon.com/images/I/7107+d5darL._AC_UF894,1000_QL80_.jpg',10,118,5,10);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plataformas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `peliculaId` int(11) DEFAULT NULL,
  `serieId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peliculaId` (`peliculaId`),
  KEY `serieId` (`serieId`),
  CONSTRAINT `plataformas_ibfk_1` FOREIGN KEY (`peliculaId`) REFERENCES `peliculas` (`id`),
  CONSTRAINT `plataformas_ibfk_2` FOREIGN KEY (`serieId`) REFERENCES `series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES
(1,'Netflix',1,2),
(2,'Amazon Prime Video',2,1),
(3,'Hulu',3,3),
(4,'HBO',4,4),
(5,'Disney+',5,5),
(6,'HBO',6,6),
(7,'Netflix',7,7),
(8,'Hulu',8,8),
(9,'Amazon Prime Video',9,9),
(10,'Disney+',10,10);
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `año` year(4) DEFAULT NULL,
  `numTemporadas` int(11) DEFAULT NULL,
  `plataformaId` int(11) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `urlImagen` varchar(2000) DEFAULT NULL,
  `actorId` int(11) DEFAULT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `comentarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plataformaId_series` (`plataformaId`),
  KEY `FK_actorId_series` (`actorId`),
  KEY `FK_comentarioId_series` (`comentarioId`),
  CONSTRAINT `FK_actorId_series` FOREIGN KEY (`actorId`) REFERENCES `actor` (`id`),
  CONSTRAINT `FK_comentarioId_series` FOREIGN KEY (`comentarioId`) REFERENCES `comentariosseries` (`id`),
  CONSTRAINT `FK_plataformaId_series` FOREIGN KEY (`plataformaId`) REFERENCES `plataformas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES
(1,'Breaking Bad','Crimen',2008,5,1,'Desde profesor de química hasta rey de la metanfetamina. La transformación de Walter White en el mundo del crimen.','https://pics.filmaffinity.com/breaking_bad-504442815-mmed.jpg',1,5,1),
(2,'Stranger Things','Ciencia Ficción',2016,4,2,'Extraños sucesos en Hawkins. Un grupo de niños enfrenta a criaturas sobrenaturales y secretos gubernamentales.','https://pics.filmaffinity.com/Stranger_Things_Serie_de_TV-875025085-large.jpg',2,4,2),
(3,'The Crown','Drama',2016,4,3,'La historia de la familia real británica. Desde la coronación de la Reina Isabel II hasta los eventos más recientes.','https://pics.filmaffinity.com/the_crown-838357032-mmed.jpg',3,4,3),
(4,'Game of Thrones','Fantasía',2011,8,4,'Una Canción de Hielo y Fuego. Intrigas políticas, traiciones y batallas en la lucha por el Trono de Hierro.','https://m.media-amazon.com/images/I/91eXHA-8K9L._AC_UF894,1000_QL80_.jpg',4,5,4),
(5,'Friends','Comedia',1994,10,5,'El que todos se hicieron amigos. Las peripecias y relaciones de seis amigos en Nueva York.','https://m.media-amazon.com/images/M/MV5BNDVkYjU0MzctMWRmZi00NTkxLTgwZWEtOWVhYjZlYjllYmU4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg',5,4,5),
(6,'The Office','Comedia',2005,9,6,'Locuras en Dunder Mifflin Paper Company. La vida cotidiana en una oficina llena de personajes peculiares.','https://upload.wikimedia.org/wikipedia/en/5/58/TheOffice_S7_DVD.jpg',6,4,6),
(7,'Black Mirror','Ciencia Ficción',2011,5,7,'El lado oscuro de la tecnología. Episodios independientes exploran futuros distópicos y dilemas éticos.','https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2017/06/black-mirror-portada.jpg?tf=1200x',7,5,7),
(8,'Westworld','Ciencia Ficción',2016,3,8,'Donde nada puede salir mal... sale mal. Un parque temático de robots con conciencia propia.','https://images.ecestaticos.com/haUF0Cfi4N8Ex5ya5ZYEqiNQTTM=/146x0:875x409/1600x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F3b2%2Ff83%2F8f7%2F3b2f838f792aa61c3053c428258b10e5.jpg',8,4,8),
(9,'Narcos','Crimen',2015,3,9,'El auge y caída de los señores de la droga. Basada en hechos reales, la historia de los cárteles de Colombia.','https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_NarcosRiseOfTheCartels_image1600w.jpg',9,4,9),
(10,'The Mandalorian','Acción',2019,2,10,'Cazarrecompensas en el universo de Star Wars. Aventuras de un pistolero solitario en la galaxia muy, muy lejana.','https://static.wikia.nocookie.net/esstarwars/images/7/71/TheArtofTheMandalorian%28Season_One%29ES.jpg/revision/latest?cb=20210630040243',10,5,10);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `contraseña` varchar(200) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `favoritoId` int(11) DEFAULT NULL,
  `comentariopeliculaId` int(11) DEFAULT NULL,
  `comentarioserieId` int(11) DEFAULT NULL,
  `sessionToken` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_favoritoId` (`favoritoId`),
  KEY `FK_comentariopeliculaId` (`comentariopeliculaId`),
  KEY `FK_comentarioserieId` (`comentarioserieId`),
  CONSTRAINT `FK_comentariopeliculaId` FOREIGN KEY (`comentariopeliculaId`) REFERENCES `comentariospeliculas` (`id`),
  CONSTRAINT `FK_comentarioserieId` FOREIGN KEY (`comentarioserieId`) REFERENCES `comentariosseries` (`id`),
  CONSTRAINT `FK_favoritoId` FOREIGN KEY (`favoritoId`) REFERENCES `favoritos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'John','Doe','Contraseña123','123456789','john.doe@email.com',1,1,1,NULL),
(2,'Jane','Smith','OtraContraseña','987654321','jane.smith@email.com',2,2,2,NULL),
(3,'Michael','Johnson','Pass123','555666777','michael.johnson@email.com',3,3,2,NULL),
(4,'Emily','Williams','SecurePwd','111222333','emily.williams@email.com',4,4,4,NULL),
(5,'David','Brown','SecretPass','999888777','david.brown@email.com',5,5,5,NULL),
(6,'Olivia','Davis','Hidden123','333444555','olivia.davis@email.com',6,6,6,NULL),
(7,'William','Martinez','TopSecret','777888999','william.martinez@email.com',7,7,7,NULL),
(8,'Sophia','Anderson','Confidential','444555666','sophia.anderson@email.com',8,8,8,NULL),
(9,'James','Taylor','Secure123','666777888','james.taylor@email.com',9,9,9,NULL),
(10,'Emma','Hernandez','SafePwd','888999000','emma.hernandez@email.com',10,10,10,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 13:25:58
