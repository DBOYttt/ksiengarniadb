-- MySQL Script generated by MySQL Workbench
-- Fri Apr 28 12:48:48 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`autorzy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autorzy` (
  `imie_nazwisko` VARCHAR(50) NOT NULL,
  `data_urodzenia` DATE NULL DEFAULT NULL,
  `narodowość` VARCHAR(50) NULL DEFAULT NULL,
  `biografia` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`imie_nazwisko`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`klienci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`klienci` (
  `id` INT(11) NOT NULL,
  `imie_nazwisko` VARCHAR(50) NULL DEFAULT NULL,
  `adres` VARCHAR(50) NULL DEFAULT NULL,
  `numer_telefonu` VARCHAR(50) NULL DEFAULT NULL,
  `emile` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pracownicy` (
  `imie_nazwisko` VARCHAR(50) NOT NULL,
  `data_zatrudnienia` DATE NULL DEFAULT NULL,
  `stanowisko` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`imie_nazwisko`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`zamówienia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zamówienia` (
  `id` INT(11) NOT NULL,
  `data_zamówienia` DATE NULL DEFAULT NULL,
  `status_zamówienia` VARCHAR(50) NULL DEFAULT NULL,
  `kwota` VARCHAR(50) NULL DEFAULT NULL,
  `klienci_id` INT(11) NOT NULL,
  `pracownicy_imie_nazwisko` VARCHAR(50) NOT NULL,
  INDEX `fk_zamówienia_klienci1_idx` (`klienci_id` ASC) VISIBLE,
  INDEX `fk_zamówienia_pracownicy1_idx` (`pracownicy_imie_nazwisko` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_zamówienia_klienci1`
    FOREIGN KEY (`klienci_id`)
    REFERENCES `mydb`.`klienci` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_zamówienia_pracownicy1`
    FOREIGN KEY (`pracownicy_imie_nazwisko`)
    REFERENCES `mydb`.`pracownicy` (`imie_nazwisko`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `Autor` VARCHAR(50) NULL DEFAULT NULL,
  `kategoria` VARCHAR(50) NULL DEFAULT NULL,
  `cena` VARCHAR(50) NULL DEFAULT NULL,
  `Ilość` INT(11) NULL DEFAULT NULL,
  `ISBN` VARCHAR(50) NULL DEFAULT NULL,
  `autorzy_imie_nazwisko` VARCHAR(50) NOT NULL,
  `zamówienia_id` INT(11) NOT NULL,
  INDEX `fk_books_autorzy_idx` (`autorzy_imie_nazwisko` ASC) VISIBLE,
  INDEX `fk_books_zamówienia1_idx` (`zamówienia_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_autorzy`
    FOREIGN KEY (`autorzy_imie_nazwisko`)
    REFERENCES `mydb`.`autorzy` (`imie_nazwisko`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_zamówienia1`
    FOREIGN KEY (`zamówienia_id`)
    REFERENCES `mydb`.`zamówienia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
