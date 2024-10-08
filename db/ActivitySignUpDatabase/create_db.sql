USE [master]
GO
/****** Object:  Database [ActivitySignUpDatabase]    Script Date: 2021-01-27 12:57:40 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ActivitySignUpDatabase')
BEGIN
CREATE DATABASE [ActivitySignUpDatabase];
END
go

ALTER DATABASE [ActivitySignUpDatabase] SET COMPATIBILITY_LEVEL = 150
GO

/********  Create the application's login **********/
CREATE LOGIN [activity] WITH PASSWORD='!4c1vIty=[]';
go


USE [ActivitySignUpDatabase]
GO

/********  Create the application's user **********/
CREATE USER [activity] FOR LOGIN [activity];
go

/********  Add the application's user to the db_owner role **********/
ALTER ROLE [db_owner] ADD MEMBER [activity];
go

/****** Object:  Table [dbo].[Activity]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Activity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Activity](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [varchar](50) NOT NULL,
	[ActivityDescription] [varchar](250) NOT NULL,
	[ActivityDateTime] [datetime] NOT NULL,
	[ActivityImage] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[CommentPersonId] [int] NOT NULL,
	[CommentActivityId] [int] NOT NULL,
	[CommentContent] [varchar](250) NOT NULL,
	[CommentDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonFirstName] [varchar](50) NOT NULL,
	[PersonLastName] [varchar](50) NOT NULL,
	[PersonEmail] [varchar](120) NOT NULL,
	[PersonActivityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([ActivityId], [ActivityName], [ActivityDescription], [ActivityDateTime], [ActivityImage]) VALUES (54, N'Kayaking in the Grand', N'Here''s your chance to get out of the house!  Enjoy a few hours of sunshine, fresh air and exercise!  Join us on the Grand for some kayaking fun!', CAST(N'2020-08-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Activity] ([ActivityId], [ActivityName], [ActivityDescription], [ActivityDateTime], [ActivityImage]) VALUES (55, N'blah', N'blah blah', CAST(N'2020-12-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Activity] ([ActivityId], [ActivityName], [ActivityDescription], [ActivityDateTime], [ActivityImage]) VALUES (56, N'kajsdhfkaj', N' fnbfgioolsd df dfg dfg ', CAST(N'2021-07-15T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Activity] ([ActivityId], [ActivityName], [ActivityDescription], [ActivityDateTime], [ActivityImage]) VALUES (57, N'', N'', CAST(N'2020-07-27T05:58:03.673' AS DateTime), N'')
INSERT [dbo].[Activity] ([ActivityId], [ActivityName], [ActivityDescription], [ActivityDateTime], [ActivityImage]) VALUES (58, N'lkj;  asdf  asdf asdf', N'klasjdfkljas dfklajdff l;kajsdf ;akjlsdjf; ajsdf', CAST(N'2020-11-06T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentId], [CommentPersonId], [CommentActivityId], [CommentContent], [CommentDateTime]) VALUES (22, 32, 54, N'first comment!!!', CAST(N'2020-08-25T23:34:31.533' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [CommentPersonId], [CommentActivityId], [CommentContent], [CommentDateTime]) VALUES (23, 33, 54, N'awwww shucks!!!', CAST(N'2020-08-25T23:34:31.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (32, N'Anthony', N'Nicholls', N'ac.nicholls@gmail.com', 54)
INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (33, N'person1', N'name2', N'anotherName@email.com', 54)
INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (34, N'person2', N'Name 3', N'noemail@email.com', 54)
INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (35, N'person 4', N'anohterONe', N'email@3mail.com', 54)
INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (36, N'person 5', N'lastname 2', N'email@smemail.com', 54)
INSERT [dbo].[Person] ([PersonId], [PersonFirstName], [PersonLastName], [PersonEmail], [PersonActivityId]) VALUES (37, N'Anthony', N'Nicholls', N'acnicholls@hotmail.com', 54)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
/****** Object:  Index [IDX_Comment_Activity_CommentDate]    Script Date: 2021-01-27 12:57:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND name = N'IDX_Comment_Activity_CommentDate')
CREATE NONCLUSTERED INDEX [IDX_Comment_Activity_CommentDate] ON [dbo].[Comment]
(
	[CommentActivityId] ASC,
	[CommentDateTime] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Person_Email_Activity]    Script Date: 2021-01-27 12:57:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND name = N'IDX_Person_Email_Activity')
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Person_Email_Activity] ON [dbo].[Person]
(
	[PersonActivityId] ASC,
	[PersonEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Activity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Activity] FOREIGN KEY([CommentActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Activity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Activity]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Person] FOREIGN KEY([CommentPersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comment_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Person_Activity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Activity] FOREIGN KEY([PersonActivityId])
REFERENCES [dbo].[Activity] ([ActivityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Person_Activity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Activity]
GO
/****** Object:  StoredProcedure [dbo].[ActivityExistsCheck]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityExistsCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActivityExistsCheck] AS' 
END
GO
ALTER Procedure [dbo].[ActivityExistsCheck]
(
	@ActivityName varchar(50),
	@Result bit output
)
AS
BEGIN
	if exists (Select 1 from Activity where ActivityName = @ActivityName)
	begin
		set @Result = 1;
		return;
	end
	set @result =  0;
END
GO
/****** Object:  StoredProcedure [dbo].[ActivityGetInitialView]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityGetInitialView]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActivityGetInitialView] AS' 
END
GO
ALTER PROCEDURE [dbo].[ActivityGetInitialView]
	@ActivityId int
AS
begin
	SELECT 
		a.ActivityId,
		a.ActivityName,
		a.ActivityDescription,
		a.ActivityDateTime,
		a.ActivityImage
	FROM
		Activity a
	WHERE
		a.ActivityId = @ActivityId;

end
GO
/****** Object:  StoredProcedure [dbo].[ActivityGetList]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityGetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActivityGetList] AS' 
END
GO
ALTER PROCEDURE [dbo].[ActivityGetList]
AS
begin
	SELECT
		ActivityId,
		ActivityName,
		ActivityDateTime,
		ActivityImage
	from
		Activity
end
GO
/****** Object:  StoredProcedure [dbo].[ActivityGetView]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityGetView]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActivityGetView] AS' 
END
GO
ALTER PROCEDURE [dbo].[ActivityGetView]
	@ActivityId int
AS
begin

	Select * from Activity A where A.ActivityId = @ActivityId;

	Select
		concat (PersonFirstName, ' ', PersonLastName) as PersonName
	from
		Person
	where
		PersonActivityId = @ActivityId
	order by
		PersonId;


	SELECT 
		concat (
		p.PersonFirstName, ' ',
		p.PersonLastName, ' on ',
		format(c.CommentDateTime, 'yyyy-mm-dd'), ' at ',
		format(c.CommentDateTime, 'HH:mm') ) as CommentDetail,
		CommentContent
	from
		Comment c inner join Person p on c.CommentPersonId = p.PersonId
	where
		CommentActivityId = @ActivityId
	order by
		c.CommentDateTime desc;

end
GO
/****** Object:  StoredProcedure [dbo].[ActivityInsert]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActivityInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[ActivityInsert]
	@ActivityName varchar(50),
	@ActivityDescription varchar(250),
	@ActivityDateTime datetime,
	@ActivityImage varchar(100),
	@NewId int output
AS
begin

	insert into Activity (ActivityName, ActivityDescription, ActivityDateTime, ActivityImage)
	values (@ActivityName, @ActivityDescription, @ActivityDateTime, @ActivityImage);

	set @NewId = SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[CommentInsert]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CommentInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CommentInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[CommentInsert]
	@CommentPersonId int,
	@CommentActivityId int,
	@CommentContent varchar(250),
	@NewId int output
AS
begin

	insert into Comment (CommentPersonId, CommentActivityId, CommentContent, CommentDateTime)
	values (@CommentPersonId, @CommentActivityId, @CommentContent, GETDATE());

	set @NewId = SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[PersonExistsInActivityCheck]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonExistsInActivityCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonExistsInActivityCheck] AS' 
END
GO
ALTER Procedure [dbo].[PersonExistsInActivityCheck]
(
	@PersonActivityId int, @PersonEmail varchar(120),
	@Result bit output
)
AS
BEGIN
	if exists (Select 1 from Person where PersonActivityId = @PersonActivityId and PersonEmail = @PersonEmail)
	begin
		set @result =  1;
		return;
	end
	set @Result = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[PersonInsert]    Script Date: 2021-01-27 12:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[PersonInsert]
	@PersonFirstName varchar(50),
	@PersonLastName varchar(50),
	@PersonEmail varchar(120),
	@PersonActivityId int,
	@NewId int output
AS
begin

	insert into Person (PersonFirstName, PersonLastName, PersonEmail, PersonActivityId)
	values (@PersonFirstName, @PersonLastName, @PersonEmail, @PersonActivityId);

	set @NewId = SCOPE_IDENTITY();
end
GO
USE [master]
GO
ALTER DATABASE [ActivitySignUpDatabase] SET  READ_WRITE 
GO
