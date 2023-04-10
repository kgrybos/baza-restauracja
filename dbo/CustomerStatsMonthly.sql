CREATE VIEW dbo.CustomerStatsMonthly
AS
SELECT dbo.Orders.CustomerId, YEAR(dbo.Orders.OrderDate) AS year, DATEPART(month, dbo.Orders.OrderDate) AS month, ROUND(SUM(dbo.OrderDetails.Quantity * ISNULL(dbo.Menu.UnitPrice, dbo.Products.DefaultPrice) 
                  - dbo.OrderDetails.DiscountAmount), 2) AS totalPrice,
                      (SELECT COUNT(OrderId) AS Expr1
                       FROM      dbo.Orders AS o1
                       WHERE   (CustomerId = dbo.Orders.CustomerId)
                       GROUP BY CustomerId) AS OrderCount, ISNULL
                      ((SELECT 'INDIVIDUAL' AS Expr1
                        FROM      dbo.IndividualCustomer AS ic
                        WHERE   (CustomerId = dbo.Orders.CustomerId)), 'Company') AS AccountType
FROM     dbo.OrderDetails INNER JOIN
                  dbo.Orders ON dbo.OrderDetails.OrderId = dbo.Orders.OrderId INNER JOIN
                  dbo.Products ON dbo.OrderDetails.ProductId = dbo.Products.ProductId INNER JOIN
                  dbo.Menu ON dbo.Products.ProductId = dbo.Menu.ProductId INNER JOIN
                  dbo.Discounts ON dbo.OrderDetails.DiscountId = dbo.Discounts.DiscountId
GROUP BY dbo.Orders.CustomerId, YEAR(dbo.Orders.OrderDate), DATEPART(month, dbo.Orders.OrderDate)
go

exec sp_addextendedproperty 'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 7
               Left = 318
               Bottom = 170
               Right = 528
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 7
               Left = 576
               Bottom = 170
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Menu"
            Begin Extent = 
               Top = 7
               Left = 834
               Bottom = 148
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discounts"
            Begin Extent = 
               Top = 7
               Left = 1092
               Bottom = 170
               Right = 1339
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1', 'SCHEMA', 'dbo', 'VIEW', 'CustomerStatsMonthly'
go

exec sp_addextendedproperty 'MS_DiagramPane2', N'350
      End
   End
End
', 'SCHEMA', 'dbo', 'VIEW', 'CustomerStatsMonthly'
go

exec sp_addextendedproperty 'MS_DiagramPaneCount', 2, 'SCHEMA', 'dbo', 'VIEW', 'CustomerStatsMonthly'
go

grant select on CustomerStatsMonthly to manager
go

