CREATE TABLE [dbo].[Status] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [StatusName]  NVARCHAR (255) NULL,
    [DisplayName] NVARCHAR (255) NULL,
    [HelpText]    NVARCHAR (MAX) NULL,
    [Deleted]     BIT            CONSTRAINT [DF_Status_Deleted] DEFAULT ((0)) NOT NULL,
    [CreateDTM]   DATETIME       CONSTRAINT [DF_Status_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdateDTM]   DATETIME       NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Status_Update 
   ON  [Status] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Id INT
 
       SELECT @Id = INSERTED.ID       
       FROM INSERTED
 
		UPDATE [Status]
		SET UpdateDTM = getDate()
		WHERE ID = @Id


END

-- Insert the data for this lookup table
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT INTO [dbo].[Status] ([ID], [StatusName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (1, N'OnHold', N'On Hold', N'Idea is currently on hold pending further research', 0, getDate(), NULL)
INSERT INTO [dbo].[Status] ([ID], [StatusName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (2, N'Reject', N'Rejected', N'Idea has been rejected', 0, getDate(), NULL)
INSERT INTO [dbo].[Status] ([ID], [StatusName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (3, N'Archive', N'Archived', N'Idea has been archived due to age or inactivity', 0, getDate(), NULL)
INSERT INTO [dbo].[Status] ([ID], [StatusName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (4, N'Approve', N'Approved', N'Idea has been approved and will move to the next stage', 0, getDate(), NULL)
INSERT INTO [dbo].[Status] ([ID], [StatusName], [DisplayName], [HelpText], [Deleted], [CreateDTM], [UpdateDTM]) VALUES (5, N'Score', N'Scored', N'Idea has been scored', 0, getDate(), NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF