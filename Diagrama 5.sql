-- MySQL Script generated by MySQL Workbench
-- Tue Feb 27 20:34:23 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Actividad_BD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Actividad_BD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Actividad_BD` DEFAULT CHARACTER SET utf8 ;
USE `Actividad_BD` ;

-- -----------------------------------------------------
-- Table `Actividad_BD`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`EMPLEADO` (
  `Code_emp` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(15) NULL,
  PRIMARY KEY (`Code_emp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`DEPARTAMENTO` (
  `Nombre` VARCHAR(30) NOT NULL,
  `Presupuesto` INT NULL,
  `Num_empleado` INT NULL,
  `EMPLEADO_Num_emp` INT NOT NULL,
  PRIMARY KEY (`Nombre`),
  INDEX `fk_DEPARTAMENTO_EMPLEADO_idx` (`EMPLEADO_Num_emp` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTO_EMPLEADO`
    FOREIGN KEY (`EMPLEADO_Num_emp`)
    REFERENCES `Actividad_BD`.`EMPLEADO` (`Num_emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`EMPLEADO` (
  `Code_emp` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(15) NULL,
  PRIMARY KEY (`Code_emp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`VEHICULO` (
  `Matricula` VARCHAR(10) NOT NULL,
  `Modelo` INT NULL,
  `Fecha_inicio` DATE NULL,
  `EMPLEADO_Code_emp` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Matricula`, `EMPLEADO_Code_emp`),
  INDEX `fk_VEHICULO_EMPLEADO1_idx` (`EMPLEADO_Code_emp` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICULO_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_Code_emp`)
    REFERENCES `Actividad_BD`.`EMPLEADO` (`Code_emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`EDICION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`EDICION` (
  `Numero` INT NOT NULL,
  `Año` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`AUTOR` (
  `Titulp_prin` INT NOT NULL,
  `Subtitulo` VARCHAR(45) NULL,
  PRIMARY KEY (`Titulp_prin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`LIBRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`LIBRO` (
  `ISBN` INT NOT NULL,
  `Editorial` VARCHAR(45) NULL,
  `Autor` VARCHAR(45) NULL,
  `Idioma` VARCHAR(45) NULL,
  `EDICION_Numero` INT NOT NULL,
  `AUTOR_Titulp_prin` INT NOT NULL,
  PRIMARY KEY (`ISBN`, `EDICION_Numero`, `AUTOR_Titulp_prin`),
  INDEX `fk_LIBRO_EDICION1_idx` (`EDICION_Numero` ASC) VISIBLE,
  INDEX `fk_LIBRO_AUTOR1_idx` (`AUTOR_Titulp_prin` ASC) VISIBLE,
  CONSTRAINT `fk_LIBRO_EDICION1`
    FOREIGN KEY (`EDICION_Numero`)
    REFERENCES `Actividad_BD`.`EDICION` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LIBRO_AUTOR1`
    FOREIGN KEY (`AUTOR_Titulp_prin`)
    REFERENCES `Actividad_BD`.`AUTOR` (`Titulp_prin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`PACIENTE` (
  `Nombre` INT NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`CITA` (
  `hora` INT NOT NULL,
  `fecha` DATE NULL,
  `PACIENTE_codpad` INT NOT NULL,
  `codpad` INT NULL,
  `codmed` VARCHAR(45) NULL,
  `PACIENTE_Nombre` INT NOT NULL,
  PRIMARY KEY (`hora`),
  INDEX `fk_CITA_PACIENTE1_idx` (`PACIENTE_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_CITA_PACIENTE1`
    FOREIGN KEY (`PACIENTE_Nombre`)
    REFERENCES `Actividad_BD`.`PACIENTE` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`MEDICO` (
  `Nombre` VARCHAR(45) NULL,
  `CITA_hora` INT NOT NULL,
  INDEX `fk_MEDICO_CITA1_idx` (`CITA_hora` ASC) VISIBLE,
  CONSTRAINT `fk_MEDICO_CITA1`
    FOREIGN KEY (`CITA_hora`)
    REFERENCES `Actividad_BD`.`CITA` (`hora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`DE AUTOMÓVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`DE AUTOMÓVIL` (
  `Matricula` INT NOT NULL,
  PRIMARY KEY (`Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`Beneficiario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`Beneficiario` (
  `DNI` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_nacim` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`DE VIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`DE VIDA` (
  `numero` INT NOT NULL,
  `Beneficiario_DNI` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_DE VIDA_Beneficiario1_idx` (`Beneficiario_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_DE VIDA_Beneficiario1`
    FOREIGN KEY (`Beneficiario_DNI`)
    REFERENCES `Actividad_BD`.`Beneficiario` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`DE VIVIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`DE VIVIENDA` (
  `Domicilio` INT NOT NULL,
  PRIMARY KEY (`Domicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad_BD`.`POLIZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad_BD`.`POLIZA` (
  `Fecha_ini` DATE NOT NULL,
  `Fecha_fin` DATE NULL,
  `DE AUTOMÓVIL_Matricula` INT NOT NULL,
  `DE VIDA_numero` INT NOT NULL,
  `DE VIVIENDA_Domicilio` INT NOT NULL,
  PRIMARY KEY (`Fecha_ini`),
  INDEX `fk_POLIZA_DE AUTOMÓVIL1_idx` (`DE AUTOMÓVIL_Matricula` ASC) VISIBLE,
  INDEX `fk_POLIZA_DE VIDA1_idx` (`DE VIDA_numero` ASC) VISIBLE,
  INDEX `fk_POLIZA_DE VIVIENDA1_idx` (`DE VIVIENDA_Domicilio` ASC) VISIBLE,
  CONSTRAINT `fk_POLIZA_DE AUTOMÓVIL1`
    FOREIGN KEY (`DE AUTOMÓVIL_Matricula`)
    REFERENCES `Actividad_BD`.`DE AUTOMÓVIL` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLIZA_DE VIDA1`
    FOREIGN KEY (`DE VIDA_numero`)
    REFERENCES `Actividad_BD`.`DE VIDA` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLIZA_DE VIVIENDA1`
    FOREIGN KEY (`DE VIVIENDA_Domicilio`)
    REFERENCES `Actividad_BD`.`DE VIVIENDA` (`Domicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
