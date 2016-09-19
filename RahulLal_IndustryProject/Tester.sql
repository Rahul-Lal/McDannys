USE McDannys;
GO
		 DECLARE @MMID AS INT;  DECLARE @MMQuantity AS INT;
		 DECLARE @SideID AS INT;  DECLARE @SideQuantity AS INT;
		 DECLARE @DrinkID  AS INT;  DECLARE @DrinkQuantity AS INT;
		 DECLARE @DessertID AS INT;  DECLARE @DessertQuantity AS INT;
		 DECLARE @ComboID AS INT;  DECLARE @ComboQuantity AS INT;

-- Calculate
--SELECT COUNT(mm.ID), COUNT(s.ID), COUNT(drk.ID), COUNT(dst.ID), COUNT(cbo.ID)
--FROM Menu.MainMenu AS mm
--CROSS JOIN Menu.Sides AS s
--CROSS JOIN Menu.Drinks AS drk
--CROSS JOIN Menu.Desserts AS dst
--CROSS JOIN Menu.Combos AS cbo;


-- Testing totalcost

SET @MMID = 21;
SET @MMQuantity = 5;
SET @SideID = 5;
SET @SideQuantity = 5;
SET @DrinkID = 8;
SET @DrinkQuantity = 7;
SET @DessertID = 3
SET @DessertQuantity = 7;
SET @ComboID = 5
SET @ComboQuantity = 9;
SELECT
	(SELECT ((SELECT mm.Cost FROM Menu.MainMenu AS mm WHERE mm.ID = @MMID) * @MMQuantity)) +
	(SELECT ((SELECT s.Cost FROM Menu.Sides AS s WHERE s.ID = @SideID) * @SideQuantity)) +
	(SELECT ((SELECT dk.Cost FROM Menu.Drinks AS dk WHERE dk.ID = @DrinkID) * @DrinkQuantity)) +
	(SELECT ((SELECT dt.Cost FROM Menu.Desserts AS dt WHERE dt.ID = @DessertID) * @DessertQuantity)) +
	(SELECT ((SELECT cbo.Cost FROM Menu.Combos AS cbo WHERE cbo.ID = @ComboID) * @ComboQuantity)) AS Totalcost;