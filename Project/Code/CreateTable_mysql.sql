CREATE TABLE `Products` (
  `ProductID` VARCHAR(20) PRIMARY KEY NOT NULL,
  `ItemName` VARCHAR(50) NOT NULL,
  `ItemDescription` VARCHAR(100),
  `ItemCategory` INT NOT NULL,
  `ItemPrice` INT NOT NULL,
  `Count` INT NOT NULL,
  `Aging` FLOAT,
  `CumulativeSale` INT NOT NULL
);

CREATE TABLE `Customers` (
  `CustomerID` VARCHAR(100) PRIMARY KEY NOT NULL,
  `CustomerEmail` VARCHAR(100) UNIQUE NOT NULL,
  `CustomerPassword` VARCHAR(100) NOT NULL,
  `CustomerTel` VARCHAR(100) NOT NULL,
  `CustomerGender` VARCHAR(10),
  `CustomerName` VARCHAR(100) NOT NULL,
  `CustomerAddress` VARCHAR(100) NOT NULL,
  `CustomerBirth` DATE,
  `CustomerDateofjoin` DATE,
  `CustomerGrade` VARCHAR(2) NOT NULL
);

CREATE TABLE `Categories` (
  `CategoryKey` INT PRIMARY KEY NOT NULL,
  `CategoryName` VARCHAR(30) NOT NULL
);

CREATE TABLE `Orders` (
  `OrderID` VARCHAR(20) PRIMARY KEY NOT NULL,
  `UserLogin` VARCHAR(20),
  `DateOrder` DATE NOT NULL,
  `OrderRegionDetail` VARCHAR(100) NOT NULL,
  `SelDiscount` VARCHAR(50),
  `PaymentMethod` VARCHAR(10),
  'ShippingCost' INT,
  `TotalPrice` INT NOT NULL,
  `AddDetail` VARCHAR(100) NOT NULL,
  `ItemCNT` INT,
  `OrderName` VARCHAR(15) NOT NULL,
  `OrderTel` VARCHAR(15) NOT NULL,
  `Refund` VARCHAR(1)
);

CREATE TABLE `OrderedProducts` (
  `OrderID` VARCHAR(20) NOT NULL,
  `ProductID` VARCHAR(20) NOT NULL,
  `Price` INT NOT NULL,
  `ItemNum` INT,
  PRIMARY KEY (`OrderID`, `ProductID`)
);

CREATE TABLE `DiscountDetails` (
  `ItemSale` INT,
  `DiscountDetail` VARCHAR(20),
  `CustomerGrade` VARCHAR(2) PRIMARY KEY NOT NULL
);

CREATE TABLE `ShoppingCart` (
  `CartKey` INT PRIMARY KEY NOT NULL,
  `CustomerID` VARCHAR(100) NOT NULL,
  `ProductID` VARCHAR(20) NOT NULL,
  `Count` INT,
  `CDate` DATE
);

CREATE TABLE `QnA` (
  `QnAID` INT PRIMARY KEY NOT NULL,
  `CustomerID` VARCHAR(100),
  `QnACategory` INT NOT NULL,
  `ProductID` VARCHAR(20),
  `OrderID` VARCHAR(20),
  `QnADate` DATE NOT NULL,
  `Password` VARCHAR(20),
  `QnAState` VARCHAR(10)
);

ALTER TABLE `Products` ADD CONSTRAINT `fk_Products_ItemCategory` FOREIGN KEY (`ItemCategory`) REFERENCES `Categories` (`CategoryKey`);

ALTER TABLE `OrderedProducts` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `OrderedProducts` ADD FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

ALTER TABLE `Customers` ADD CONSTRAINT `fk_Customers_CustomerGrade` FOREIGN KEY (`CustomerGrade`) REFERENCES `DiscountDetails` (`CustomerGrade`);

ALTER TABLE `ShoppingCart` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

ALTER TABLE `ShoppingCart` ADD FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

ALTER TABLE `QnA` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

ALTER TABLE `QnA` ADD FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

ALTER TABLE `QnA` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `QnA` ADD CONSTRAINT `fk_QnA_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `OrderedProducts` (`OrderID`);
