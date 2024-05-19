-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(100) NULL,
  `contact_details` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffInformation` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `staff_name` VARCHAR(100) NULL,
  `role` VARCHAR(50) NULL,
  `salary` DECIMAL(10,2) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `table_number` INT NULL,
  `customer_id` INT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customerid_bk_fk_idx` (`customer_id` ASC) VISIBLE,
  INDEX `staffid_bk_fk_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `customerid_bk_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffid_bk_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDB`.`StaffInformation` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuTypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuTypes` (
  `item_type_id` INT NOT NULL AUTO_INCREMENT,
  `item_type` VARCHAR(50) NULL,
  PRIMARY KEY (`item_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menu_item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(100) NULL,
  `item_type_id` INT NULL,
  `price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`menu_item_id`),
  INDEX `itemtypeid_me_fk_idx` (`item_type_id` ASC) VISIBLE,
  CONSTRAINT `itemtypeid_me_fk`
    FOREIGN KEY (`item_type_id`)
    REFERENCES `LittleLemonDB`.`MenuTypes` (`item_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `total_cost` DECIMAL(10,2) NULL,
  `menu_item_id` INT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `menuitemid_or_fk_idx` (`menu_item_id` ASC) VISIBLE,
  INDEX `customerid_or_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `menuitemid_or_fk`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `LittleLemonDB`.`Menu` (`menu_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerid_or_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryStatus` (
  `order_id` INT NOT NULL,
  `delivery_date` DATE NULL,
  `status` VARCHAR(50) NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `orderid_ds_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `LittleLemonDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
