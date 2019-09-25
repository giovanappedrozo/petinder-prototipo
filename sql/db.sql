SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE IF NOT EXISTS `petinder` DEFAULT CHARACTER SET utf8 ;
USE `petinder` ;

CREATE TABLE IF NOT EXISTS `petinder`.`USUARIO` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` CHAR(10) NOT NULL,
  `animais` TINYINT NOT NULL,
  `moradia` ENUM('casa', 'apartamento') NOT NULL,
  `info_adic` VARCHAR(255) NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

         INSERT INTO USUARIO values ('Clovis', 'clovis@gmail.com', 'cloviss0022', 'cachorro', 'apartamento', 'procurando cachorro de porte pequeno')
         INSERT INTO USUARIO values ('Marcia', 'marcia88maria@gmail.com', 'alo22haha', 'cachorro', 'apartamento', 'procurando cachorro de porte medio')
         INSERT INTO USUARIO values ('Bruna','brunahsp@hotmail.com', 'rubs55castroa', 'gato', 'casa', 'procurando gato carinhoso')
         INSERT INTO USUARIO values ('Eduardo', 'eduardopickius@gmail.com', '58472961', 'cachorro', 'apartamneto', 'procurando cachorro pug')
         INSERT INTO USUARIO values ('Carolinna', 'carolzanatta77@yahoo.com', 'beldincarol96', 'cachorro', 'casa', 'animal porte pequeno')
         INSERT INTO USUARIO values ('Luciana', 'lucianaandonini@hotmail.com', 'lulunini@ha', 'gato', 'casa', 'so quero um gato')
         INSERT INTO USUARIO values ('Mariana', 'tyethomaz@gmail.com', 'theytheymari','gato','casa', 'procurando gato raça persa')
         INSERT INTO USUARIO values ('Guilherme','gui9007@outlook.com', 'guiAraujo963', 'cachorro', 'apartamento', 'cachorro de porte pequeno de preferência')
         INSERT INTO USUARIO values ('André','andre.b.feistauer@gmail.com', 'barrosfeeis', 'cachorro','apartamento', ' cachorro de porte grande')
         INSERT INTO USUARIO values ('Larissa', 'larissaambonatti@hotmail.com', 'bonattilala', 'gato','casa', 'oi, quero gatos')


CREATE TABLE IF NOT EXISTS `petinder`.`ADMIN` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `qt_animais` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` CHAR(10) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;
INSERT INTO ADMIN VALUES 
(2, 'Lucas', 'lucas303@gmail.com', '0101010101'),
(0, 'Fábio', 'ffbio@gmail.com', '0705030200'),
(1, 'Gabriela', 'gabiiii@gmail.com', '1654851548'),
(0, 'Saulo', 'saulosaulo@gmail.com', '4518465355'),
(2, 'Pedro', 'pedrinho01@gmail.com', 'guyhsf6158'),
(1, 'Vanessa', 'vansan@gmail.com', '48545jnfbs'),
(1, 'Rodrigo', 'roddiaz@gmail.com', 'jnfaiufh33'),
(3, 'Thamires', 'thata@gmail.com', '595715jgff'),
(0, 'Carla', 'carlinha00@gmail.com', '615484hj00'),
(0, 'Giovana', 'giovanaaa@gmail.com', 'uyahcu2058'),

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
(DATETIME, 'hvjtghjbktfkyuhjbvgf', 1, 4)
(DATETIME, 'jbuhjliandbyukkhdus', 3, 1)
(DATETIME, 'jshb fjdgbduy', 7, 2)
(DATETIME, 'mikjniuhii', 9, 1)
(DATETIME, 'psofnhefnjaiufheby n', 4, 7)
(DATETIME, 'knsxuvyh jhbfkys', 3, 9)
(DATETIME, 'oawijdaiuwh898r5893', 10, 3)
(DATETIME, 'dijvgrdiuf', 9, 2)
(DATETIME, 'apojdiujwiudhqiwu', 1, 10)
(DATETIME, 'ijvksxnfvjkbn iuihnugh jhuy', 5, 2)

CREATE TABLE IF NOT EXISTS `petinder`.`ESPECIE` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

INSERT INTO ESPECIE  values('Gato', '1', 'Felina ')
INSERT INTO ESPECIE  values('Cachorro', '2', 'Canina ')


CREATE TABLE IF NOT EXISTS `petinder`.`RACA` (
  `cod` INT NOT NULL,
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
INSERT INTO RACA values('Sem Raça Definida',2),
 INSERT INTO RACA values('Akita',2),
 INSERT INTO RACA values('american staffordshire terrier',2),
 INSERT INTO RACA values('Basset hound',2),
 INSERT INTO RACA values('Beagle',2),
 INSERT INTO RACA values('Bichon Frisé',2),
 INSERT INTO RACA values('Border Collie',2),
 INSERT INTO RACA values('Boston Terrier',2),
 INSERT INTO RACA values('Boxer',2),
 INSERT INTO RACA values('Buldogue Francês',2),
 INSERT INTO RACA values('Buldogue Inglês',2),
 INSERT INTO RACA values('Bull Terrier',2),
 INSERT INTO RACA values('Cane Corso',2),
 INSERT INTO RACA values('Cavalier Charles Spaniel',2),
 INSERT INTO RACA values('Chihuahua',2),
 INSERT INTO RACA values('Chow Chow',2),
 INSERT INTO RACA values('Cocker Spaniel Inglês',2),
 INSERT INTO RACA values('Dachshund',2),
 INSERT INTO RACA values('Dálmata',2),
 INSERT INTO RACA values('Doberman',2),
 INSERT INTO RACA values('Dogo Argentino',2),
 INSERT INTO RACA values('Dogue Alemão',2),
 INSERT INTO RACA values('Fila Brasileiro',2),
 INSERT INTO RACA values('Golden Retriever',2),
 INSERT INTO RACA values('Husky Siberiano',2),
 INSERT INTO RACA values('Jack Russel Terrier',2),
 INSERT INTO RACA values('Labrador Retriever',2),
 INSERT INTO RACA values('Lhasa Apso',2),
 INSERT INTO RACA values('Lulu da Pomerânia',2),
 INSERT INTO RACA values('Maltês',2),
 INSERT INTO RACA values('Mastiff Inglês',2),
 INSERT INTO RACA values('Mastim Tiberiano',2),
 INSERT INTO RACA values('Pastor Alemão',2),
 INSERT INTO RACA values('',1),
 INSERT INTO RACA values('',1),
 INSERT INTO RACA values('',1),
 INSERT INTO RACA values(' Pastor Australiano',2),
INSERT INTO RACA values('Pastor de Shetland',2),
INSERT INTO RACA values('Pequinês ',2),
INSERT INTO RACA values('Pinscher Miniatura',2),
INSERT INTO RACA values('Poodle',2),
INSERT INTO RACA values(' Pug ',2),
INSERT INTO RACA values(' Rottweiler ',2),
INSERT INTO RACA values(' Schnauzer ',2),
INSERT INTO RACA values(' Shar-pei ',2),
INSERT INTO RACA values(' Shiba ',2),
INSERT INTO RACA values(' Shih Tzu ',2),
INSERT INTO RACA values(' Staffordshire Bull Terrier ',2),
INSERT INTO RACA values(' Weimaraner ',2),
INSERT INTO RACA values(' Whippet ',2),
INSERT INTO RACA values(' Yorkshire Terrier ',2)
INSERT INTO RACA values(' Savannah ',1),
INSERT INTO RACA values(' Sem Raça Definida ',1),
INSERT INTO RACA values('oriental shorthair',1),
INSERT INTO RACA values('oriental longhai',1),
INSERT INTO RACA values('somali',1),
INSERT INTO RACA values('urkish Van',1),
INSERT INTO RACA values('Chausie',1),
INSERT INTO RACA values('Birmanês',1),
INSERT INTO RACA values('Chartreux',1),
INSERT INTO RACA values('Sagrado da Birmânia',1),
INSERT INTO RACA values('Sokoke',1),
INSERT INTO RACA values('Nebelung',1),
INSERT INTO RACA values('Selkirk Rex',1),
INSERT INTO RACA values('Cornish Rex',1),
INSERT INTO RACA values('Ocicat',1),
INSERT INTO RACA values('Peterbald<',1),
INSERT INTO RACA values('Devon Rex',1),
INSERT INTO RACA values('Korat',1),
INSERT INTO RACA values('Selvagem',1),
INSERT INTO RACA values('Exótico de Pelo Curto',1),
INSERT INTO RACA values('Azul Russo',1),
INSERT INTO RACA values('Scottish Fold',1),
INSERT INTO RACA values('Snowshoe',1),
INSERT INTO RACA values('Manx',1),
INSERT INTO RACA values('Angorá Turco',1),
INSERT INTO RACA values('Bombaim',1),
INSERT INTO RACA values('Norueguês da Floresta',1),
INSERT INTO RACA values('Siberiano',1),
INSERT INTO RACA values('Bengal',1),
INSERT INTO RACA values('Siamês',1),
INSERT INTO RACA values('Ashera',1),
INSERT INTO RACA values('Maine Coon',1),
INSERT INTO RACA values('Lykoi ou Gato Lobo',1),
INSERT INTO RACA values('',1),



 

CREATE TABLE IF NOT EXISTS `petinder`.`ANIMAL` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `tamanho` ENUM('medio', 'pequeno', 'grande') NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  `idade` TINYINT(2) NOT NULL,
  `info_adic` VARCHAR(255) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ADMIN_cod` INT NOT NULL,
  `ESPECIE_cod` INT NOT NULL,
  PRIMARY KEY (`cod`, `ESPECIE_cod`),
  INDEX `fk_ANIMAL_ADMIN1_idx` (`ADMIN_cod` ASC),
  INDEX `fk_ANIMAL_ESPECIE1_idx` (`ESPECIE_cod` ASC),
  CONSTRAINT `fk_ANIMAL_ADMIN1`
    FOREIGN KEY (`ADMIN_cod`)
    REFERENCES `petinder`.`ADMIN` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANIMAL_ESPECIE1`
    FOREIGN KEY (`ESPECIE_cod`)
    REFERENCES `petinder`.`ESPECIE` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    CONSTRAINT `fk_ANIMAL_RACA1`
    FOREIGN KEY (`RACA_cod`)
    REFERENCES `petinder`.`RACA` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO ANIMAL  values('medio' , 'F' , '02', 'Animal abandonado ao lado de um rio', 'Zury', '1','01') 
INSERT INTO ANIMAL  values('pequeno' , 'F' , '13', 'Antiga cadela com fins de procriação', 'Lulu', '2', '02') 
INSERT INTO ANIMAL  values('grande' , 'M' , '08', 'Cachorro adestrado e carinhoso', 'Donnie', '3', '02') 
INSERT INTO ANIMAL  values('pequeno' , 'F' , '06', 'Gata arrisca', 'Safira', '4','01') 
INSERT INTO ANIMAL  values('medio' , 'M' , '07', 'Gato castrado e amoroso', 'Saulo', '5', '01') 
INSERT INTO ANIMAL  values('grande' , 'M' , '09', 'Cachorro decorrente do cruzamento de 2 espécies muito caras', 'Dondoca', '6', '02') 
INSERT INTO ANIMAL  values('grande' , 'F' , '15', 'Cadela idosa que foi abandonada no meio de uma rodovia', 'Neide', '7','02') 
INSERT INTO ANIMAL  values('pequeno' , 'F' , '16', 'Gata idosa que precisa de uma vida calma e tem muito amor para dar', 'Fluflu', '8', '01') 
INSERT INTO ANIMAL  values('grande' , 'F' , '03', 'Gata castrada e energetica', 'Guta', '9', '01') 
INSERT INTO ANIMAL  values('pequeno' , 'M' , '04', 'Cachorro filhote que aprende rápido e é muito atencioso', 'Scooby', '10', '02') 


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

INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 1)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 2)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 3)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 4)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 5)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 6)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 7)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 8)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 9)
INSERT INTO tb_imgAnimal  values ('C:\Users\Public\Pictures\Sample Pictures', 10)

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
