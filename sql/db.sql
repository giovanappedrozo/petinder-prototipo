CREATE TABLE USUARIO (
  cod  INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  email VARCHAR(45) NOT NULL,
  senha CHAR NOT NULL,
  animais  BOOL NOT NULL,
  moradia ENUM ('CASA', 'APARTAMENTO') NOT NULL,
  info_adic VARCHAR(255) NULL,
  PRIMARY KEY(cod )
);

INSERT INTO USUARIO (nome, email, senha, animais , moradia, info_adic) VALUES(
('Bianca', 'bianca001@gmail.com', 123456, TRUE, CASA),
('Valter', 'valtervalter@gmail.com', 444455, FALSE, CASA),
('Larissa', 'larissa123@gmail.com', 000123, FALSE, APARTAMENTO);

CREATE TABLE ANIMAL (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tamanho ENUM NULL,
  sexo ENUM NULL,
  idade TINYINT UNSIGNED NULL,
  info_adic VARCHAR(255) NULL,
  nome VARCHAR(20) NULL,
  PRIMARY KEY(cod)
);


CREATE TABLE ADMINISTRADOR (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ANIMAL_cod INTEGER UNSIGNED NOT NULL,
  qt_animais  TINYINT UNSIGNED NULL,
  qt_curtidas TINYINT UNSIGNED NULL,
  nome  VARCHAR(20) NULL,
  email VARCHAR(45) NULL,
  senha  CHAR NULL,
  PRIMARY KEY(cod)
);

CREATE TABLE MENSAGEM (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ADMIN_cod INTEGER UNSIGNED NOT NULL,
  USUARIO_cod  INTEGER UNSIGNED NOT NULL,
  data_hora DATETIME NULL,
  texto VARCHAR(255) NULL,
  PRIMARY KEY(cod),
  INDEX MENSAGEM_FKIndex1(USUARIO_cod ),
  INDEX MENSAGEM_FKIndex2(ADMIN_cod)
);

CREATE TABLE RACA (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(cod)
);

CREATE TABLE ESPECIE (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ANIMAL_cod INTEGER UNSIGNED NOT NULL,
  RACA_cod INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(cod, ANIMAL_cod, RACA_cod),
  INDEX ESPECIE_FKIndex1(ANIMAL_cod),
  INDEX ESPECIE_FKIndex2(RACA_cod)
);

CREATE TABLE IMG_ANIMAL (
  cod INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ANIMAL_cod INTEGER UNSIGNED NOT NULL,
  local_2 VARCHAR(255) NULL,
  PRIMARY KEY(cod)
);
