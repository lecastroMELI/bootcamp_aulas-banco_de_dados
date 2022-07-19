-- MySQL Script generated by MySQL Workbench
-- Mon Jul 18 19:24:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema meli_internet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meli_internet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meli_internet` DEFAULT CHARACTER SET utf8 ;
USE `meli_internet` ;

-- -----------------------------------------------------
-- Table `meli_internet`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meli_internet`.`cliente` ;

CREATE TABLE IF NOT EXISTS `meli_internet`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `planos_id` INT NOT NULL,
  PRIMARY KEY (`id`, `planos_id`),
  INDEX `fk_cliente_planos_idx` (`planos_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_planos`
    FOREIGN KEY (`planos_id`)
    REFERENCES `meli_internet`.`planos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meli_internet`.`planos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meli_internet`.`planos` ;

CREATE TABLE IF NOT EXISTS `meli_internet`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `velocidade_mb` INT NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `desconto` DECIMAL(4,2) NOT NULL DEFAULT 00.00,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `meli_internet`.`planos`
-- -----------------------------------------------------
START TRANSACTION;
USE `meli_internet`;
INSERT INTO `meli_internet`.`planos` (`id`, `velocidade_mb`, `preco`, `desconto`) VALUES (1, 50, 29.90, DEFAULT);
INSERT INTO `meli_internet`.`planos` (`id`, `velocidade_mb`, `preco`, `desconto`) VALUES (2, 100, 99.90, 10.00);
INSERT INTO `meli_internet`.`planos` (`id`, `velocidade_mb`, `preco`, `desconto`) VALUES (3, 300, 195.00, DEFAULT);
INSERT INTO `meli_internet`.`planos` (`id`, `velocidade_mb`, `preco`, `desconto`) VALUES (4, 150, 119.90, 20.00);
INSERT INTO `meli_internet`.`planos` (`id`, `velocidade_mb`, `preco`, `desconto`) VALUES (5, 200, 175.00, 35.00);


-- -----------------------------------------------------
-- Data for table `meli_internet`.`cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `meli_internet`;
INSERT INTO `cliente` VALUES (1, "Wonder", "Woman", "1987-02-19", "SP", "São Paulo", 3);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
