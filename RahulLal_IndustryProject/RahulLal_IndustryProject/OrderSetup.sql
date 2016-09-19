/*
	* This querying is for making orders in the 'Orders' table
	* Also you can move old orders into the 'Completed Orders' table
*/

USE McDannys;
GO


-- FIRST, DON'T TOUCH THESE, But Highlight the following 9 lines
CREATE PROCEDURE OrderedItems
	(
		 @MMID AS INT,  @MMQuantity AS INT,
		 @SideID AS INT,  @SideQuantity AS INT,
		 @DrinkID  AS INT,  @DrinkQuantity AS INT,
		 @DessertID AS INT,  @DessertQuantity AS INT,
		 @ComboID AS INT,  @ComboQuantity AS INT,

/* @TotalCost variable
	* @TotalCost is the overall costing of the number of main's, sides, drinks, desserts, and combos
	* The value is the unit cost of the select item, multipied by the inserted quantity, for each table
*/
		 @Conditions AS VARCHAR(1000),  @TotalCost AS MONEY
	)
AS

-- First, Input values here, Place # with numbers of ID and quantity
	
INSERT INTO [Ordering].[Orders]
VALUES
(
	@MMID, @MMQuantity,
	@SideID, @SideQuantity,
	@DrinkID, @DrinkQuantity,
	@DessertID, @DessertQuantity,
	@ComboID, @ComboQuantity,
	@Conditions, @TotalCost
)

UPDATE Ordering.Orders
	SET Cost = (SELECT
	(SELECT ((SELECT mm.Cost FROM Menu.MainMenu AS mm WHERE mm.ID = @MMID) * @MMQuantity)) +
	(SELECT ((SELECT s.Cost FROM Menu.Sides AS s WHERE s.ID = @SideID) * @SideQuantity)) +
	(SELECT ((SELECT dk.Cost FROM Menu.Drinks AS dk WHERE dk.ID = @DrinkID) * @DrinkQuantity)) +
	(SELECT ((SELECT dt.Cost FROM Menu.Desserts AS dt WHERE dt.ID = @DessertID) * @DessertQuantity)) +
	(SELECT ((SELECT cbo.Cost FROM Menu.Combos AS cbo WHERE cbo.ID = @ComboID) * @ComboQuantity)))
	WHERE ID = (SELECT MAX(ID) FROM Ordering.Orders);