CREATE TABLE [dbo].[Campaign] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [CampaignName]      NVARCHAR (255) NOT NULL,
    [ScoringStartDate]  DATETIME       NULL,
    [EndDate]           DATE           NULL,
    [Active]            BIT            CONSTRAINT [DF_Campaign_Deleted] DEFAULT ((0)) NOT NULL,
    [CreatedBy]         INT            NULL,
    [CreateDTM]         DATETIME       CONSTRAINT [DF_Campaign_CreateDTM] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]         INT            NULL,
    [UpdateDTM]         DATETIME       NULL,
    [Description]       NVARCHAR (MAX) NOT NULL,
    [Rewards]           NVARCHAR (MAX) NULL,
    [ApprovalStartDate] DATE           NULL,
    [Sponsor]           INT            NULL,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Campaign_User] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_Campaign_User1] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[User] ([ID])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Campaign_Update 
   ON  Campaign 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Id INT
 
       SELECT @Id = INSERTED.ID       
       FROM INSERTED
 
		UPDATE Campaign
		SET UpdateDTM = getDate()
		WHERE ID = @Id


END