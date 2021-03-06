USE [ResultProcessing]
GO
/****** Object:  UserDefinedFunction [dbo].[Decrypt]    Script Date: 9/9/2021 8:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Decrypt]
(  
    @ValueToDecrypt varbinary(max)  
)  
RETURNS varchar(max)  
AS  
BEGIN  
    -- Declare the return variable here  
    DECLARE @Result varchar(max)  
    SET @Result = DecryptByKey(@ValueToDecrypt)  
    -- Return the result of the function  
    RETURN @Result  
END
GO
/****** Object:  UserDefinedFunction [dbo].[Encrypt]    Script Date: 9/9/2021 8:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Encrypt]
(  
    @ValueToEncrypt varchar(max)  
)  
RETURNS varbinary(max)  
AS  
BEGIN  
    -- Declare the return variable here  
    DECLARE @Result varbinary(max)  
    SET @Result = EncryptByKey(Key_GUID('5475-95ghf-jfkl-dgkk-s648-4940-4bhc-mjhf'), @ValueToEncrypt)  
    -- Return the result of the function  
    RETURN @Result  
END
GO
/****** Object:  Table [dbo].[tbl_level]    Script Date: 9/9/2021 8:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_level](
	[level_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([level_id]),
	[level_name] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_level] ON 

INSERT [dbo].[tbl_level] ([level_id], [level_name], [updated_date], [updated_time]) VALUES (1, NULL, CAST(N'2021-07-14' AS Date), CAST(N'04:47:31.2233333' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_level] OFF
GO
ALTER TABLE [dbo].[tbl_level] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_level] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  StoredProcedure [dbo].[sp_OpenEncryptionKeys]    Script Date: 9/9/2021 8:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_OpenEncryptionKeys]  
AS  
BEGIN  
    SET NOCOUNT ON;  

    BEGIN TRY  
        OPEN SYMMETRIC KEY Encryption_Symmetric_Key  
        DECRYPTION BY CERTIFICATE Encryption_Certificate 
    END TRY  
    BEGIN CATCH  
        --catch
    END CATCH  
END
GO
