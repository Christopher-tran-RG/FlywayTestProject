SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Rebuilding [dbo].[Employees]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Employees]
(
[EmployeeID] [int] NOT NULL IDENTITY(1, 1),
[EmployeeFirstName] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Employees] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Employees]([EmployeeID]) SELECT [EmployeeID] FROM [dbo].[Employees]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Employees] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[Employees]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_Employees]', RESEED, @idVal)
GO
DROP TABLE [dbo].[Employees]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Employees]', N'Employees', N'OBJECT'
GO

