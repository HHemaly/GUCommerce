USE [ff]
GO

DECLARE	@return_value Int,
		@existInCart bit,
		@existInProducts bit,
		@available bit,
		@null bit

EXEC	@return_value = [dbo].[addToCart]
		@customername = N'hany',
		@serial = 1002,
		@existInCart = @existInCart OUTPUT,
		@existInProducts = @existInProducts OUTPUT,
		@available = @available OUTPUT,
		@null = @null OUTPUT

SELECT	@existInCart as N'@existInCart',
		@existInProducts as N'@existInProducts',
		@available as N'@available',
		@null as N'@null'

SELECT	@return_value as 'Return Value'

GO
