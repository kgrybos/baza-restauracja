CREATE VIEW dbo.CustomerTotalStats
AS
SELECT dbo.Orders.CustomerId, SUM((dbo.OrderDetails.Quantity * ISNULL(dbo.Menu.UnitPrice, dbo.Products.DefaultPrice)) * (1 - dbo.OrderDetails.DiscountAmount)) AS totalPrice
FROM     dbo.OrderDetails INNER JOIN
                  dbo.Orders ON dbo.OrderDetails.OrderId = dbo.Orders.OrderId INNER JOIN
                  dbo.Products ON dbo.OrderDetails.ProductId = dbo.Products.ProductId INNER JOIN
                  dbo.Menu ON dbo.Products.ProductId = dbo.Menu.ProductId INNER JOIN
                  dbo.Discounts ON dbo.OrderDetails.DiscountId = dbo.Discounts.DiscountId
GROUP BY dbo.Orders.CustomerId
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
               Top = 18
               Left = 424
               Bottom = 252
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 24
               Left = 83
               Bottom = 187
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Menu"
            Begin Extent = 
               Top = 10
               Left = 1073
               Bottom = 151
               Right = 1267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discounts"
            Begin Extent = 
               Top = 269
               Left = 372
               Bottom = 432
               Right = 603
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
         Or', 'SCHEMA', 'dbo', 'VIEW', 'DiscountTotalStatistics'
go

exec sp_addextendedproperty 'MS_DiagramPane2', N' = 1350
      End
   End
End
', 'SCHEMA', 'dbo', 'VIEW', 'DiscountTotalStatistics'
go

exec sp_addextendedproperty 'MS_DiagramPaneCount', 2, 'SCHEMA', 'dbo', 'VIEW', 'DiscountTotalStatistics'
go

