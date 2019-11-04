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

INSERT INTO USUARIO values 
('Clovis', 'clovis@gmail.com', 'cloviss0022', 0, 'apartamento', 'procurando cachorro de porte pequeno'),
('Marcia', 'marcia88maria@gmail.com', 'alo22haha', 1, 'apartamento', 'procurando cachorro de porte medio'),
('Bruna','brunahsp@hotmail.com', 'rubs55castroa', 0, 'casa', 'procurando gato carinhoso'),
('Eduardo', 'eduardopickius@gmail.com', '58472961', 2, 'apartamneto', 'procurando cachorro pug'),
('Carolinna', 'carolzanatta77@yahoo.com', 'beldincarol96', 0, 'casa', 'animal porte pequeno'),
('Luciana', 'lucianaandonini@hotmail.com', 'lulunini@ha', 1, 'casa', 'so quero um gato'),
('Mariana', 'tyethomaz@gmail.com', 'theytheymari','gato',2, 'procurando gato raça persa'),
('Guilherme','gui9007@outlook.com', 'guiAraujo963', 0, 'apartamento', 'cachorro de porte pequeno de preferência'),
('André','andre.b.feistauer@gmail.com', 'barrosfeeis', 3,'apartamento', ' cachorro de porte grande'),
('Larissa', 'larissaambonatti@hotmail.com', 'bonattilala', 1,'casa', 'oi, quero gatos');

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
(0, 'Giovana', 'giovanaaa@gmail.com', 'uyahcu2058');

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
(DATETIME, 'hvjtghjbktfkyuhjbvgf', 1, 4),
(DATETIME, 'jbuhjliandbyukkhdus', 3, 1),
(DATETIME, 'jshb fjdgbduy', 7, 2),
(DATETIME, 'mikjniuhii', 9, 1),
(DATETIME, 'psofnhefnjaiufheby n', 4, 7),
(DATETIME, 'knsxuvyh jhbfkys', 3, 9),
(DATETIME, 'oawijdaiuwh898r5893', 10, 3),
(DATETIME, 'dijvgrdiuf', 9, 2),
(DATETIME, 'apojdiujwiudhqiwu', 1, 10),
(DATETIME, 'ijvksxnfvjkbn iuihnugh jhuy', 5, 2);

CREATE TABLE IF NOT EXISTS `petinder`.`ANIMAL` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `tamanho` ENUM('medio', 'pequeno', 'grande') NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  `idade` TINYINT(2) NOT NULL,
  `info_adic` VARCHAR(255) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ADMIN_cod` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_ANIMAL_ADMIN1_idx` (`ADMIN_cod` ASC),
  CONSTRAINT `fk_ANIMAL_ADMIN1`
    FOREIGN KEY (`ADMIN_cod`)
    REFERENCES `petinder`.`ADMIN` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO ANIMAL  values
('medio' , 'F' , '02', 'Animal abandonado ao lado de um rio', 'Zury', '1'), 
('pequeno' , 'F' , '13', 'Antiga cadela com fins de procriação', 'Lulu', '2'),
('grande' , 'M' , '08', 'Cachorro adestrado e carinhoso', 'Donnie', '3'),
('pequeno' , 'F' , '06', 'Gata arrisca', 'Safira', '4'),
('medio' , 'M' , '07', 'Gato castrado e amoroso', 'Saulo', '5'),
('grande' , 'M' , '09', 'Cachorro decorrente do cruzamento de 2 espécies muito caras', 'Dondoca', '6'),
('grande' , 'F' , '15', 'Cadela idosa que foi abandonada no meio de uma rodovia', 'Neide', '7'),
('pequeno' , 'F' , '16', 'Gata idosa que precisa de uma vida calma e tem muito amor para dar', 'Fluflu', '8'),
('grande' , 'F' , '03', 'Gata castrada e energetica', 'Guta', '9'),
('pequeno' , 'M' , '04', 'Cachorro filhote que aprende rápido e é muito atencioso', 'Scooby', '10');

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

INSERT INTO tb_imgAnimal  values 
('C:\Users\Public\Pictures\Sample Pictures', 1),
('C:\Users\Public\Pictures\Sample Pictures', 2),
('C:\Users\Public\Pictures\Sample Pictures', 3),
('C:\Users\Public\Pictures\Sample Pictures', 4),
('C:\Users\Public\Pictures\Sample Pictures', 5),
('C:\Users\Public\Pictures\Sample Pictures', 6),
('C:\Users\Public\Pictures\Sample Pictures', 7),
('C:\Users\Public\Pictures\Sample Pictures', 8),
('C:\Users\Public\Pictures\Sample Pictures', 9),
('C:\Users\Public\Pictures\Sample Pictures', 10);

CREATE TABLE IF NOT EXISTS `petinder`.`RACA` (
  `cod` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

INSERT INTO RACA values
('Sem Raça Definida'),
('Akita'),
('american staffordshire terrier'),
('Basset hound'),
('Beagle'),
('Bichon Frisé'),
('Border Collie'),
('Boston Terrier'),
('Boxer'),
('Buldogue Francês'),
('Buldogue Inglês'),
('Bull Terrier'),
('Cane Corso'),
('Cavalier Charles Spaniel'),
('Chihuahua'),
('Chow Chow'),
('Cocker Spaniel Inglês'),
('Dachshund'),
('Dálmata'),
('Doberman'),
('Dogo Argentino'),
('Dogue Alemão'),
('Fila Brasileiro'),
('Golden Retriever'),
('Husky Siberiano'),
('Jack Russel Terrier'),
('Labrador Retriever'),
('Lhasa Apso'),
('Lulu da Pomerânia'),
('Maltês'),
('Mastiff Inglês'),
('Mastim Tiberiano'),
('Pastor Alemão'),
('Pastor Australiano'),
('Pastor de Shetland'),
('Pequinês '),
('Pinscher Miniatura'),
('Poodle'),
('Pug'),
('Rottweiler'),
('Schnauzer'),
('Shar-pei'),
('Shiba'),
('Shih Tzu'),
('Staffordshire Bull Terrier'),
('Weimaraner'),
('Whippet'),
('Yorkshire Terrier'),
('Savannah'),
('Sem Raça Definida'),
('oriental shorthair'),
('oriental longhai'),
('somali'),
('urkish Van'),
('Chausie'),
('Birmanês'),
('Chartreux'),
('Sagrado da Birmânia'),
('Sokoke'),
('Nebelung'),
('Selkirk Rex'),
('Cornish Rex'),
('Ocicat'),
('Peterbald'),
('Devon Rex'),
('Korat'),
('Selvagem'),
('Exótico de Pelo Curto'),
('Azul Russo'),
('Scottish Fold'),
('Snowshoe'),
('Manx'),
('Angorá Turco'),
('Bombaim'),
('Norueguês da Floresta'),
('Siberiano'),
('Bengal'),
('Siamês'),
('Ashera'),
('Maine Coon'),
('Lykoi ou Gato Lobo');

CREATE TABLE IF NOT EXISTS `petinder`.`ESPECIE` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `ANIMAL_cod` INT NOT NULL,
  `RACA_cod` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_ESPECIE_ANIMAL1_idx` (`ANIMAL_cod` ASC),
  INDEX `fk_ESPECIE_RACA1_idx` (`RACA_cod` ASC),
  CONSTRAINT `fk_ESPECIE_ANIMAL1`
    FOREIGN KEY (`ANIMAL_cod`)
    REFERENCES `petinder`.`ANIMAL` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESPECIE_RACA1`
    FOREIGN KEY (`RACA_cod`)
    REFERENCES `petinder`.`RACA` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO ESPECIE  values
(1, 1, 'Gato'),
(2, 'Cachorro');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
