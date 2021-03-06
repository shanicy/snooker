/****** Object:  ForeignKey [FK_ItemsToOrder_Item]    Script Date: 05/31/2013 16:26:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder] DROP CONSTRAINT [FK_ItemsToOrder_Item]
GO
/****** Object:  ForeignKey [FK_ItemsToOrder_Order]    Script Date: 05/31/2013 16:26:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder] DROP CONSTRAINT [FK_ItemsToOrder_Order]
GO
/****** Object:  Table [dbo].[ItemsToOrder]    Script Date: 05/31/2013 16:26:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]') AND type in (N'U'))
DROP TABLE [dbo].[ItemsToOrder]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05/31/2013 16:26:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 05/31/2013 16:26:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
DROP TABLE [dbo].[Item]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 05/31/2013 16:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Hebrew_CI_AS NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [IX_Item] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND name = N'IX_Item_1')
CREATE NONCLUSTERED INDEX [IX_Item_1] ON [dbo].[Item] 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ItemId], [Name], [Price]) VALUES (5, N'whitewine', 45.2)
INSERT [dbo].[Item] ([ItemId], [Name], [Price]) VALUES (6, N'homefrize', 13)
INSERT [dbo].[Item] ([ItemId], [Name], [Price]) VALUES (12, N'beer', 27)
INSERT [dbo].[Item] ([ItemId], [Name], [Price]) VALUES (13, N'goldstar', 22)
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 05/31/2013 16:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[GameHoursTime] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([OrderId], [Date], [GameHoursTime]) VALUES (1, CAST(0x0000A1CF00FC61CF AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[ItemsToOrder]    Script Date: 05/31/2013 16:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemsToOrder](
	[ItemId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_ItemsToOrder] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]') AND name = N'IX_ItemsToOrder')
CREATE NONCLUSTERED INDEX [IX_ItemsToOrder] ON [dbo].[ItemsToOrder] 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
INSERT [dbo].[ItemsToOrder] ([ItemId], [OrderId], [Amount]) VALUES (6, 1, 4)
INSERT [dbo].[ItemsToOrder] ([ItemId], [OrderId], [Amount]) VALUES (12, 1, 5)
/****** Object:  ForeignKey [FK_ItemsToOrder_Item]    Script Date: 05/31/2013 16:26:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder]  WITH CHECK ADD  CONSTRAINT [FK_ItemsToOrder_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder] CHECK CONSTRAINT [FK_ItemsToOrder_Item]
GO
/****** Object:  ForeignKey [FK_ItemsToOrder_Order]    Script Date: 05/31/2013 16:26:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder]  WITH CHECK ADD  CONSTRAINT [FK_ItemsToOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemsToOrder_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemsToOrder]'))
ALTER TABLE [dbo].[ItemsToOrder] CHECK CONSTRAINT [FK_ItemsToOrder_Order]
GO
