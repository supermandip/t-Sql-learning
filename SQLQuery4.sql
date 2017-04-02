create table [NewOrder](
	[OrderId] Int not null IDENTITY (1,1),
	[OrderDate] datetime,
	[Total] decimal (18,4),
	[CustomerId] int,
	[TelephoneId] int,
)

GO

ALTER TABLE [NewOrder] ADD Constraint PK_OrderID PRIMARY KEY(OrderId);

--SET IDENTITY_INSERT [OrderNEW] ON; //forcing to put in information disregarding relations

--INSERT INTO [Ordernew] (OrderId, OrderDate, Total, CustomerId, TelephoneId)
-- SELECT OrderId, OrderDate, Total,[CustomerId], TelephoneId, SourceId From[Order];

--SET IDENTITY_INSERT [OrderNEW] Off; //forcing to put in information disregarding relations

DROP Table [Order];
GO

exec sp_rename 'NewOrder','Order';
GO


create table [Customer](
	[CustomerId] [int] NOT NULL IDENTITY(1,1),
	[CountryId] [int] NOT NULL,
	[CustomerName] [varchar](64) NOT NULL,
	[CustomerEmail] [varchar](64) NOT NULL
) on [PRIMARY]

GO

ALTER TABLE [Customer] ADD Constraint PK_CustomerId PRIMARY KEY(CustomerId); -- primary

ALTER TABLE [Order] ADD CONSTRAINT Order_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId); --secondary



--Declaring baribale to  be used

declare @newid int;

INSERT INTO [Customer] (CustomerId, CountryId, CustomerName, CustomerEmail)
VALUES (1,'mandip', 'mandip@karki.com');

set @newid=@@IDENTITY; --Identity saves the indentity number increment at that moment

INSERT INTO  [Order] (OrderDate, Total, CustomerId, TelephoneId)
VALUES ('2015-01-01',10000, @newid, 1, 1);

select * from [Order];

