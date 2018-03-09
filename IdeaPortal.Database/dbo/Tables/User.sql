CREATE TABLE [dbo].[User] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (255) NULL,
    [LastName]    NVARCHAR (255) NULL,
    [DisplayName] NVARCHAR (255) NULL,
    [Email]       NVARCHAR (255) NULL,
    [Role]        INT            NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_User_Role] FOREIGN KEY ([Role]) REFERENCES [dbo].[Role] ([ID])
);

