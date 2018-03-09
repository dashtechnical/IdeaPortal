CREATE TABLE [dbo].[Idea] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (255) NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Campaign]    INT            NULL,
    [Status]      INT            NULL,
    [CreatedBy]   INT            NULL,
    [CreateDTM]   DATETIME       CONSTRAINT [DF_Idea_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]   INT            NULL,
    [UpdateDTM]   DATETIME       NULL,
    [Deleted]     BIT            CONSTRAINT [DF_Idea_Deleted] DEFAULT ((0)) NOT NULL,
    [Access]      INT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Idea] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Idea_Access] FOREIGN KEY ([Access]) REFERENCES [dbo].[Access] ([ID]),
    CONSTRAINT [FK_Idea_Campaign] FOREIGN KEY ([Campaign]) REFERENCES [dbo].[Campaign] ([ID]),
    CONSTRAINT [FK_Idea_Status] FOREIGN KEY ([Status]) REFERENCES [dbo].[Status] ([ID]),
    CONSTRAINT [FK_Idea_User] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_Idea_User1] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[User] ([ID])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Idea_Update 
   ON  Idea 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Id INT
 
       SELECT @Id = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Idea
		SET UpdateDTM = getDate()
		WHERE ID = @Id


END