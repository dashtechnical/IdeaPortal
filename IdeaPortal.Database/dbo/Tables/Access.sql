CREATE TABLE [dbo].[Access] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [AccessName]  NVARCHAR (255) NULL,
    [DisplayName] NVARCHAR (255) NULL,
    [HelpText]    NVARCHAR (MAX) NULL,
    [Deleted]     BIT            CONSTRAINT [DF_Access_Deleted] DEFAULT ((0)) NOT NULL,
    [CreateDTM]   DATETIME       CONSTRAINT [DF_Access_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdateDTM]   DATETIME       NULL,
    CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Access_Update 
   ON  Access 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @AccessId INT
 
       SELECT @AccessId = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Access
		SET UpdateDTM = getDate()
		WHERE ID = @AccessId


END

-- Insert the data for this lookup table
SET IDENTITY_INSERT [dbo].[Access] ON
INSERT INTO [dbo].[Access] ([ID], [AccessName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (1, N'Public', N'Public', N'Idea is viewable by all users', 0, getDate(), NULL)
INSERT INTO [dbo].[Access] ([ID], [AccessName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (2, N'Shared', N'Shared', N'Idea is viewable only with those users you share it with', 0, getDate(), NULL)
INSERT INTO [dbo].[Access] ([ID], [AccessName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (3, N'Private', N'Private', N'Idea is only viewable by you', 0, getDate(), NULL)
SET IDENTITY_INSERT [dbo].[Access] OFF