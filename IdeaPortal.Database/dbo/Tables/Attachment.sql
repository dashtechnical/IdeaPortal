CREATE TABLE [dbo].[Attachment] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [AttachmentName] NVARCHAR (255) NULL,
    [Idea]           INT            NULL,
    [Type]           NVARCHAR (255) NULL,
    [IdeaImage]      BIT            CONSTRAINT [DF_Attachment_IdeaImage] DEFAULT ((0)) NOT NULL,
    [AttachmentURL]  NVARCHAR (255) NULL,
    [Deleted]        BIT            CONSTRAINT [DF_Attachment_Deleted] DEFAULT ((0)) NOT NULL,
    [CreateDTM]      DATETIME       CONSTRAINT [DF_Attachment_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdateDTM]      DATETIME       NULL,
    [Campaign]       INT            NULL,
    [Comment]        INT            NULL,
    CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Attachment_Idea] FOREIGN KEY ([Idea]) REFERENCES [dbo].[Idea] ([ID])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Attachment_Update 
   ON  Attachment 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @AttachmentId INT
 
       SELECT @AttachmentId = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Attachment
		SET UpdateDTM = getDate()
		WHERE ID = @AttachmentId


END