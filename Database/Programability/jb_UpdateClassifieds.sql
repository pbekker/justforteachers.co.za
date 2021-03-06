USE [justfyty_justfo]
GO
/****** Object:  StoredProcedure [dbo].[jb_UpdateClassifieds]    Script Date: 2014/01/14 13:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[jb_UpdateClassifieds]
	@ItemID         int,
	@UserName       nvarchar(100),
	@JB_JobTitle	nvarchar(255),
	@JB_JobCode	nvarchar(50),
	@JB_JobLocation	nvarchar(50),
	@JB_EmpType	nvarchar(50),
	@JB_ReqEducation	nvarchar(50),
	@JB_YearExp	int,
	@JB_Travel	nvarchar(50),
	@JB_StartingSalary	int,
	@JB_HourlyRate money,
	@JB_OtherSalary nvarchar(50),
	@JB_StartDate	datetime,
	@JB_NumberOpening	int,
	@Message	ntext,
	@JB_CompanyName	nvarchar(150),
	@JB_AddReqList	ntext,
	@JB_BenefitsList	ntext,
	@info1		nvarchar(255),
	@info2		nvarchar(255),
	@info3		nvarchar(255),
	@PrintAd	bit,
	@JB_ContactInfo	nvarchar(2000),
	@JB_ContactEmail	nvarchar(150),
	@PosterPassword	nvarchar(50),
	@ExpireDate	datetime,
	@Authed	bit,
	@CategoryID       int,
	@Featured	bit,
	@it_Name		nvarchar(255),
	@it_Unit		nvarchar(255),
	@it_Street		nvarchar(255),
	@it_City		nvarchar(255),
	@it_Region		nvarchar(255),
	@it_Country		nvarchar(255),
	@it_Postal		nvarchar(255),
	@it_Phone		nvarchar(255),
	@it_Fax			nvarchar(255),
	@it_Email		nvarchar(255),
	@ActionCode nvarchar(50)
AS
IF DATEPART(YYYY,@ExpireDate) = '1900'
	SET @ExpireDate = null

update jb_ClassifiedsItem
	set    	--CreatedByUser   = @UserName,
	         	--CreatedDate     = GetDate(),
		LastUpdate	 = GetDate(),
	      	JB_JobTitle = @JB_JobTitle,
		JB_JobCode = @JB_JobCode,
		JB_JobLocation = @JB_JobLocation,
		JB_EmpType =  @JB_EmpType,
		JB_ReqEducation = @JB_ReqEducation,
		JB_YearExp = @JB_YearExp,
		JB_Travel = @JB_Travel,
		JB_StartingSalary = @JB_StartingSalary,
		JB_HourlyRate = @JB_HourlyRate,
		JB_OtherSalary = @JB_OtherSalary,
		JB_StartDate = @JB_StartDate,
		JB_NumberOpening = @JB_NumberOpening,
		Message = @Message,
--		info1=@info1,
		info2=@info2,
		info3=@info3,
		PrintAd=@PrintAd,
		JB_CompanyName = @JB_CompanyName,
		JB_AddReqList	= @JB_AddReqList,
		JB_BenefitsList = @JB_BenefitsList,
		JB_ContactInfo = @JB_ContactInfo,
		JB_ContactEmail = @JB_ContactEmail,
		--PosterPassword	= @PosterPassword,
		ExpireDate = @ExpireDate,
		Authed = @Authed,
		Featured =  @Featured,
		CategoryID = @CategoryID,
		it_Name=@it_Name,
		it_Unit=@it_Unit,		
		it_Street=@it_Street,		
		it_City=@it_City,		
		it_Region=@it_Region,		
		it_Country=@it_Country,	
		it_Postal=@it_Postal,		
		it_Phone=@it_Phone,		
		it_Fax=@it_Fax,			
		it_Email=@it_Email
	where  ItemID = @ItemID

If @ActionCode =  'ChangePassword'
BEGIN
	UPDATE jb_ClassifiedsItem
	SET 	PosterPassword	= @PosterPassword 
	WHERE ItemID = @ItemID
END