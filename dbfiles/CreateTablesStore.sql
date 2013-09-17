-- G:\dbfiles\CreateTablesStore.sql

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS Store;
CREATE SCHEMA IF NOT EXISTS Store 
	DEFAULT CHARACTER SET latin1 
	COLLATE latin1_swedish_ci;
	
USE Store;

-- -----------------------------------------------------
-- Table Tag
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tag;

CREATE TABLE IF NOT EXISTS Tag (
  TagID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Tag 	VARCHAR(40) NOT NULL,
  PRIMARY KEY (TagID) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Shirt
-- -----------------------------------------------------
DROP TABLE IF EXISTS Shirt;

CREATE TABLE IF NOT EXISTS Shirt (
  ShirtID 		INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Price 			DECIMAL(6,4) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Title 			VARCHAR(100) NOT NULL,
  Colour 			VARCHAR(20) NOT NULL,
  PointRate 	FLOAT NOT NULL,
  TagID 			TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (ShirtID),
  INDEX fk_Shirt_Tag1 (TagID ASC),
  CONSTRAINT fk_Shirt_Tag1
    FOREIGN KEY (TagID)
    REFERENCES Tag (TagID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Size
-- -----------------------------------------------------
DROP TABLE IF EXISTS Size;

CREATE  TABLE IF NOT EXISTS Size (
  SizeID 	TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Size 		CHAR(3) NOT NULL,
  PRIMARY KEY (SizeID) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ShirtSize
-- -----------------------------------------------------
DROP TABLE IF EXISTS ShirtSize;

CREATE TABLE IF NOT EXISTS ShirtSize (
  ShirtID INT UNSIGNED NOT NULL,
  SizeID TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (ShirtID, SizeID),
  INDEX fk_ShirtSize_Shirt1 (ShirtID ASC),
  INDEX fk_ShirtSize_Size1 (SizeID ASC),
  CONSTRAINT fk_ShirtSize_Shirt1
    FOREIGN KEY (ShirtID)
    REFERENCES Shirt (ShirtID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ShirtSize_Size1
    FOREIGN KEY (SizeID)
    REFERENCES Size (SizeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Type
-- -----------------------------------------------------
DROP TABLE IF EXISTS Type;

CREATE TABLE IF NOT EXISTS Type (
  TypeID 	TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Type 		VARCHAR(20) NOT NULL,
  PRIMARY KEY (TypeID) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Image
-- -----------------------------------------------------
DROP TABLE IF EXISTS Image;

CREATE TABLE IF NOT EXISTS Image (
  ImageID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Image 	VARCHAR(20) NOT NULL,
  TypeID 	TINYINT UNSIGNED NOT NULL,
  ShirtID INT UNSIGNED NOT NULL,
  PRIMARY KEY (ImageID),
  INDEX fk_Image_Shirt (ShirtID ASC),
  INDEX fk_Image_Type1 (TypeID ASC),
  CONSTRAINT fk_Image_Shirt
    FOREIGN KEY (ShirtID)
    REFERENCES Shirt (ShirtID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Image_Type1
    FOREIGN KEY (TypeID)
    REFERENCES Type (TypeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ShirtType
-- -----------------------------------------------------
DROP TABLE IF EXISTS ShirtType;

CREATE TABLE IF NOT EXISTS ShirtType (
  ShirtID INT UNSIGNED NOT NULL,
  TypeID 	TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (ShirtID, TypeID),
  INDEX fk_ShirtType_Shirt1 (ShirtID ASC),
  INDEX fk_ShirtType_Type1 (TypeID ASC),
  CONSTRAINT fk_ShirtType_Shirt1
    FOREIGN KEY (ShirtID)
    REFERENCES Shirt (ShirtID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ShirtType_Type1
    FOREIGN KEY (TypeID)
    REFERENCES Type (TypeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Cart
-- -----------------------------------------------------
DROP TABLE IF EXISTS Cart;

CREATE TABLE IF NOT EXISTS Cart (
  CartID 				INT UNSIGNED NOT NULL AUTO_INCREMENT,
  UserID 				VARCHAR(45) NULL,
  SID 					VARCHAR(32) NOT NULL,
  OpenDate 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  CompletedDate TIMESTAMP NULL,
  PRIMARY KEY (CartID),
	UNIQUE uq_Cart_SID (SID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CartItem
-- -----------------------------------------------------
DROP TABLE IF EXISTS CartItem;

CREATE TABLE IF NOT EXISTS CartItem (
  CartID 		INT UNSIGNED NOT NULL,
  ShirtID 	INT UNSIGNED NOT NULL,
  SizeID 		TINYINT UNSIGNED NOT NULL,
  TypeID 		TINYINT UNSIGNED NOT NULL,
  Quantity 	TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (CartID, ShirtID, SizeID, TypeID),
  INDEX fk_CartItem_Shirt1 (ShirtID ASC),
  INDEX fk_CartItem_Cart1 (CartID ASC),
  INDEX fk_CartItem_Size1 (SizeID ASC),
  INDEX fk_CartItem_Type1 (TypeID ASC),
  CONSTRAINT fk_CartItem_Shirt1
    FOREIGN KEY (ShirtID)
    REFERENCES Shirt (ShirtID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CartItem_Cart1
    FOREIGN KEY (CartID)
    REFERENCES Cart (CartID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CartItem_Size1
    FOREIGN KEY (SizeID)
    REFERENCES Size (SizeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CartItem_Type1
    FOREIGN KEY (TypeID)
    REFERENCES Type (TypeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Shipping
-- -----------------------------------------------------
DROP TABLE IF EXISTS Shipping;

CREATE  TABLE IF NOT EXISTS Shipping (
  ShippingID 	TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Method 			VARCHAR(20) NOT NULL,
  UnitCost 		DECIMAL(6,4) NOT NULL,
  PRIMARY KEY (ShippingID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table PaymentType
-- -----------------------------------------------------
DROP TABLE IF EXISTS PaymentType;

CREATE TABLE IF NOT EXISTS PaymentType (
  PaymentTypeID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Type VARCHAR(20) NOT NULL,
  PRIMARY KEY (PaymentTypeID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Customer
-- -----------------------------------------------------
DROP TABLE IF EXISTS Customer;

CREATE TABLE IF NOT EXISTS Customer (
  CustomerID 	INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Email 			VARCHAR(100) NOT NULL,
  LastName 		VARCHAR(40) NOT NULL,
  FirstName 	VARCHAR(40) NOT NULL,
  PRIMARY KEY (CustomerID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Province
-- -----------------------------------------------------
DROP TABLE IF EXISTS Province;

CREATE  TABLE IF NOT EXISTS Province (
  ProvinceCode CHAR(2) NOT NULL,
  ProvinceName VARCHAR(26) NOT NULL,
  PRIMARY KEY (ProvinceCode)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Address
-- -----------------------------------------------------
DROP TABLE IF EXISTS Address;

CREATE TABLE IF NOT EXISTS Address (
  AddressID 		INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PhoneNumber 	CHAR(10) NOT NULL,
  StreetAddress VARCHAR(50) NOT NULL,
  City 					VARCHAR(20) NOT NULL,
  ProvinceCode 	CHAR(2) NOT NULL,
  Country 			VARCHAR(30) NOT NULL,
  PostalCode 		CHAR(6) NOT NULL,
  PRIMARY KEY (AddressID),
  INDEX fk_Address_Province1 (ProvinceCode ASC),
  CONSTRAINT fk_Address_Province1
    FOREIGN KEY (ProvinceCode)
    REFERENCES Province (ProvinceCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CustomerAddress
-- -----------------------------------------------------
DROP TABLE IF EXISTS CustomerAddress;

CREATE TABLE IF NOT EXISTS CustomerAddress (
  CustomerAddressID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CustomerID 				INT UNSIGNED NOT NULL,
  AddressID 				INT UNSIGNED NOT NULL,
  INDEX fk_CustomerAddress_Customer1 (CustomerID ASC),
  INDEX fk_CustomerAddress_Address1 (AddressID ASC),
  PRIMARY KEY (CustomerAddressID),
  UNIQUE INDEX uq_CustomerAddress (CustomerID ASC, AddressID ASC),
  CONSTRAINT fk_CustomerAddress_Customer1
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CustomerAddress_Address1
    FOREIGN KEY (AddressID)
    REFERENCES Address (AddressID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table PaymentInfo
-- -----------------------------------------------------
DROP TABLE IF EXISTS PaymentInfo;

CREATE TABLE IF NOT EXISTS PaymentInfo (
  CartID 							INT UNSIGNED NOT NULL,
  BillAddressID 			INT UNSIGNED NOT NULL,
  ShipAddressID 			INT UNSIGNED NOT NULL,
  PaymentTypeID 			TINYINT UNSIGNED NOT NULL,
  ConfirmationNumber 	VARCHAR(50) NOT NULL,
  ShippingID 					TINYINT UNSIGNED NOT NULL,
  CouponCode 					CHAR(6) NULL,
  PRIMARY KEY (CartID),
  INDEX fk_PaymentInfo_Shipping1 (ShippingID ASC),
  INDEX fk_PaymentInfo_PaymentType1 (PaymentTypeID ASC),
  INDEX fk_PaymentInfo_CustomerAddress1 (BillAddressID ASC),
  INDEX fk_PaymentInfo_CustomerAddress2 (ShipAddressID ASC),
  CONSTRAINT fk_PaymentInfo_Shipping1
    FOREIGN KEY (ShippingID)
    REFERENCES Shipping (ShippingID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PaymentInfo_PaymentType1
    FOREIGN KEY (PaymentTypeID)
    REFERENCES PaymentType (PaymentTypeID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PaymentInfo_Cart1
    FOREIGN KEY (CartID)
    REFERENCES Cart (CartID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PaymentInfo_CustomerAddress1
    FOREIGN KEY (BillAddressID)
    REFERENCES CustomerAddress (CustomerAddressID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PaymentInfo_CustomerAddress2
    FOREIGN KEY (ShipAddressID)
    REFERENCES CustomerAddress (CustomerAddressID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;