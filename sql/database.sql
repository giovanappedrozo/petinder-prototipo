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

CREATE TABLE IF NOT EXISTS `petinder`.`ADMIN` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `qt_animais` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` CHAR(10) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

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

INSERT INTO MENSAGEM VALUES ('Bom dia!', 1, 1);

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
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 1)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 2)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 3)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 4)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 5)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 6)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 7)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 8)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 9)
INSERT INTO tb_imgAnimal  values ('', 'C:\Users\Public\Pictures\Sample Pictures', 10)

CREATE TABLE IF NOT EXISTS `petinder`.`RACA` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `petinder`.`ESPECIE` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL
  `ANIMAL_cod` INT NOT NULL,
  `RACA_cod` INT NOT NULL,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
