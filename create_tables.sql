CREATE TABLE IF NOT EXISTS User (
    PersonalNumber CHAR(12) NOT NULL UNIQUE,
    FirstName NVARCHAR(40) NOT NULL,
    LastName NVARCHAR(40) NOT NULL,
    Address NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Email NVARCHAR(50) NOT NULL UNIQUE,
    Passwords NVARCHAR(20) NOT NULL,
    Acceptnewsletter BOOL NOT NULL DEFAULT 0,
    PRIMARY KEY (PersonalNumber)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS DDepartment (
    DID CHAR(12) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500),
    ShortDescription NVARCHAR(100),
    Welcometext NVARCHAR(100),
    ParentDID CHAR(12),
    PRIMARY KEY (DID)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

ALTER TABLE DDepartment 
	ADD FOREIGN KEY (ParentDID) REFERENCES DDepartment(DID);

CREATE TABLE IF NOT EXISTS Keyword (
    Keyword NVARCHAR(50) NOT NULL,
    PRIMARY KEY (Keyword)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS Product (
    PID CHAR(12) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500),
    ShortDescription NVARCHAR(100),
    VATPercent DOUBLE NOT NULL CHECK (VATPercent >= 0.0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    Discount DOUBLE NOT NULL DEFAULT 0.0 CHECK (Discount BETWEEN 0.0 AND 1.0),
    RetailPriceNoVAT DOUBLE NOT NULL CHECK (RetailPriceNoVAT >= 0.0),
    DID CHAR(12) NOT NULL,
    PRIMARY KEY (PID),
    FOREIGN KEY (DID)
        REFERENCES DDepartment (DID)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS Contains (
    Keyword NVARCHAR(50) NOT NULL,
    PID CHAR(12) NOT NULL,
    PRIMARY KEY (Keyword , PID),
    FOREIGN KEY (PID)
        REFERENCES Product (PID),
    FOREIGN KEY (Keyword)
        REFERENCES Keyword (Keyword)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS Review (
    PID CHAR(12) NOT NULL,
    PersonalNumber CHAR(12) NOT NULL,
    Stars INT NOT NULL CHECK (Stars >= 1 AND Stars <= 5),
    TextComment NVARCHAR(500),
    PRIMARY KEY (PID , PersonalNumber),
    FOREIGN KEY (PID)
        REFERENCES Product (PID),
    FOREIGN KEY (PersonalNumber)
        REFERENCES User (PersonalNumber)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS Orders (
    OID CHAR(12) NOT NULL UNIQUE,
    OrderStatus ENUM('new', 'open', 'dispatched') NOT NULL,
    OrderDate DATE NOT NULL,
    LastChangeDate DATE NOT NULL CHECK (LastChangeDate >= OrderDate),
    PaymentReference VARCHAR(50),
    TrackingNumber VARCHAR(50),
    PersonalNumber CHAR(12) NOT NULL,
    PRIMARY KEY (OID),
    FOREIGN KEY (PersonalNumber)
        REFERENCES User (PersonalNumber)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS Includes (
    PID CHAR(12) NOT NULL,
    OID CHAR(12) NOT NULL,
    Quantity INT CHECK (Quantity >= 1),
    PRIMARY KEY (OID , PID),
    FOREIGN KEY (PID)
        REFERENCES Product (PID),
    FOREIGN KEY (OID)
        REFERENCES Orders (OID)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;
