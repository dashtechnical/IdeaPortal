CREATE TABLE [dbo].[Login] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [LoginId]   NVARCHAR (255) NULL,
    [Password]  NVARCHAR (255) NULL,
    [Valid]     BIT            CONSTRAINT [DF_Login_Valid] DEFAULT ((0)) NOT NULL,
    [UserID]    INT            NULL,
    [CreateDTM] DATETIME       CONSTRAINT [DF_Login_CreateDTM] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Login_User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([ID])
);

