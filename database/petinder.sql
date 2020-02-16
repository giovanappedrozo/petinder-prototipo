DROP DATABASE IF EXISTS `petinder`;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE DATABASE IF NOT EXISTS `petinder` DEFAULT CHARACTER SET utf8 ;
USE `petinder`;

CREATE TABLE IF NOT EXISTS `petinder`.`USUARIO` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` CHAR(10) NOT NULL,
  `animais` BOOLEAN NOT NULL,
  `moradia` ENUM('casa', 'apartamento') NOT NULL,
  `info_adic` VARCHAR(255) NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

INSERT INTO USUARIO values
(null, 'Clovis', 'clovis@gmail.com', 'cloviss002', 0, 'apartamento', 'procurando cachorro de porte pequeno'),
(null,'Marcia', 'marcia88maria@gmail.com', 'alo22hahad', 1, 'apartamento', 'procurando cachorro de porte medio'),
(null,'Bruna','brunahsp@hotmail.com', 'rubs55cast', 0, 'casa', 'procurando gato carinhoso'),
(null,'Eduardo', 'eduardopickius@gmail.com', '5847296146', 1, 'apartamento', 'procurando cachorro pug'),
(null,'Carolinna', 'carolzanatta77@yahoo.com', 'beldincaro', 0, 'casa', 'animal porte pequeno'),
(null,'Luciana', 'lucianaandonini@hotmail.com', 'luluniniha', 1, 'casa', 'só quero um gato'),
(null,'Mariana', 'tyethomaz@gmail.com', 'theytheyma',0, 'apartamento', 'procurando gato raça persa'),
(null,'Guilherme','gui9007@outlook.com', 'guiAraujo9', 0, 'apartamento', 'cachorro de porte pequeno de preferência'),
(null,'André','andre.b.feistauer@gmail.com', 'barrosfeei', 0,'apartamento', ' cachorro de porte grande'),
(null,'Larissa', 'larissaambonatti@hotmail.com', 'bonattilal', 1,'casa', 'oi, quero gatos');

CREATE TABLE IF NOT EXISTS `petinder`.`ADMIN` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` CHAR(10) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

INSERT INTO ADMIN VALUES
(null, 2, 'Lucas', 'lucas303@gmail.com', '0101010101'),
(null, 0, 'Fábio', 'ffbio@gmail.com', '0705030200'),
(null, 1, 'Gabriela', 'gabiiii@gmail.com', '1654851548'),
(null, 0, 'Saulo', 'saulosaulo@gmail.com', '4518465355'),
(null, 2, 'Pedro', 'pedrinho01@gmail.com', 'guyhsf6158'),
(null, 1, 'Vanessa', 'vansan@gmail.com', '48545jnfbs'),
(null, 1, 'Rodrigo', 'roddiaz@gmail.com', 'jnfaiufh33'),
(null, 3, 'Thamires', 'thata@gmail.com', '595715jgff'),
(null, 0, 'Carla', 'carlinha00@gmail.com', '615484hj00'),
(null, 0, 'Giovana', 'giovanaaa@gmail.com', 'uyahcu2058');

CREATE TABLE IF NOT EXISTS `petinder`.`MENSAGEM` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `texto` VARCHAR(255) NOT NULL,
  `USUARIO_cod` INT NOT NULL,
  `ADMIN_cod` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_MENSAGEM_USUARIO_idx` (`USUARIO_cod` ASC),
  INDEX `fk_MENSAGEM_ADMIN1_idx` (`ADMIN_cod` ASC),
  CONSTRAINT `fk_MENSAGEM_USUARIO`
    FOREIGN KEY (`USUARIO_cod`)
    REFERENCES `petinder`.`USUARIO` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENSAGEM_ADMIN1`
    FOREIGN KEY (`ADMIN_cod`)
    REFERENCES `petinder`.`ADMIN` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO MENSAGEM VALUES
(null, '2003-05-24 12:30:59', 'hvjtghjbktfkyuhjbvgf', 1, 4),
(null, '2003-05-24 12:30:59', 'jbuhjliandbyukkhdus', 3, 1),
(null, '2003-05-24 12:30:59', 'jshb fjdgbduy', 7, 2),
(null, '2003-05-24 12:30:59', 'mikjniuhii', 9, 1),
(null, '2003-05-24 12:30:59', 'psofnhefnjaiufheby n', 4, 7),
(null, '2003-05-24 12:30:59', 'knsxuvyh jhbfkys', 3, 9),
(null, '2003-05-24 12:30:59', 'oawijdaiuwh898r5893', 10, 3),
(null, '2003-05-24 12:30:59', 'dijvgrdiuf', 9, 2),
(null, '2003-05-24 12:30:59', 'apojdiujwiudhqiwu', 1, 10),
(null, '2003-05-24 12:30:59', 'ijvksxnfvjkbn iuihnugh jhuy', 5, 2);
 
CREATE TABLE IF NOT EXISTS `petinder`.`ESPECIE` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

INSERT INTO ESPECIE  values
(null, 'Gato'),
(null, 'Cachorro');

CREATE TABLE IF NOT EXISTS `petinder`.`RACA` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `ESPECIE_cod` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_RACA_ESPECIE1_idx` (`ESPECIE_cod` ASC),
  CONSTRAINT `fk_RACA_ESPECIE1`
    FOREIGN KEY (`ESPECIE_cod`)
    REFERENCES `petinder`.`ESPECIE` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO RACA values
(null, 'Sem Raça Definida', 2),
(null, 'Akita', 2),
(null, 'american staffordshire terrier', 2),
(null, 'Basset hound', 2),
(null, 'Beagle', 2),
(null, 'Bichon Frisé', 2),
(null, 'Border Collie', 2),
(null, 'Boston Terrier', 2),
(null, 'Boxer', 2),
(null, 'Buldogue Francês', 2),
(null, 'Buldogue Inglês', 2),
(null, 'Bull Terrier', 2),
(null, 'Cane Corso', 2),
(null, 'Cavalier Charles Spaniel', 2),
(null, 'Chihuahua', 2),
(null, 'Chow Chow', 2),
(null, 'Cocker Spaniel Inglês', 2),
(null, 'Dachshund', 2),
(null, 'Dálmata', 2),
(null, 'Doberman', 2),
(null, 'Dogo Argentino', 2),
(null, 'Dogue Alemão', 2),
(null, 'Fila Brasileiro', 2),
(null, 'Golden Retriever', 2),
(null, 'Husky Siberiano', 2),
(null, 'Jack Russel Terrier', 2),
(null, 'Labrador Retriever', 2),
(null, 'Lhasa Apso', 2),
(null, 'Lulu da Pomerânia', 2),
(null, 'Maltês', 2),
(null, 'Mastiff Inglês', 2),
(null, 'Mastim Tiberiano', 2),
(null, 'Pastor Alemão', 2),
(null, 'Pastor Australiano', 2),
(null, 'Pastor de Shetland', 2),
(null, 'Pequinês ', 2),
(null, 'Pinscher Miniatura', 2),
(null, 'Poodle', 2),
(null, 'Pug', 2),
(null, 'Rottweiler', 2),
(null, 'Schnauzer', 2),
(null, 'Shar-pei', 2),
(null, 'Shiba', 2),
(null, 'Shih Tzu', 2),
(null, 'Staffordshire Bull Terrier', 2),
(null, 'Weimaraner', 2),
(null, 'Whippet', 2),
(null, 'Yorkshire Terrier', 2),
(null, 'Savannah', 2),
(null, 'Sem Raça Definida', 1),
(null, 'oriental shorthair', 1),
(null, 'oriental longhai', 1),
(null, 'somali', 1),
(null, 'urkish Van', 1),
(null, 'Chausie', 1),
(null, 'Birmanês', 1),
(null, 'Chartreux', 1),
(null, 'Sagrado da Birmânia', 1),
(null, 'Sokoke', 1),
(null, 'Nebelung', 1),
(null, 'Selkirk Rex', 1),
(null, 'Cornish Rex', 1),
(null, 'Ocicat', 1),
(null, 'Peterbald', 1),
(null, 'Devon Rex', 1),
(null, 'Korat', 1),
(null, 'Selvagem', 1),
(null, 'Exótico de Pelo Curto', 1),
(null, 'Azul Russo', 1),
(null, 'Scottish Fold', 1),
(null, 'Snowshoe', 1),
(null, 'Manx', 1),
(null, 'Angorá Turco', 1),
(null, 'Bombaim', 1),
(null, 'Norueguês da Floresta', 1),
(null, 'Siberiano', 1),
(null, 'Bengal', 1),
(null, 'Siamês', 1),
(null, 'Ashera', 1),
(null, 'Maine Coon', 1),
(null, 'Lykoi ou Gato Lobo', 1);

CREATE TABLE IF NOT EXISTS `petinder`.`ANIMAL` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `tamanho` ENUM('medio', 'pequeno', 'grande') NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  `idade` TINYINT(2) NOT NULL,
  `info_adic` VARCHAR(255) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ADMIN_cod` INT NOT NULL,
  `RACA_cod` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_ANIMAL_ADMIN1_idx` (`ADMIN_cod` ASC),
  INDEX `fk_ANIMAL_RACA1_idx` (`RACA_cod` ASC),
  CONSTRAINT `fk_ANIMAL_ADMIN1`
    FOREIGN KEY (`ADMIN_cod`)
    REFERENCES `petinder`.`ADMIN` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANIMAL_RACA1`
    FOREIGN KEY (`RACA_cod`)
    REFERENCES `petinder`.`RACA` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO ANIMAL  values
(null, 'medio' , 'F' , 2, 'Animal abandonado ao lado de um rio', 'Zury', 1, 1), 
(null, 'pequeno' , 'F' , 13, 'Antiga cadela com fins de procriação', 'Lulu', 2, 2),
(null, 'grande' , 'M' , 8, 'Cachorro adestrado e carinhoso', 'Donnie', 3, 2),
(null, 'pequeno' , 'F' , 6, 'Gata arrisca', 'Safira', 4, 1),
(null, 'medio' , 'M' , 7, 'Gato castrado e amoroso', 'Saulo', 5, 1),
(null, 'grande' , 'M' , 9, 'Cachorro decorrente do cruzamento de 2 espécies muito caras', 'Dondoca', 6, 2),
(null, 'grande' , 'F' , 15, 'Cadela idosa que foi abandonada no meio de uma rodovia', 'Neide', 7, 2),
(null, 'pequeno' , 'F' , 16, 'Gata idosa que precisa de uma vida calma e tem muito amor para dar', 'Fluflu', 8, 1),
(null, 'grande' , 'F' , 3, 'Gata castrada e energetica', 'Guta', 9, 1),
(null, 'pequeno' , 'M' , 4, 'Cachorro filhote que aprende rápido e é muito atencioso', 'Scooby', 10, 2);


CREATE TABLE IF NOT EXISTS `petinder`.`IMG_ANIMAL` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  `ANIMAL_cod` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_IMG_ANIMAL_ANIMAL1_idx` (`ANIMAL_cod` ASC),
  CONSTRAINT `fk_IMG_ANIMAL_ANIMAL1`
    FOREIGN KEY (`ANIMAL_cod`)
    REFERENCES `petinder`.`ANIMAL` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO IMG_ANIMAL  values 
(null, 'C:\Users\Public\Pictures\Sample Pictures', 1),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 2),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 3),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 4),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 5),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 6),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 7),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 8),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 9),
(null, 'C:\Users\Public\Pictures\Sample Pictures', 10);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;