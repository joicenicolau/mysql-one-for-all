DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plano VARCHAR(50) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    usuario_name VARCHAR(100) NOT NULL,
    usuario_age INT NOT NULL,
    data_inscricao DATETIME NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY(plano_id) REFERENCES planos(plano_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artista_name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cancao_name VARCHAR(50) NOT NULL,
    cancao_length INT NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns(album_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao(
    cancao_id INT NOT NULL,
    usuario_id INT NOT NULL,
    date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
    FOREIGN KEY(cancao_id) REFERENCES cancoes(cancao_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano, preco)
VALUES
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar',  7.99);

INSERT INTO SpotifyClone.usuarios (usuario_name, usuario_age, plano_id, data_inscricao)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler', 46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 2, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander', 85, 3, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO SpotifyClone.artistas (artista_name, artista_id)
VALUES
  ('Beyoncé', 1),
  ('Queen', 2),
  ('Elis Regina', 3),
  ('Baco Exu do Blues', 4),
  ('Blind Guardian', 5),
  ('Nina Simone', 6);

INSERT INTO SpotifyClone.albuns (album_id, album_name, artista_id, ano_lancamento)
VALUES
  (1, 'Renaissance', 1, '2022'),
  (2, 'Jazz', 2, 1978),
  (3, 'Hot Space', 2, 1982),
  (4, 'Falso Brilhante', 3, 1998),
  (5, 'Vento de Maio', 3, 2001),
  (6, 'QVVJFA?', 4, 2003),
  (7, 'Somewhere Far Beyond', 5, 2007),
  (8, 'I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.cancoes (cancao_id, cancao_name, cancao_length, album_id, artista_id)
VALUES
  (1, 'BREAK MY SOUL', 279, 1, 1),
  (2, 'VIRGOS GROOVE', 369, 1, 1),
  (3, 'ALIEN SUPERSTAR', 116, 1, 1),
  (4, 'Dont Stop Me Now', 203, 2, 2),
  (5, 'Under Pressure', 152, 3, 2),
  (6, 'Como Nossos Pais', 105, 4, 3),
  (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
  (8, 'Samba em Paris', 267, 6, 4),
  (9, 'The Bards Song', 244, 7, 5),
  (10, 'Feeling Good', 100, 8, 6);

INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id, date)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
  