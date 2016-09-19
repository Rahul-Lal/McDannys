USE McDannys;
GO

-- View these First
SELECT * FROM Menu.MainMenu;
SELECT * FROM Menu.Sides;
SELECT * FROM Menu.Drinks;
SELECT * FROM Menu.Desserts;
SELECT * FROM Menu.Combos;


-- Changed the each # with the ID for item and it's quantity
EXEC [dbo].[OrderedItems]
 -- ID for Main
 @MMID = 19,
	-- Desired quantity
	@MMQuantity = 10,
@SideID = 4, -- ID for Sides
	 -- Desired quantity
	@SideQuantity = 2,
-- ID for Drinks
@DrinkID= 3,
	 -- Desired quantity
	@DrinkQuantity = 1,
 -- ID for Desserts
@DessertID = 3,
	-- Desired quantity
	@DessertQuantity = 3,
-- ID for Combos
@ComboID = 2,
	-- Desired quantity
	@ComboQuantity = 1,
-- Any conditions, e.g - No pickles in burger
@Conditions = 'Burger with no onions',
	 -- DO NOT TOUCH, will be altered
	@TotalCost = 0.00;
EXEC dbo.CompleteOrderTransfer;
SELECT * FROM Ordering.Orders;
SELECT * FROM Ordering.CompletedOrders