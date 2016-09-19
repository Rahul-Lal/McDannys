CREATE DATABASE McDannys

USE McDannys;
GO

/* Source Tables
	* Table created are intended for stored the data of the each menu
	* Also includes costs and extra information
*/
	
CREATE SCHEMA Menu
GO
	
CREATE SCHEMA Ordering
GO


CREATE TABLE MainMenu
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Category VARCHAR(25) NOT NULL,
	Cost MONEY NOT NULL
)

CREATE TABLE Sides
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Category VARCHAR(25) NOT NULL,
	Cost MONEY NOT NULL
)

CREATE TABLE Drinks
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Cost MONEY NOT NULL
)

CREATE TABLE Desserts
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Cost MONEY NOT NULL
)

CREATE TABLE Combos
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Cost MONEY NOT NULL
)


/* Orders/Completed Orders Table
	* These tables are intended for the orders being made
	* Then the completed orders go to the 'CompletedOrders' table
*/

CREATE TABLE Orders
(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	MMID INT NOT NULL, MMQuantity INT NOT NULL,
	SideID INT NOT NULL, SideQuantity INT NOT NULL,
	DrinkID INT NOT NULL, DrinkQuantity INT NOT NULL,
	DessertID INT NOT NULL, DessertQuantity INT NOT NULL,
	ComboID INT NOT NULL, ComboQuantity INT NOT NULL,
	Conditions VARCHAR(50),
	Cost MONEY NOT NULL
)

CREATE TABLE CompletedOrders
(
	ID INT NOT NULL PRIMARY KEY,
	MMID INT NOT NULL, MMQuantity INT NOT NULL,
	SideID INT NOT NULL, SideQuantity INT NOT NULL,
	DrinkID INT NOT NULL, DrinkQuantity INT NOT NULL,
	DessertID INT NOT NULL, DessertQuantity INT NOT NULL,
	ComboID INT NOT NULL, ComboQuantity INT NOT NULL,
	Conditions VARCHAR(50),
	Cost MONEY NOT NULL
)


/* SCHEMAS
	* Adding the Tables containing the menu items into the 'Menu' Schemas
	* Adding the Tables containing the orders/completed orders into the 'Ordering' Schemas
*/

ALTER SCHEMA Menu
	TRANSFER dbo.MainMenu;
ALTER SCHEMA Menu
	TRANSFER dbo.Sides;
ALTER SCHEMA Menu
	TRANSFER dbo.Drinks;
ALTER SCHEMA Menu
	TRANSFER dbo.Desserts;
ALTER SCHEMA Menu
	TRANSFER dbo.Combos;

ALTER SCHEMA Ordering
	TRANSFER dbo.Orders;
ALTER SCHEMA Ordering
	TRANSFER dbo.CompletedOrders;