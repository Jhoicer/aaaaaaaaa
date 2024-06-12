-- MySQL Script generated by MySQL Workbench
-- Sat Jun  8 03:18:08 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_Login
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_Login
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Login` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema paises del mundo y estados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema paises del mundo y estados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `paises del mundo y estados` DEFAULT CHARACTER SET utf8mb4 ;
USE `BD_Login` ;

-- -----------------------------------------------------
-- Table `BD_Login`.`nacionalidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`nacionalidades` (
  `idnacionalidad` INT NOT NULL AUTO_INCREMENT,
  `nacionalidad` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idnacionalidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Login`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`generos` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `generos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paises del mundo y estados`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paises del mundo y estados`.`pais` (
  `idpais` INT(11) NOT NULL AUTO_INCREMENT,
  `paisnombre` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB
AUTO_INCREMENT = 247
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `BD_Login`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`personas` (
  `idperson` INT NOT NULL AUTO_INCREMENT,
  `p-nombre` VARCHAR(150) NOT NULL,
  `s-nombre` VARCHAR(150) NOT NULL,
  `p-apellido` VARCHAR(150) NOT NULL,
  `s-apellido` VARCHAR(150) NOT NULL,
  `genero` INT NOT NULL,
  `fecha_nacimiento` DATETIME NOT NULL,
  `cedula` INT NOT NULL,
  `nacionalidad` INT NOT NULL,
  `pais` INT(11) NOT NULL,
  `direccion_detallada` VARCHAR(250) NOT NULL,
  `descripcion_personal` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idperson`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC) VISIBLE,
  INDEX `fk_personas_nacionalidades_idx` (`nacionalidad` ASC) VISIBLE,
  INDEX `fk_personas_generos1_idx` (`genero` ASC) VISIBLE,
  INDEX `fk_personas_pais1_idx` (`pais` ASC) VISIBLE,
  CONSTRAINT `fk_personas_nacionalidades`
    FOREIGN KEY (`nacionalidad`)
    REFERENCES `BD_Login`.`nacionalidades` (`idnacionalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_generos1`
    FOREIGN KEY (`genero`)
    REFERENCES `BD_Login`.`generos` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_pais1`
    FOREIGN KEY (`pais`)
    REFERENCES `paises del mundo y estados`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Login`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`tipo_usuario` (
  `idtipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `tipo_usuario` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Login`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`users` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `idpersonas` INT NOT NULL,
  `user_name` VARCHAR(90) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `create_at` DATETIME NOT NULL,
  `idtipo_usuario` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_users_personas1_idx` (`idpersonas` ASC) VISIBLE,
  INDEX `fk_users_tipo_usuario1_idx` (`idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_users_personas1`
    FOREIGN KEY (`idpersonas`)
    REFERENCES `BD_Login`.`personas` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_tipo_usuario1`
    FOREIGN KEY (`idtipo_usuario`)
    REFERENCES `BD_Login`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Login`.`redes_sociales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`redes_sociales` (
  `idred_social` INT NOT NULL AUTO_INCREMENT,
  `red_social` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idred_social`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Login`.`redes_sociales_has_personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Login`.`redes_sociales_has_personas` (
  `redes_sociales_has_personas` INT NOT NULL,
  `idpersonas` INT NOT NULL,
  `idred_social` INT NOT NULL,
  `usuario_red_social` VARCHAR(150) NOT NULL,
  INDEX `fk_redes_sociales_has_personas_personas1_idx` (`idpersonas` ASC) VISIBLE,
  INDEX `fk_redes_sociales_has_personas_redes_sociales1_idx` (`idred_social` ASC) VISIBLE,
  PRIMARY KEY (`redes_sociales_has_personas`),
  CONSTRAINT `fk_redes_sociales_has_personas_redes_sociales1`
    FOREIGN KEY (`idred_social`)
    REFERENCES `BD_Login`.`redes_sociales` (`idred_social`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_redes_sociales_has_personas_personas1`
    FOREIGN KEY (`idpersonas`)
    REFERENCES `BD_Login`.`personas` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `paises del mundo y estados` ;

-- -----------------------------------------------------
-- Table `paises del mundo y estados`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paises del mundo y estados`.`estado` (
  `idestado` INT(11) NOT NULL AUTO_INCREMENT,
  `ubicacionpaisid` INT(11) NULL DEFAULT NULL,
  `estadonombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idestado`),
  INDEX `IDX_4786469191104EC2` (`ubicacionpaisid` ASC) VISIBLE,
  CONSTRAINT `ubicacionpaisid`
    FOREIGN KEY (`ubicacionpaisid`)
    REFERENCES `paises del mundo y estados`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2202
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
