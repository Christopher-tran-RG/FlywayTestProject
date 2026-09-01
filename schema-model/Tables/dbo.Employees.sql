CREATE TABLE [dbo].[Employees]
(
[EmployeeID] [int] NOT NULL IDENTITY(1, 1),
[EmployeeFirstName] [nvarchar] (50) NOT NULL,
[EmployeeLastName] [nvarchar] (50) NULL,
[Nickname] [nvarchar] (50) NULL,
[DateOfBirth] [date] NULL,
[Sex] [varchar] (50) NULL,
[Position] [varchar] (50) NULL
)
GO
