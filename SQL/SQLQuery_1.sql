CREATE TABLE [dbo].[Store] (
    [Store_Id] INT           NOT NULL,
    [Address]  NVARCHAR (50) NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED ([Store_Id] ASC)
);
CREATE TABLE [dbo].[Product] (
    [Product_Id] INT           NOT NULL,
    [Name]       NVARCHAR (50) NOT NULL,
    [Price]      FLOAT (53)    NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([Product_Id] ASC)
);

CREATE TABLE [dbo].[Sales] (
    [Sales_Id] INT           NOT NULL,
    [Store_Id] INT           NOT NULL,
    [Amount]      FLOAT (53)    NOT NULL,
    CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([Sales_Id] ASC),
    CONSTRAINT FK_StoreId FOREIGN KEY (Store_Id)
    REFERENCES [dbo].[Store](Store_Id)
);

CREATE TABLE [dbo].[SalesProduct] (
    [Id] INT           NOT NULL,
    [Product_Id] INT           NOT NULL,
    [Sales_Id]      INT    NOT NULL,
    CONSTRAINT [PK_SalesProduct] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT FK_ProductId FOREIGN KEY (Product_Id)
    REFERENCES [dbo].[Product](Product_Id),
    CONSTRAINT FK_SalesId FOREIGN KEY (Sales_Id)
    REFERENCES [dbo].[Sales](Sales_Id)
);

CREATE TABLE [dbo].[StaffType] (
    [Type_Id] INT           NOT NULL,
    [Type_Name] NVARCHAR (50)      NOT NULL,
    CONSTRAINT [PK_StaffType] PRIMARY KEY CLUSTERED ([Type_Id] ASC),
);

CREATE TABLE [dbo].[Staff] (
    [Staff_Id] INT           NOT NULL,
    [Name] NVARCHAR (50)      NOT NULL,
    [Type_Id] INT           NOT NULL,
    CONSTRAINT [PK_StaffId] PRIMARY KEY CLUSTERED ([Staff_Id] ASC),
    CONSTRAINT FK_TypeId FOREIGN KEY (Type_id)
    REFERENCES [dbo].[StaffType](Type_Id)

);

CREATE TABLE [dbo].[StaffStore] (
    [Id] INT           NOT NULL,
    [Store_Id] INT       NOT NULL,
    [Staff_Id] INT           NOT NULL,
    CONSTRAINT [PK_StaffStore] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT FK_StoreIdd FOREIGN KEY (Store_Id)
    REFERENCES [dbo].[Store](Store_Id),
    CONSTRAINT FK_StaffId FOREIGN KEY (Staff_Id)
    REFERENCES [dbo].[Staff](Staff_Id)

);



INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (1, 1,3);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (2, 2,4);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (3, 3,3);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (4, 4,4);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (5, 1,1);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (6, 2,2);
INSERT INTO [dbo].[StaffStore] (Id, Store_Id,Staff_Id) VALUES (7, 3,5);

INSERT INTO [dbo].[Staff] (Staff_Id, Name,Type_Id) VALUES (1, 'Alex',2);
INSERT INTO [dbo].[Staff] (Staff_Id, Name,Type_Id) VALUES (2, 'Jaimy',1);
INSERT INTO [dbo].[Staff] (Staff_Id, Name,Type_Id) VALUES (3, 'Susan',3 );
INSERT INTO [dbo].[Staff] (Staff_Id, Name,Type_Id) VALUES (4, 'Kate',3 );
INSERT INTO [dbo].[Staff] (Staff_Id, Name,Type_Id) VALUES (5, 'John',2 );

INSERT INTO [dbo].[StaffType] (Type_Id, Type_Name) VALUES (1, 'Salesman');
INSERT INTO [dbo].[StaffType] (Type_Id, Type_Name) VALUES (2, 'Manager' );
INSERT INTO [dbo].[StaffType] (Type_Id, Type_Name) VALUES (3, 'HR' );

INSERT INTO [dbo].[SalesProduct] (Id, Product_Id ,Sales_Id) VALUES (1, 3,1);
INSERT INTO [dbo].[SalesProduct] (Id, Product_Id ,Sales_Id) VALUES (2, 2,4);
INSERT INTO [dbo].[SalesProduct] (Id, Product_Id ,Sales_Id) VALUES (3, 2,2);

INSERT INTO [dbo].[Store] (Store_Id, Address ,Name) VALUES (1, 'Store1_address', 'Store A');
INSERT INTO [dbo].[Store] (Store_Id, Address ,Name) VALUES (2, 'Store2_address', 'Store B');
INSERT INTO [dbo].[Store] (Store_Id, Address ,Name) VALUES (3, 'Store3_address', 'Store C');
INSERT INTO [dbo].[Store] (Store_Id, Address ,Name) VALUES (4, 'Store4_address', 'Store D');

INSERT INTO [dbo].[Product] (Product_Id, Name ,Price) VALUES (1, 'Product_1', '150');
INSERT INTO [dbo].[Product] (Product_Id, Name ,Price) VALUES (2, 'Product_2', '100');
INSERT INTO [dbo].[Product] (Product_Id, Name ,Price) VALUES (3, 'Product_3', '200');

INSERT INTO [dbo].[Sales] (Sales_Id, Store_Id ,Amount) VALUES (1, 1,2000);
INSERT INTO [dbo].[Sales] (Sales_Id, Store_Id ,Amount) VALUES (2, 2,4000);
INSERT INTO [dbo].[Sales] (Sales_Id, Store_Id ,Amount) VALUES (3, 1,500);
INSERT INTO [dbo].[Sales] (Sales_Id, Store_Id ,Amount) VALUES (4, 4,5000);
INSERT INTO [dbo].[Sales] (Sales_Id, Store_Id ,Amount) VALUES (5, 3,2500);

SELECT
  stf.name, s.Name, typ.Type_Name,s.Address
FROM Store s
JOIN StaffStore ss
  ON ss.Store_Id=s.Store_Id
JOIN Staff stf
  ON stf.Staff_Id=ss.Staff_Id
JOIN StaffType typ
  ON typ.Type_Id=stf.Type_Id;
