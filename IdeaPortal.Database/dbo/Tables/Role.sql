CREATE TABLE [dbo].[Role] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [RoleName]    NVARCHAR (255) NULL,
    [DisplayName] NVARCHAR (255) NULL,
    [HelpText]    NVARCHAR (MAX) NULL,
    [Deleted]     BIT            CONSTRAINT [DF_Role_Deleted] DEFAULT ((0)) NOT NULL,
    [CreateDTM]   DATETIME       CONSTRAINT [DF_Role_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdateDTM]   DATETIME       NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Role_Update 
   ON  Role 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Id INT
 
       SELECT @Id = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Role
		SET UpdateDTM = getDate()
		WHERE ID = @Id


END

-- Insert data for this lookup table
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (1, N'Admin', N'System Administrator', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (2, N'User', N'User Administrator', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (3, N'Discussion', N'Discussion Administrator', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (4, N'Idea', N'Idea Administrator', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (5, N'Approver', N'Idea Approver', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (6, N'Scorer', N'Idea Scorer', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (7, N'Public', N'Public access', NULL, 0, getDate(), NULL)
INSERT INTO [dbo].[Role] ([ID], [RoleName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (8, N'Campaign', N'Campaign Administrator', NULL, 0, getDate(), NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF