CREATE TABLE [dbo].[Comment] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Idea]        INT            NULL,
    [CommentText] NVARCHAR (MAX) NULL,
    [Deleted]     BIT            CONSTRAINT [DF_Comment_Deleted] DEFAULT ((0)) NOT NULL,
    [CreatedBy]   INT            NULL,
    [CreateDTM]   DATETIME       CONSTRAINT [DF_Comment_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]   INT            NULL,
    [UpdateDTM]   DATETIME       NULL,
    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Comment_Idea] FOREIGN KEY ([Idea]) REFERENCES [dbo].[Idea] ([ID]),
    CONSTRAINT [FK_Comment_User] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_Comment_User1] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[User] ([ID])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Comment_Update 
   ON  Comment 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Id INT
 
       SELECT @Id = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Comment
		SET UpdateDTM = getDate()
		WHERE ID = @Id


END