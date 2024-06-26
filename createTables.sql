CREATE TABLE Patient
(
  PID NUMERIC(10) NOT NULL,
  Patient_Name VARCHAR(15) NOT NULL,
  address VARCHAR(20) NOT NULL,
  DateOfBrith DATE NOT NULL,
  PRIMARY KEY (PID)
);

CREATE TABLE Medicine
(
  DrugId NUMERIC(5) NOT NULL,
  Price NUMERIC(10) NOT NULL,
  Quantity NUMERIC(15) NOT NULL,
  PRIMARY KEY (DrugId)
);

CREATE TABLE Supplier
(
  SId NUMERIC(7) NOT NULL,
  Name VARCHAR(15) NOT NULL,
  City VARCHAR(10) NOT NULL,
  PRIMARY KEY (SId)
);

CREATE TABLE Pharmacy
(
  StoreId NUMERIC(3) NOT NULL,
  StoreName VARCHAR(15) NOT NULL,
  City VARCHAR(10) NOT NULL,
  PRIMARY KEY (StoreId)
);

CREATE TABLE Bill
(
  BNumber NUMERIC(6) NOT NULL,
  Price NUMERIC(6) NOT NULL,
  DateOfBill DATE NOT NULL,
  StoreId NUMERIC(3) NOT NULL,
  PID NUMERIC(10) NOT NULL,
  PRIMARY KEY (BNumber),
  FOREIGN KEY (StoreId) REFERENCES Pharmacy(StoreId),
  FOREIGN KEY (PID) REFERENCES Patient(PID)
);

CREATE TABLE tto
(
  PID NUMERIC(10) NOT NULL,
  DrugId NUMERIC(5) NOT NULL,
  PRIMARY KEY (PID, DrugId),
  FOREIGN KEY (PID) REFERENCES Patient(PID),
  FOREIGN KEY (DrugId) REFERENCES Medicine(DrugId)
);

CREATE TABLE Gives_Order
(
  StoreId NUMERIC(3) NOT NULL,
  SId NUMERIC(7) NOT NULL,
  PRIMARY KEY (StoreId, SId),
  FOREIGN KEY (StoreId) REFERENCES Pharmacy(StoreId),
  FOREIGN KEY (SId) REFERENCES Supplier(SId)
);

CREATE TABLE Sellby
(
  Quantity NUMERIC(9) NOT NULL,
  DrugId NUMERIC(5) NOT NULL,
  BNumber NUMERIC(6) NOT NULL,
  PRIMARY KEY (DrugId, BNumber),
  FOREIGN KEY (DrugId) REFERENCES Medicine(DrugId),
  FOREIGN KEY (BNumber) REFERENCES Bill(BNumber)
);

CREATE TABLE Supplie
(
  DrugId NUMERIC(5) NOT NULL,
  SId NUMERIC(7) NOT NULL,
  PRIMARY KEY (DrugId, SId),
  FOREIGN KEY (DrugId) REFERENCES Medicine(DrugId),
  FOREIGN KEY (SId) REFERENCES Supplier(SId)
);

CREATE TABLE Employee
(
  EID NUMERIC(10) NOT NULL,
  Name VARCHAR(15) NOT NULL,
  Salary NUMERIC(10) NOT NULL,
  StoreId NUMERIC(3) NOT NULL,
  PRIMARY KEY (EID),
  FOREIGN KEY (StoreId) REFERENCES Pharmacy(StoreId)
);
