drop database if exists streamvideodb;
create database streamvideodb;
use streamvideodb;

-- Crear la tabla 'users'
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) ,
    apellidos VARCHAR(100) ,
    contraseña VARCHAR(200) ,
    telefono CHAR(9),
    email VARCHAR(100) ,
    favoritoId INT,
    comentariopeliculaId INT ,
    comentarioserieId INT
);

-- Crear la tabla 'peliculas'
CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    genero VARCHAR(200) ,
    año YEAR ,
    plataformaId INT ,
    descripcion VARCHAR(300),
    urlImagen VARCHAR(5500) ,
    actorId INT ,
    duracion INT,
    valoracion INT ,
    comentarioId INT 
);

-- Crear la tabla 'series'
CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) ,
    genero VARCHAR(30) ,
    año YEAR ,
    numTemporadas INT ,
    plataformaId INT ,
    descripcion VARCHAR(300) ,
    urlImagen VARCHAR(2000) ,
    actorId INT ,
    valoracion INT ,
    comentarioId INT 
);

-- Crear la tabla 'comentariosseries'
CREATE TABLE comentariosseries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comentario VARCHAR(800),
    serieId INT,
    userId INT 
);

-- Crear la tabla 'comentariospeliculas'
CREATE TABLE comentariospeliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comentario VARCHAR(800),
    peliculaId INT,
    userId INT 
);

-- Crear la tabla 'favoritos'
CREATE TABLE favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    peliculaId INT,
    serieId INT,
    userId INT ,
    esFavorito BOOLEAN 
);

-- Crear la tabla 'plataformas'
CREATE TABLE plataformas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) ,
    peliculaId INT,
    serieId INT
);

-- Crear la tabla 'actor'
CREATE TABLE actor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) ,
    apellidos VARCHAR(100) ,
    edad INT ,
    peliculaId INT,
    serieId INT,
    nombreFicticio VARCHAR(50) ,
    foto VARCHAR(500) 
);


-- Insertar datos en la tabla 'users'
INSERT INTO users (nombre, apellidos, contraseña, telefono, email, favoritoId, comentariopeliculaId, comentarioserieId)
VALUES 
('John', 'Doe', 'Contraseña123', '123456789', 'john.doe@email.com', 1, 1, 1),
('Jane', 'Smith', 'OtraContraseña', '987654321', 'jane.smith@email.com', 2, 2, 2),
('Michael', 'Johnson', 'Pass123', '555666777', 'michael.johnson@email.com', 3, 3, 2),
('Emily', 'Williams', 'SecurePwd', '111222333', 'emily.williams@email.com', 4, 4, 4),
('David', 'Brown', 'SecretPass', '999888777', 'david.brown@email.com', 5, 5, 5),
('Olivia', 'Davis', 'Hidden123', '333444555', 'olivia.davis@email.com', 6, 6, 6),
('William', 'Martinez', 'TopSecret', '777888999', 'william.martinez@email.com', 7, 7, 7),
('Sophia', 'Anderson', 'Confidential', '444555666', 'sophia.anderson@email.com', 8, 8, 8),
('James', 'Taylor', 'Secure123', '666777888', 'james.taylor@email.com', 9, 9, 9),
('Emma', 'Hernandez', 'SafePwd', '888999000', 'emma.hernandez@email.com', 10, 10, 10);


-- Inserciones para la tabla 'peliculas'
INSERT INTO peliculas (nombre, genero, año, plataformaId, descripcion, urlImagen, actorId, duracion, valoracion, comentarioId)
VALUES 
('Inception', 'Ciencia Ficción', 2010, 1, 'Un thriller psicológico que desafía la mente. Dom Cobb se sumerge en los sueños para robar secretos empresariales.', 'https://4.bp.blogspot.com/_dAGq_7k2IB8/S_cWJtnAbjI/AAAAAAAABa8/kKVq2-TF-Os/s1600/Inception.jpg', 1, 148, 5, 1),
('The Shawshank Redemption', 'Drama', 1994, 2, 'La esperanza es algo bueno, quizás lo mejor de las cosas. La historia de Andy Dufresne en Shawshank.', 'https://pics.filmaffinity.com/Cadena_perpetua-576140557-mmed.jpg', 2, 142, 5, 2),
('The Dark Knight', 'Acción', 2008, 1, 'El reinado del caos del Joker. Batman enfrenta al criminal que busca sumir a Gotham en el caos.', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 3, 152, 5, 3),
('Pulp Fiction', 'Crimen', 1994, 3, 'Un viaje salvaje por Los Ángeles. Las vidas de varios personajes se entrelazan en historias no lineales.', 'https://m.media-amazon.com/images/I/71QMaptCTdL._AC_UF894,1000_QL80_.jpg', 4, 154, 4, 4),
('The Godfather', 'Crimen', 1972, 2, 'Una oferta que no puedes rechazar. La historia de la familia Corleone en el mundo del crimen organizado.', 'https://m.media-amazon.com/images/I/81fc+fWtALL._AC_UF894,1000_QL80_.jpg', 5, 175, 5, 5),
('The Matrix', 'Ciencia Ficción', 1999, 1, 'La realidad es cosa del pasado. Neo descubre la verdad detrás del mundo aparentemente real.', 'https://decine21.com/images/noticias/0001/matrix-4-resumen-saga.jpg', 6, 136, 4, 6),
('Forrest Gump', 'Drama', 1994, 3, 'La vida es como una caja de chocolates. Forrest Gump vive una vida extraordinaria y se cruza con eventos históricos.', 'https://m.media-amazon.com/images/S/pv-target-images/2d0c9e38968936e6711c7fb2bc7895b82d8bb9178b5a854e14dffa4b17b88487.jpg', 7, 142, 4, 7),
('Fight Club', 'Drama', 1999, 3, 'La primera regla del Fight Club es... no hablar del Fight Club. Un viaje a la anarquía y la liberación personal.', 'https://m.media-amazon.com/images/I/71TdVILcp9L._AC_UF894,1000_QL80_.jpg', 8, 139, 5, 8),
('The Lord of the Rings: The Fellowship of the Ring', 'Fantasía', 2001, 2, 'Un anillo para gobernarlos a todos. La Comunidad del Anillo inicia una épica búsqueda en la Tierra Media.', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p28828_p_v10_am.jpg', 9, 178, 5, 9),
('The Silence of the Lambs', 'Thriller', 1991, 3, 'Hola, Clarice. La agente del FBI, Clarice Starling, busca la ayuda del Dr. Hannibal Lecter para atrapar a un asesino en serie.', 'https://m.media-amazon.com/images/I/7107+d5darL._AC_UF894,1000_QL80_.jpg', 10, 118, 5, 10);
-- Inserciones para la tabla 'series'
INSERT INTO series (nombre, genero, año, numTemporadas, plataformaId, descripcion, urlImagen, actorId, valoracion, comentarioId)
VALUES 
('Breaking Bad', 'Crimen', 2008, 5, 1, 'Desde profesor de química hasta rey de la metanfetamina. La transformación de Walter White en el mundo del crimen.', 'https://pics.filmaffinity.com/breaking_bad-504442815-mmed.jpg', 1, 5, 1),
('Stranger Things', 'Ciencia Ficción', 2016, 4, 2, 'Extraños sucesos en Hawkins. Un grupo de niños enfrenta a criaturas sobrenaturales y secretos gubernamentales.', 'https://pics.filmaffinity.com/Stranger_Things_Serie_de_TV-875025085-large.jpg', 2, 4, 2),
('The Crown', 'Drama', 2016, 4, 3, 'La historia de la familia real británica. Desde la coronación de la Reina Isabel II hasta los eventos más recientes.', 'https://pics.filmaffinity.com/the_crown-838357032-mmed.jpg', 3, 4, 3),
('Game of Thrones', 'Fantasía', 2011, 8, 4, 'Una Canción de Hielo y Fuego. Intrigas políticas, traiciones y batallas en la lucha por el Trono de Hierro.', 'https://m.media-amazon.com/images/I/91eXHA-8K9L._AC_UF894,1000_QL80_.jpg', 4, 5, 4),
('Friends', 'Comedia', 1994, 10, 5, 'El que todos se hicieron amigos. Las peripecias y relaciones de seis amigos en Nueva York.', 'https://m.media-amazon.com/images/M/MV5BNDVkYjU0MzctMWRmZi00NTkxLTgwZWEtOWVhYjZlYjllYmU4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg', 5, 4, 5),
('The Office', 'Comedia', 2005, 9, 6, 'Locuras en Dunder Mifflin Paper Company. La vida cotidiana en una oficina llena de personajes peculiares.', 'https://upload.wikimedia.org/wikipedia/en/5/58/TheOffice_S7_DVD.jpg', 6, 4, 6),
('Black Mirror', 'Ciencia Ficción', 2011, 5, 7, 'El lado oscuro de la tecnología. Episodios independientes exploran futuros distópicos y dilemas éticos.', 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2017/06/black-mirror-portada.jpg?tf=1200x', 7, 5, 7),
('Westworld', 'Ciencia Ficción', 2016, 3, 8, 'Donde nada puede salir mal... sale mal. Un parque temático de robots con conciencia propia.', 'https://images.ecestaticos.com/haUF0Cfi4N8Ex5ya5ZYEqiNQTTM=/146x0:875x409/1600x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F3b2%2Ff83%2F8f7%2F3b2f838f792aa61c3053c428258b10e5.jpg', 8, 4, 8),
('Narcos', 'Crimen', 2015, 3, 9, 'El auge y caída de los señores de la droga. Basada en hechos reales, la historia de los cárteles de Colombia.', 'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_NarcosRiseOfTheCartels_image1600w.jpg', 9, 4, 9),
('The Mandalorian', 'Acción', 2019, 2, 10, 'Cazarrecompensas en el universo de Star Wars. Aventuras de un pistolero solitario en la galaxia muy, muy lejana.', 'https://static.wikia.nocookie.net/esstarwars/images/7/71/TheArtofTheMandalorian%28Season_One%29ES.jpg/revision/latest?cb=20210630040243', 10, 5, 10);
-- Insertar datos en la tabla 'favoritos'
-- Inserciones para la tabla 'comentariosseries'
INSERT INTO comentariosseries (comentario, serieId, userId)
VALUES 
('Breaking Bad es una obra maestra!', 1, 1),
('Stranger Things es tan nostálgica', 2, 2),
('The Crown ofrece una experiencia real', 3, 3),
('Game of Thrones es épica!', 4, 4),
('Friends siempre me hace reír', 5, 5),
('The Office es un clásico', 6, 6),
('Black Mirror es alucinante', 7, 7),
('Westworld - donde la realidad se difumina', 8, 8),
('Narcos cuenta una historia envolvente', 9, 9),
('The Mandalorian es una joya de Star Wars', 10, 10);
  
-- Inserciones para la tabla 'comentariospeliculas'
INSERT INTO comentariospeliculas (comentario, peliculaId, userId)
VALUES 
('Inception me voló la cabeza!', 1, 1),
('The Shawshank Redemption es imprescindible', 2, 2),
('The Dark Knight - Heath Ledger fue increíble', 3, 3),
('Pulp Fiction - brillantez de Quentin Tarantino', 4, 4),
('The Godfather - una obra maestra cinematográfica', 5, 5),
('The Matrix - un viaje a lo desconocido', 6, 6),
('Forrest Gump - un relato conmovedor', 7, 7),
('Fight Club - impactante e intensa', 8, 8),
('LOTR: Fellowship - fantasía épica', 9, 9),
('Silence of the Lambs - thriller escalofriante', 10, 10);

-- Insertar datos en la tabla 'plataformas'
-- Inserciones para la tabla 'favoritos'
INSERT INTO favoritos (peliculaId, serieId, userId, esFavorito)
VALUES 
(1, 1, 1, true),
(2, 2, 2, true),
(3, 3, 3, true),
(4, 4, 4, true),
(5, 5, 5, true),
(6, 6, 6, true),
(7, 7, 7, true),
(8, 8, 8, true),
(9, 9, 9, true),
(10, 10, 10, true);
/*
-- Inserciones para la tabla 'verLuego'
INSERT INTO verLuego (serieId, peliculaId, userId, vtarde)
VALUES 
(1, 2, 1, false),
(2, 1, 2, true),
(3, 4, 3, false),
(4, 3, 4, true),
(5, 6, 5, false),
(6, 5, 6, true),
(7, 8, 7, false),
(8, 7, 8, true),
(9, 10, 9, false),
(10, 9, 10, true);
*/
-- Inserciones para la tabla 'plataformas'
INSERT INTO plataformas (nombre, peliculaId, serieId)
VALUES 
('Netflix', 1, 2),
('Amazon Prime Video', 2, 1),
('Hulu', 3, 3),
('HBO', 4, 4),
('Disney+', 5, 5),
('HBO', 6, 6),
('Netflix', 7, 7),
('Hulu', 8, 8),
('Amazon Prime Video', 9, 9),
('Disney+', 10, 10);

-- Insertar datos en la tabla 'actor'
INSERT INTO actor (id, nombre, apellidos, edad, peliculaId, serieId, nombreFicticio, foto)
VALUES
  (1, 'Mike', 'Myers', 60, 1, null, 'Shrek', 'https://cdn.semana.es/wp-content/uploads/2021/05/mike-myers.jpg' ),
  (2, 'Eddie', 'Murphy', 62, 1, null, 'Asno', 'https://static.wikia.nocookie.net/doblaje/images/1/1a/EddieMurphy.jpg/revision/latest?cb=20191103185619&path-prefix=es'),
  (3, 'Cameron', 'Diaz', 51, 1, null, 'Fiona','https://media.revistagq.com/photos/5ca5f469d71dd925d8957a38/1:1/w_900,h_900,c_limit/cameron_diaz_2618.jpg'),
  (4, 'Anna', 'Faris', 47, 2, null, 'Cindy Campbell','https://people.com/thmb/jHN9IEWqzA3RHujVPvhQRrQ5BzU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(689x319:691x321)/anna-faris-overboard-premiere-110122-438934bd979d4a91b641eb2e9c9a50be.jpg'),
  (5, 'Shawn', 'Wayans', 52, 2, null, 'Ray Wilkins', 'https://www.wane.com/wp-content/uploads/sites/21/2023/03/Shawn-Wayans.jpg?w=1280'),
  (6, 'Marlon', 'Wayans', 50, 2, null, 'Shorty Meeks','https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-11/marlon-wayans-lc-231113-3c6f4a.jpg'),
  (7, 'Daniel', 'Radcliffe', 33, 3, null, 'Harry Potter','https://m.media-amazon.com/images/M/MV5BZmE0NzNiNzQtYTVlYS00MjljLWE4MTgtYzYxNjU2NjZkM2M4XkEyXkFqcGdeQXVyNjY5NDgzNjQ@._V1_.jpg'),
  (8, 'Rupert', 'Grint', 34, 3, null, 'Ron Weasley','https://media.revistagq.com/photos/63d7977084d3d5687a19067b/1:1/w_2504,h_2504,c_limit/GettyImages-1188778598.jpg'),
  (9, 'Emma', 'Watson', 32, 3, null, 'Hermione Granger','https://media.cnn.com/api/v1/images/stellar/prod/230417120259-emma-watson-birthday-file-091522.jpg?c=original'),
  (10, 'Vin', 'Diesel', 55, 4, null, 'Dominic Toretto','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Vin_Diesel_2013_SDCC_%28cropped%29.jpg/1200px-Vin_Diesel_2013_SDCC_%28cropped%29.jpg'),
  (11, 'Dwayne', 'Johnson', 50, 4, null, 'Luke Hobbs','https://i.ytimg.com/vi/Mw3jK9YwOxk/maxresdefault.jpg'),
  (12, 'Jason', 'Statham', 55, 4, null, 'Deckard Shaw','https://hips.hearstapps.com/hmg-prod/images/jason-statham-attends-the-fast-furious-hobbs-shaw-special-news-photo-1700212301.jpg?crop=0.694xw:1.00xh;0.209xw,0&resize=1200:*'),
  (13, 'Keanu', 'Reeves', 58, 5, null, 'John Wick','https://m.media-amazon.com/images/M/MV5BNGJmMWEzOGQtMWZkNS00MGNiLTk5NGEtYzg1YzAyZTgzZTZmXkEyXkFqcGdeQXVyMTE1MTYxNDAw._V1_.jpg'),
  (14, 'Halle', 'Berry', 56, 5, null, 'Sofia','https://static.wikia.nocookie.net/doblaje/images/6/68/Halle_Berry_2019.jpg/revision/latest?cb=20190503220115&path-prefix=es'),
  (15, 'Ian', 'McShane', 80, 5, null, 'Winston','https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/03/07/09/ian-mcshane.jpg?quality=75&width=1200&auto=webp'),
  (17, 'Andrew', 'Lincoln', 50, null, 1, 'Rick Grimes','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/78719_v9_bb.jpg'),
  (18, 'Norman', 'Reedus', 45, null, 1, 'Daryl Dixon','https://people.com/thmb/UnflRdOaObMhRB0_wWZQHBAgjyc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(719x349:721x351)/norman-reedus-84569121b8ad439eb52a89f1217c2621.jpg'),
  (19, 'Melissa', 'McBride', 59, null, 1, 'Carol Peletier','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/397746_v9_bc.jpg'),
  (20, 'Bryan', 'Cranston', 66, null, 2, 'Walter White','https://hips.hearstapps.com/hmg-prod/images/rs-18374-121813-ww-1800-1387390916.jpg?crop=0.752xw:1.00xh;0,0&resize=2048:*'),
  (21, 'Aaron', 'Paul', 43, null, 2, 'Jesse Pinkman','https://media.vanityfair.com/photos/5c8e9033b515803ea55ee6c8/4:3/w_1336,h_1002,c_limit/aaron-paul-breaking-bad-movie.jpg'),
  (22, 'Anna', 'Gunn', 54, null, 2, 'Skyler White','https://www.usatoday.com/gcdn/-mm-/4df1855554f7c0890bf388e619378c062ae8d832/c=0-55-3900-2254/local/-/media/USATODAY/None/2014/10/02/1412274799000-Gracepoint-Anna-Gunn.jpg'),
  (23, 'Ricardo', 'Arroyo', 56, null, 3, 'Amador Rivas','https://es.web.img2.acsta.net/r_1280_720/pictures/20/11/17/12/50/4713969.jpg'),
  (24, 'Paz', 'Padilla', 55, null, 3, 'Chusa','https://s1.ppllstatics.com/lasprovincias/www/multimedia/202208/10/media/cortadas/Captura%20de%20pantalla%20(5)-RaARRT0RNTksmTBUEpfaU5N-1248x770@Las%20Provincias.png'),
  (25, 'José Luis', 'Gil', 67, null, 3, 'Enrique Pastor','https://okdiario.com/img/2023/03/18/jose-luis-gil-1.jpg'),
  (26, 'José', 'Coronado', 66, null, 4, 'Tirso Abantos','https://media.diariouno.com.ar/p/c9511126be7e46cbce9172eca0e0a642/adjuntos/298/imagenes/009/281/0009281664/1200x0/smart/vivir-permiso-3jpg.jpg'),
  (27, 'Luis', 'Zahera', 57, null, 4, 'Ezequiel Fandiño','https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/11/14/16684180745977.jpg'),
  (28, 'Felipe', 'Londoño', 29, null, 4, 'Nelson Gutiérrez','https://media.e-talenta.eu/foto/1584564.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjZmV0IiwiYXVkIjoiY2ZldCIsImlhdCI6MTY0MjM0MDQ0NiwiZXhwIjoxNjQyMzQ3NjQ2LCJkYXRhIjp7ImNkbl9zY29wZSI6ImZvdG8iLCJjZG5faWQiOjE1ODQ1NjQsInVzZXJfcHJvZmlsZUlkIjowLCJub0luZGV4IjpmYWxzZX19.hA-HBGW4sTeSMNNYFSQbgur-fp7FA8zD3BiRI9riECY'),
  (29, 'Wentworth', 'Miller', 52, null, 5, 'Michael Scofield','https://static.wikia.nocookie.net/arrow/images/1/1d/Wentworth_Miller.png/revision/latest?cb=20141129190548&path-prefix=es'),
  (30, 'Dominic', 'Purcell', 54, null, 5, 'Lincoln Burrows','https://facts.net/wp-content/uploads/2023/07/34-facts-about-dominic-purcell-1690163477.jpg'),
  (31, 'Sarah', 'Wayne', 47, null, 5, 'Sara Tancredi','https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/261190_v9_bb.jpg');

-- Agregar claves foráneas


ALTER TABLE comentariosseries ADD FOREIGN KEY (serieId) REFERENCES series(id);
ALTER TABLE comentariosseries ADD FOREIGN KEY (userId) REFERENCES users(id);


ALTER TABLE comentariospeliculas ADD FOREIGN KEY (peliculaId) REFERENCES peliculas(id);
ALTER TABLE comentariospeliculas ADD FOREIGN KEY (userId) REFERENCES users(id);


ALTER TABLE favoritos ADD FOREIGN KEY (peliculaId) REFERENCES peliculas(id);
ALTER TABLE favoritos ADD FOREIGN KEY (serieId) REFERENCES series(id);
ALTER TABLE favoritos ADD FOREIGN KEY (userId) REFERENCES users(id);


ALTER TABLE plataformas ADD FOREIGN KEY (peliculaId) REFERENCES peliculas(id);
ALTER TABLE plataformas ADD FOREIGN KEY (serieId) REFERENCES series(id);


ALTER TABLE actor ADD FOREIGN KEY (peliculaId) REFERENCES peliculas(id);
ALTER TABLE actor ADD FOREIGN KEY (serieId) REFERENCES series(id);

ALTER TABLE users ADD CONSTRAINT FK_favoritoId FOREIGN KEY (favoritoId) REFERENCES favoritos(id);
ALTER TABLE users ADD CONSTRAINT FK_comentariopeliculaId FOREIGN KEY (comentariopeliculaId) REFERENCES comentariospeliculas(id);
ALTER TABLE users ADD CONSTRAINT FK_comentarioserieId FOREIGN KEY (comentarioserieId) REFERENCES comentariosseries(id);

-- Claves foráneas para la tabla 'peliculas'

ALTER TABLE peliculas ADD CONSTRAINT FK_plataformaId FOREIGN KEY (plataformaId) REFERENCES plataformas(id);
ALTER TABLE peliculas ADD CONSTRAINT FK_actorId_peliculas FOREIGN KEY (actorId) REFERENCES actor(id);
ALTER TABLE peliculas ADD CONSTRAINT FK_comentarioId_peliculas FOREIGN KEY (comentarioId) REFERENCES comentariospeliculas(id);




-- Claves foráneas para la tabla 'series'

ALTER TABLE series ADD CONSTRAINT FK_plataformaId_series FOREIGN KEY (plataformaId) REFERENCES plataformas(id);
ALTER TABLE series ADD CONSTRAINT FK_actorId_series FOREIGN KEY (actorId) REFERENCES actor(id);
ALTER TABLE series ADD CONSTRAINT FK_comentarioId_series FOREIGN KEY (comentarioId) REFERENCES comentariosseries(id);

