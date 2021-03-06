CREATE DATABASE WebDatabase6;

USE [WebDatabase6]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](2) NOT NULL,
	[name] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [nvarchar](4) NOT NULL,
	[orderID] [nvarchar](4) NULL,
	[productID] [nvarchar](10) NULL,
	[price] [numeric](2, 2) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](4) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](10) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[price] [decimal](19, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [nvarchar](2) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [char](2) NOT NULL,
	[name] [char](5) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
SET ANSI_NULLS ON

GO
SET QUOTED_IDENTIFIER ON

GO
SET ANSI_PADDING ON

GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[phone] [char](10) NULL,
	[roleID] [char](2) NOT NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'FL', N'Flower')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'PE', N'Perfume')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'AC', N'Accessories')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'FL-033', N'Rose', CAST(123.450 AS Decimal(19, 2)), 200, N'FL', 1)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'FL-123', N'Lily', CAST(123.00 AS Decimal(19, 2)), 1300, N'FL', 0)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'PE-080', N'Channel', CAST(1.00 AS Decimal(19, 2)), 123, N'PE', 1)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'PE-123', N'Gucci', CAST(2.00 AS Decimal(19, 2)), 1234, N'PE', 0)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [status]) VALUES (N'AC-123', N'Bracelet', CAST(3.00 AS Decimal(19, 2)), 12, N'AC', 1)
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'G', N'Guest')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'kienbui0301@gmail.com', N'Admin', NULL, NULL, N'AD', N'1234')

ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'dung@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'Khai@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'khoa@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'nickbui0301@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'thien@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'yeet@gmail.com'
DELETE FROM [dbo].[tblUsers] WHERE [userID] = 'quang@gmail.com'
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'phuong@gmail.com', N'phuong', NULL, NULL, N'GU', N'1234')