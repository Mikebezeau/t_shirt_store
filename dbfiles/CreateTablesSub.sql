-- G:\dbfiles\CreateTables.sql

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS Subscription 
DEFAULT CHARACTER SET latin1 
COLLATE latin1_swedish_ci;

USE Subscription;

-- -----------------------------------------------------
-- Table Subscription
-- -----------------------------------------------------
DROP TABLE IF EXISTS Subscription;

CREATE TABLE IF NOT EXISTS Subscription (
  SubscriptionID 	INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Email 					VARCHAR(100) NOT NULL,
  TimeStamp 			TIMESTAMP NOT NULL,
  PRIMARY KEY (SubscriptionID),
  UNIQUE INDEX Email_UNIQUE (Email ASC) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- View Email
-- -----------------------------------------------------
DROP VIEW IF EXISTS Email;

CREATE OR REPLACE VIEW Email AS
	SELECT Email
	FROM Subscription;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;