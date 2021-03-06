USE [ResultProcessing]
GO
/****** Object:  Table [dbo].[tbl_assign_course]    Script Date: 24/03/2021 4:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_assign_course](
	[assign_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([assign_id]),
	[course_id] [bigint] NULL,
	[staff_id] [varchar](200) NULL,
	[session_id] [bigint] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[assign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_course](
	[department_id] [bigint] NULL,
	[course_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([course_id]),
	[semester_id] [bigint] NULL,
	[level_id] [bigint] NULL,
	[course_typeID] [bigint] NULL,
	[course_code] [int] NULL,
	[course_title] [varchar](10) NULL,
	[course_name] [varchar](100) NULL,
	[course_ref] [int] NULL,
	[course_unit] [int] NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
	[course_description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_course_registration]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_course_registration](
	[registration_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([registration_id]),
	[course_id] [bigint] NULL,
	[matric_no] [varchar](200) NULL,
	[session_id] [bigint] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_course_type]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_course_type](
	[course_typeID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([course_typeID]),
	[type_ref] [varchar](100) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[course_typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_dean]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dean](
	[staff_id] [varchar](200) NULL,
	[dean_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([dean_id]),
	[dean_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_department]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_department](
	[faculty_id] [bigint] NULL,
	[department_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([department_id]),
	[department_code] [varchar](10) NULL,
	[department_name] [varchar](100) NULL,
	[department_description] [varchar](max) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_dict_tables]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dict_tables](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[panel_id] [varchar](50) NOT NULL,
	[table_name] [varchar](50) NOT NULL,
	[key_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_dict_tables] PRIMARY KEY CLUSTERED 
(
	[panel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_exam_officer]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_exam_officer](
	[staff_id] [varchar](200) NULL,
	[officer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([officer_id]),
	[officer_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_faculty]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_faculty](
	[faculty_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([faculty_id]),
	[faculty_code] [varchar](10) NULL,
	[faculty_name] [varchar](100) NULL,
	[faculty_description] [varchar](max) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_hod]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_hod](
	[staff_id] [varchar](200) NULL,
	[hod_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([hod_id]),
	[hod_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_level]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_level](
	[level_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([level_id]),
	[level_name] [varchar](100) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_program]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_program](
	[department_id] [bigint] NULL,
	[program_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([program_id]),
	[program_title] [varchar](100) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[program_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_registrar]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_registrar](
	[staff_id] [varchar](200) NULL,
	[registrar_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([registrar_id]),
	[registrar_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_result_entry]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_result_entry](
	[entry_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([entry_id]),
	[matric_no] [varchar](200) NULL,
	[course_id] [bigint] NULL,
	[session_id] [bigint] NULL,
	[firstca] [int] NULL,
	[secondca] [int] NULL,
	[thirdca] [int] NULL,
	[exam] [int] NULL,
	[flag_on] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_semester]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_semester](
	[semester_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([semester_id]),
	[semester_name] [varchar](100) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_session]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_session](
	[session_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([session_id]),
	[session_year_from] [varchar](10) NULL,
	[session_year_to] [varchar](10) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_sms]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sms](
	[sms_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([sms_id]),
	[sms_name] [varchar](100) NULL,
	[auth_id] [varchar](200) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[sms_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_staff]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_staff](
	[department_id] [bigint] NULL,
	[staff_id] [varchar](200) NOT NULL,
	[rec_id]  AS ([staff_id]),
	[firstname] [varchar](100) NULL,
	[middlename] [varchar](100) NULL,
	[lastname] [varchar](100) NULL,
	[email] [varchar](200) NULL,
	[telephone_no] [varchar](20) NULL,
	[gender] [varchar](3) NULL,
	[marital_status] [varchar](20) NULL,
	[profile_pic] [varchar](200) NULL,
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
	[title] [varchar](100) NULL,
	[program] [varchar](100) NULL,
	[position] [varchar](100) NULL,
	[staff_description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_student](
	[program_id] [bigint] NULL,
	[level_id] [bigint] NULL,
	[matric_no] [varchar](200) NOT NULL,
	[rec_id]  AS ([matric_no]),
	[firstname] [varchar](100) NULL,
	[middlename] [varchar](100) NULL,
	[lastname] [varchar](100) NULL,
	[email] [varchar](200) NULL,
	[telephone_no] [varchar](20) NULL,
	[gender] [varchar](3) NULL,
	[marital_status] [varchar](20) NULL,
	[profile_pic] [varchar](200) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[matric_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user_log]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user_log](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[log_url] [varchar](250) NOT NULL,
	[log_date] [date] NULL DEFAULT (getdate()),
	[log_time] [time](7) NULL DEFAULT (getdate()),
	[log_sql] [text] NULL,
	[log_desc] [text] NULL,
 CONSTRAINT [PK_tbl_user_log] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_usermanagement]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usermanagement](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([UserID]),
	[username] [varchar](100) NULL,
	[user_password] [varchar](100) NULL,
	[vice] [varchar](10) NULL DEFAULT ('0'),
	[exam_officer] [varchar](10) NULL DEFAULT ('0'),
	[lecturer] [varchar](10) NULL DEFAULT ('0'),
	[hod] [varchar](10) NULL DEFAULT ('0'),
	[administrator] [varchar](10) NULL DEFAULT ('0'),
	[dean] [varchar](10) NULL DEFAULT ('0'),
	[created_date] [date] NULL DEFAULT (getdate()),
	[created_time] [time](7) NULL DEFAULT (getdate()),
	[staff_id] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_vice]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_vice](
	[staff_id] [varchar](200) NULL,
	[vice_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([vice_id]),
	[vice_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[qry_assign_course]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_assign_course] as select distinct a.rec_id as [RecID], dp.department_id as [DepartmentID], dp.department_name as [Department], 
co.course_id as [CourseID], le.level_id as [LevelID], le.level_name as [Level], se.session_id as [SessionID], se.session_year_from + '/' + se.session_year_to as [Session],
sem.semester_id as [SemesterID], sem.semester_name as [Semester]
, co.course_title +  convert(varchar, co.course_code) as [Course Code], co.course_name as [Course], 
st.staff_id as [StaffID], st.title + ' ' + st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], a.created_date as [Created Date], a.created_time as [Created Time] from tbl_assign_course a
join tbl_course co on co.course_id=a.course_id
join tbl_department dp on dp.department_id=co.department_id
join tbl_staff st on st.staff_id=a.staff_id
join tbl_session se on se.session_id=a.session_id
join tbl_level le on le.level_id=co.level_id
join tbl_semester sem on sem.semester_id=co.semester_id

GO
/****** Object:  View [dbo].[qry_course]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_course] as SELECT DISTINCT row_number() OVER (ORDER BY co.rec_id) AS RowNumber, co.rec_id AS [RecID], dp.department_id AS [DepartmentID], dp.department_name AS [Department], se.semester_id AS [SemesterID], 
se.semester_name AS [Semester], le.level_id AS [LevelID], le.level_name AS [Level], co.course_typeID as [TypeID], co.course_name AS [Course], co.course_title + CONVERT(varchar, co.course_code) AS [CourseCode], co.course_unit AS [CourseUnit], 
tp.type_ref AS [Course Type], co.course_ref AS [Course Check], co.course_description AS [Description], co.created_date AS [Created Date], co.created_time AS [Created Time]
FROM            tbl_course co JOIN
                         tbl_department dp ON dp.department_id = co.department_id JOIN
                         tbl_semester se ON se.semester_id = co.semester_id JOIN
                         tbl_level le ON le.level_id = co.level_id JOIN
                         tbl_course_type tp ON tp.course_typeID = co.course_typeID

GO
/****** Object:  View [dbo].[qry_course_registration]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_course_registration] as SELECT distinct        reg.rec_id AS RecID, dp.department_id AS DepartmentID, dp.department_name AS Department, se.session_id AS SessionID, se.session_year_from + '/' + se.session_year_to AS Session, sem.semester_id AS SemesterID, 
                         sem.semester_name AS Semester, le.level_id AS LevelID, le.level_name AS LevelName, st.matric_no AS MatricNo, st.firstname + ' ' + st.middlename + ' ' + st.lastname AS [Student Names], co.course_id AS CourseID, 
                         co.course_name AS [Course Name], co.course_title + CONVERT(varchar, co.course_code) AS [Course Code], co.course_unit AS [Course Unit], reg.created_date AS [Created Date], reg.created_time AS [Created Time]
FROM            dbo.tbl_course_registration AS reg INNER JOIN
                         dbo.tbl_student AS st ON st.matric_no = reg.matric_no INNER JOIN
                         dbo.tbl_session AS se ON se.session_id = reg.session_id INNER JOIN
                         dbo.tbl_course AS co ON co.course_id = reg.course_id INNER JOIN
                         dbo.tbl_department AS dp ON dp.department_id = co.department_id INNER JOIN
                         dbo.tbl_level AS le ON le.level_id = co.level_id INNER JOIN
                         dbo.tbl_semester AS sem ON sem.semester_id = co.semester_id
GO
/****** Object:  View [dbo].[qry_DepartmentByFaculty]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_DepartmentByFaculty] as select distinct dp.rec_id as [RecID], fa.faculty_id as [FacultyID], fa.faculty_name as [Faculty] , dp.department_name as [Department], dp.department_code as [Department Code], dp.department_description as [Description], dp.created_date as [Created Date], dp.created_time as [Created Time] from tbl_department dp
join tbl_faculty fa on fa.faculty_id=dp.faculty_id
GO
/****** Object:  View [dbo].[qry_identity]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_identity] AS SELECT U.staff_id AS [User],s.position as [Position],s.title + '  ' +  s.firstname + ' ' + s.middlename + ' ' + s.lastname as [Name], s.email as [Email], s.profile_pic as [Pic] FROM tbl_usermanagement u
join tbl_staff s on s.staff_id=u.staff_id
GO
/****** Object:  View [dbo].[qry_Sms]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_Sms] as select rec_id as [RecID], sms_name as [SMS Name], auth_id as [Authentication ID], created_date as [Created Date], created_time as [Created Time] from tbl_sms
GO
/****** Object:  View [dbo].[qry_staff]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_staff] as SELECT distinct       dp.department_id AS DepartmentID, st.staff_id AS StaffID, st.rec_id AS RecID, st.title + ' ' + st.firstname + ' ' + st.middlename + ' ' + st.lastname AS [Staff Name], st.email, st.telephone_no AS [Telephone No.], st.gender, 
                         st.marital_status AS [Marital Status], st.profile_pic AS Pic, st.position, st.created_date AS [Created Date], st.created_time AS [Created Time]
FROM            dbo.tbl_staff AS st INNER JOIN
                         dbo.tbl_department AS dp ON dp.department_id = st.department_id
GO
/****** Object:  View [dbo].[qry_student]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_student] as SELECT distinct       st.rec_id AS RecID, pg.program_id AS ProgramID, pg.program_title AS Program, le.level_id AS [Level], le.level_name AS [Level Name], st.firstname + ' ' + st.middlename + ' ' + st.lastname AS [Student Names], st.email, 
                         st.telephone_no AS [Telephone No.], st.gender, st.marital_status AS [Marital Status], st.profile_pic AS Pic, st.created_date AS [Created Date], st.created_time AS [Created Time]
FROM            dbo.tbl_student AS st INNER JOIN
                         dbo.tbl_program AS pg ON pg.program_id = st.program_id INNER JOIN
                         dbo.tbl_level AS le ON le.level_id = st.level_id
GO
SET IDENTITY_INSERT [dbo].[tbl_course] ON 

INSERT [dbo].[tbl_course] ([department_id], [course_id], [semester_id], [level_id], [course_typeID], [course_code], [course_title], [course_name], [course_ref], [course_unit], [created_date], [created_time], [course_description]) VALUES (1, 1, 1, 2, 1, 219, N'CSC', N'Artificial Intelligence', 219, 2, CAST(N'2021-03-18' AS Date), CAST(N'16:56:23.5300000' AS Time), NULL)
INSERT [dbo].[tbl_course] ([department_id], [course_id], [semester_id], [level_id], [course_typeID], [course_code], [course_title], [course_name], [course_ref], [course_unit], [created_date], [created_time], [course_description]) VALUES (1, 2, 1, 2, 1, 207, N'CSC', N'Natural Language Processing', 219, 2, CAST(N'2021-03-18' AS Date), CAST(N'16:56:47.0430000' AS Time), NULL)
SET IDENTITY_INSERT [dbo].[tbl_course] OFF
SET IDENTITY_INSERT [dbo].[tbl_course_type] ON 

INSERT [dbo].[tbl_course_type] ([course_typeID], [type_ref], [created_date], [created_time]) VALUES (1, N'Core', CAST(N'2021-03-18' AS Date), CAST(N'16:46:58.2570000' AS Time))
INSERT [dbo].[tbl_course_type] ([course_typeID], [type_ref], [created_date], [created_time]) VALUES (2, N'Mandatory', CAST(N'2021-03-18' AS Date), CAST(N'16:47:11.5830000' AS Time))
INSERT [dbo].[tbl_course_type] ([course_typeID], [type_ref], [created_date], [created_time]) VALUES (3, N'Elective', CAST(N'2021-03-18' AS Date), CAST(N'16:47:19.4300000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_course_type] OFF
SET IDENTITY_INSERT [dbo].[tbl_department] ON 

INSERT [dbo].[tbl_department] ([faculty_id], [department_id], [department_code], [department_name], [department_description], [created_date], [created_time]) VALUES (1, 1, N'CSC', N'Computer Science and Information Technology', N'Computer and Information Technology comprises of software computing,, Numerical Analysis, data science, Artificial Intelligence, Intelligent Game Programming , Computer Human Interaction, Statistics', CAST(N'2021-03-18' AS Date), CAST(N'11:22:45.8970000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_department] OFF
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] ON 

INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (50026, N'PnlCourse', N'tbl_course', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (40027, N'PnlDepartment', N'tbl_department', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (40026, N'PnlFaculty', N'tbl_faculty', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (40030, N'PnlLevel', N'tbl_level', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (40028, N'PnlProgram', N'tbl_program', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (40029, N'PnlSemester', N'tbl_semester', N'rec_id')
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] OFF
SET IDENTITY_INSERT [dbo].[tbl_faculty] ON 

INSERT [dbo].[tbl_faculty] ([faculty_id], [faculty_code], [faculty_name], [faculty_description], [created_date], [created_time]) VALUES (1, N'NAS', N'Natural and Applied Science', N'Natural and Applied Sciences comprises of Computer science and Information Technology, Applied Physics, Applied Mathematics, Microbiology, Biochemistry', CAST(N'2021-03-18' AS Date), CAST(N'10:44:31.8330000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_faculty] OFF
SET IDENTITY_INSERT [dbo].[tbl_level] ON 

INSERT [dbo].[tbl_level] ([level_id], [level_name], [created_date], [created_time]) VALUES (1, N'100', CAST(N'2021-03-18' AS Date), CAST(N'16:11:20.9670000' AS Time))
INSERT [dbo].[tbl_level] ([level_id], [level_name], [created_date], [created_time]) VALUES (2, N'200', CAST(N'2021-03-18' AS Date), CAST(N'16:11:40.1830000' AS Time))
INSERT [dbo].[tbl_level] ([level_id], [level_name], [created_date], [created_time]) VALUES (3, N'300', CAST(N'2021-03-18' AS Date), CAST(N'16:11:56.4830000' AS Time))
INSERT [dbo].[tbl_level] ([level_id], [level_name], [created_date], [created_time]) VALUES (4, N'400', CAST(N'2021-03-18' AS Date), CAST(N'16:12:08.6870000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_level] OFF
SET IDENTITY_INSERT [dbo].[tbl_program] ON 

INSERT [dbo].[tbl_program] ([department_id], [program_id], [program_title], [created_date], [created_time]) VALUES (1, 1, N'B.Sc Computer and Information Technology', CAST(N'2021-03-18' AS Date), CAST(N'11:48:04.6700000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_program] OFF
SET IDENTITY_INSERT [dbo].[tbl_semester] ON 

INSERT [dbo].[tbl_semester] ([semester_id], [semester_name], [created_date], [created_time]) VALUES (1, N'1ST SEMESTER', CAST(N'2021-03-18' AS Date), CAST(N'16:03:28.6630000' AS Time))
INSERT [dbo].[tbl_semester] ([semester_id], [semester_name], [created_date], [created_time]) VALUES (3, N'2ND SEMESTER', CAST(N'2021-03-23' AS Date), CAST(N'14:51:47.5000000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_semester] OFF
INSERT [dbo].[tbl_staff] ([department_id], [staff_id], [firstname], [middlename], [lastname], [email], [telephone_no], [gender], [marital_status], [profile_pic], [created_date], [created_time], [title], [program], [position], [staff_description]) VALUES (NULL, N'AT772', N'NWAUKWA', N'CHINEDU', N'JOHNWENDY', N'JOHNWENDYEZEALA@GMAIL.COM', N'07031268439', N'M', N'MARRIED', N'img/john1.jpg', CAST(N'2021-03-23' AS Date), CAST(N'11:30:02.6900000' AS Time), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_user_log] ON 

INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443109, N'AT772', N'http://localhost:1074/Faculty', CAST(N'2021-03-23' AS Date), CAST(N'13:06:43.0930000' AS Time), N'f OPERATION: RECID = ; FACULTYCODE = Humanity; FACULTYNAME = Humanity; FACULTYDESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443110, N'AT772', N'http://localhost:1074/Faculty', CAST(N'2021-03-23' AS Date), CAST(N'14:10:28.8370000' AS Time), N'f OPERATION: RECID = ; FACULTYCODE = ddddd; FACULTYNAME = Humanity; FACULTYDESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443111, N'AT772', N'http://localhost:1074/Faculty', CAST(N'2021-03-23' AS Date), CAST(N'14:10:37.6570000' AS Time), N'DELETE OPERATION: REC_ID = 3; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443112, N'AT772', N'http://localhost:1074/Faculty', CAST(N'2021-03-23' AS Date), CAST(N'14:11:51.9630000' AS Time), N'DELETE OPERATION: REC_ID = 2; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443113, N'AT772', N'http://localhost:1074/Semester', CAST(N'2021-03-23' AS Date), CAST(N'14:50:21' AS Time), N'DELETE OPERATION: REC_ID = 2; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443114, N'AT772', N'http://localhost:1074/Semester', CAST(N'2021-03-23' AS Date), CAST(N'14:50:42.1970000' AS Time), N'f OPERATION: RECID = 1; SEMESTERNAME = 1ST SEMESTER; STATEMENTTYPE = UPDATE; ', N'')
INSERT [dbo].[tbl_user_log] ([rec_id], [user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc]) VALUES (443115, N'AT772', N'http://localhost:1074/Semester', CAST(N'2021-03-23' AS Date), CAST(N'14:51:47.6470000' AS Time), N'f OPERATION: RECID = ; SEMESTERNAME = 2ND SEMESTER; STATEMENTTYPE = INSERT; ', N'')
SET IDENTITY_INSERT [dbo].[tbl_user_log] OFF
SET IDENTITY_INSERT [dbo].[tbl_usermanagement] ON 

INSERT [dbo].[tbl_usermanagement] ([UserID], [username], [user_password], [vice], [exam_officer], [lecturer], [hod], [administrator], [dean], [created_date], [created_time], [staff_id]) VALUES (1, N'admin', N'welcome', N'0', N'0', N'0', N'0', N'1', N'0', CAST(N'2021-03-23' AS Date), CAST(N'11:02:15.1870000' AS Time), N'AT772')
SET IDENTITY_INSERT [dbo].[tbl_usermanagement] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_staf__8A7656FCDD1C3632]    Script Date: 24/03/2021 4:51:47 PM ******/
ALTER TABLE [dbo].[tbl_staff] ADD UNIQUE NONCLUSTERED 
(
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_staf__AB6E6164B14ABBAC]    Script Date: 24/03/2021 4:51:47 PM ******/
ALTER TABLE [dbo].[tbl_staff] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_stud__8A7656FC30458937]    Script Date: 24/03/2021 4:51:47 PM ******/
ALTER TABLE [dbo].[tbl_student] ADD UNIQUE NONCLUSTERED 
(
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_stud__AB6E6164A7E0040C]    Script Date: 24/03/2021 4:51:47 PM ******/
ALTER TABLE [dbo].[tbl_student] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_user__F3DBC57227893280]    Script Date: 24/03/2021 4:51:47 PM ******/
ALTER TABLE [dbo].[tbl_usermanagement] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_assign_course] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_assign_course] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_dean] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_dean] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_exam_officer] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_exam_officer] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_hod] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_hod] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_registrar] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_registrar] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_result_entry] ADD  DEFAULT ((1)) FOR [flag_on]
GO
ALTER TABLE [dbo].[tbl_result_entry] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_result_entry] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_session] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_session] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_sms] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_sms] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_student] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_student] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_vice] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_vice] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_assign_course]  WITH CHECK ADD  CONSTRAINT [assigncourse_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_assign_course] CHECK CONSTRAINT [assigncourse_course]
GO
ALTER TABLE [dbo].[tbl_assign_course]  WITH CHECK ADD  CONSTRAINT [assigncourse_session] FOREIGN KEY([session_id])
REFERENCES [dbo].[tbl_session] ([session_id])
GO
ALTER TABLE [dbo].[tbl_assign_course] CHECK CONSTRAINT [assigncourse_session]
GO
ALTER TABLE [dbo].[tbl_assign_course]  WITH CHECK ADD  CONSTRAINT [assigncourse_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_assign_course] CHECK CONSTRAINT [assigncourse_staff]
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD  CONSTRAINT [course_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[tbl_department] ([department_id])
GO
ALTER TABLE [dbo].[tbl_course] CHECK CONSTRAINT [course_department]
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD  CONSTRAINT [course_level] FOREIGN KEY([level_id])
REFERENCES [dbo].[tbl_level] ([level_id])
GO
ALTER TABLE [dbo].[tbl_course] CHECK CONSTRAINT [course_level]
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD  CONSTRAINT [course_semester] FOREIGN KEY([semester_id])
REFERENCES [dbo].[tbl_semester] ([semester_id])
GO
ALTER TABLE [dbo].[tbl_course] CHECK CONSTRAINT [course_semester]
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD  CONSTRAINT [course_typeID] FOREIGN KEY([course_typeID])
REFERENCES [dbo].[tbl_course_type] ([course_typeID])
GO
ALTER TABLE [dbo].[tbl_course] CHECK CONSTRAINT [course_typeID]
GO
ALTER TABLE [dbo].[tbl_course_registration]  WITH CHECK ADD  CONSTRAINT [fkCourseReg_courseID] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_course_registration] CHECK CONSTRAINT [fkCourseReg_courseID]
GO
ALTER TABLE [dbo].[tbl_course_registration]  WITH CHECK ADD  CONSTRAINT [fkCourseReg_matricNo] FOREIGN KEY([matric_no])
REFERENCES [dbo].[tbl_student] ([matric_no])
GO
ALTER TABLE [dbo].[tbl_course_registration] CHECK CONSTRAINT [fkCourseReg_matricNo]
GO
ALTER TABLE [dbo].[tbl_course_registration]  WITH CHECK ADD  CONSTRAINT [fkCourseReg_sessionID] FOREIGN KEY([session_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_course_registration] CHECK CONSTRAINT [fkCourseReg_sessionID]
GO
ALTER TABLE [dbo].[tbl_dean]  WITH CHECK ADD  CONSTRAINT [dean_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_dean] CHECK CONSTRAINT [dean_staff]
GO
ALTER TABLE [dbo].[tbl_department]  WITH CHECK ADD  CONSTRAINT [department_Faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[tbl_faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[tbl_department] CHECK CONSTRAINT [department_Faculty]
GO
ALTER TABLE [dbo].[tbl_exam_officer]  WITH CHECK ADD  CONSTRAINT [officer_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_exam_officer] CHECK CONSTRAINT [officer_staff]
GO
ALTER TABLE [dbo].[tbl_hod]  WITH CHECK ADD  CONSTRAINT [hod_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_hod] CHECK CONSTRAINT [hod_staff]
GO
ALTER TABLE [dbo].[tbl_program]  WITH CHECK ADD  CONSTRAINT [program_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[tbl_department] ([department_id])
GO
ALTER TABLE [dbo].[tbl_program] CHECK CONSTRAINT [program_department]
GO
ALTER TABLE [dbo].[tbl_registrar]  WITH CHECK ADD  CONSTRAINT [registrar_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_registrar] CHECK CONSTRAINT [registrar_staff]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkResultEntry_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_result_entry] CHECK CONSTRAINT [fkResultEntry_course]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkResultEntry_matricno] FOREIGN KEY([matric_no])
REFERENCES [dbo].[tbl_student] ([matric_no])
GO
ALTER TABLE [dbo].[tbl_result_entry] CHECK CONSTRAINT [fkResultEntry_matricno]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkResultEntry_session] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_session] ([session_id])
GO
ALTER TABLE [dbo].[tbl_result_entry] CHECK CONSTRAINT [fkResultEntry_session]
GO
ALTER TABLE [dbo].[tbl_staff]  WITH CHECK ADD  CONSTRAINT [staff_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[tbl_department] ([department_id])
GO
ALTER TABLE [dbo].[tbl_staff] CHECK CONSTRAINT [staff_department]
GO
ALTER TABLE [dbo].[tbl_student]  WITH CHECK ADD  CONSTRAINT [student_level] FOREIGN KEY([level_id])
REFERENCES [dbo].[tbl_level] ([level_id])
GO
ALTER TABLE [dbo].[tbl_student] CHECK CONSTRAINT [student_level]
GO
ALTER TABLE [dbo].[tbl_student]  WITH CHECK ADD  CONSTRAINT [student_program] FOREIGN KEY([program_id])
REFERENCES [dbo].[tbl_program] ([program_id])
GO
ALTER TABLE [dbo].[tbl_student] CHECK CONSTRAINT [student_program]
GO
ALTER TABLE [dbo].[tbl_usermanagement]  WITH CHECK ADD  CONSTRAINT [fk_userStaff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_usermanagement] CHECK CONSTRAINT [fk_userStaff]
GO
ALTER TABLE [dbo].[tbl_vice]  WITH CHECK ADD  CONSTRAINT [vice_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_vice] CHECK CONSTRAINT [vice_staff]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD CHECK  (([firstca]<=(10)))
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD CHECK  (([secondca]<=(10)))
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD CHECK  (([thirdca]<=(10)))
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD CHECK  (([exam]<=(70)))
GO
ALTER TABLE [dbo].[tbl_staff]  WITH CHECK ADD CHECK  (([gender]='M' OR [gender]='F'))
GO
ALTER TABLE [dbo].[tbl_staff]  WITH CHECK ADD CHECK  (([marital_status]='SINGLE' OR [marital_status]='MARRIED'))
GO
ALTER TABLE [dbo].[tbl_student]  WITH CHECK ADD CHECK  (([gender]='M' OR [gender]='F'))
GO
ALTER TABLE [dbo].[tbl_student]  WITH CHECK ADD CHECK  (([marital_status]='SINGLE' OR [marital_status]='MARRIED'))
GO
/****** Object:  StoredProcedure [dbo].[functionCourse]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionCourse](@RecID VARCHAR(200), @DepartmentID varchar(200),@SemesterID varchar(200), @LevelID varchar(200),@CourseTypeID varchar(100), @CourseCode varchar(10), @CourseTitle varchar(100), @CourseName varchar(200), @CourseRef varchar(10), @CourseUnit varchar(100), @CourseDescription varchar(max), @StatementType varchar(200)='')
as begin

if @StatementType='INSERT'
begin
insert into tbl_course ( department_id ,semester_id , level_id ,course_typeID , course_code, course_title, course_name, course_ref, course_unit, course_description) values ( @DepartmentID ,@SemesterID , @LevelID ,@CourseTypeID , @CourseCode, @CourseTitle, @CourseName, @CourseRef, @CourseUnit, @CourseDescription)
end
if @StatementType='UPDATE'
begin
UPDATE tbl_course SET department_id =@DepartmentID ,semester_id=@SemesterID , level_id=@LevelID ,course_typeID=@CourseTypeID , course_code=@CourseCode, course_title=@CourseTitle, course_name=@CourseName, course_ref=@CourseRef, course_unit=@CourseUnit, course_description= @CourseDescription WHERE rec_id=@RecID
end
if @StatementType='DELETE'
begin
delete from tbl_course where rec_id= @RecID
end

end

GO
/****** Object:  StoredProcedure [dbo].[functionCourseAssign]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionCourseAssign](@RecID varchar(100), @CourseID varchar(100), @StaffID varchar(200), @SessionID varchar(200), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
BEGIN
insert into tbl_assign_course(course_id,  staff_id, session_id) values (@CourseID, @StaffID, @SessionID)
END
if @StatementType='UPDATE'
BEGIN
update tbl_assign_course set course_id=@CourseID,  staff_id=@StaffID, session_id=@SessionID where rec_id=@RecID
END
end
GO
/****** Object:  StoredProcedure [dbo].[functionCourseRegistration]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionCourseRegistration](@RecID varchar(100), @CourseID varchar(100), @MatricNo varchar(200), @SessionID varchar(100), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_course_registration (course_id, matric_no, session_id) values (@CourseID, @MatricNo, @SessionID)
end
if @StatementType='UPDATE'
begin
UPDATE tbl_course_registration SET course_id=@CourseID, matric_no=@MatricNo, session_id=@SessionID WHERE rec_id=@RecID
end
end

GO
/****** Object:  StoredProcedure [dbo].[functionCourseType]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionCourseType] (@RecID varchar(100), @TypeRef varchar(200), @StatementType varchar(200)='') as 
begin
if @StatementType='INSERT'
begin
insert into tbl_course_type (type_ref) values (@TypeRef)

end
if @StatementType='UPDATE'
begin
UPDATE tbl_course_type  set type_ref=@TypeRef where rec_id=@RecID

end
if @StatementType='DELETE'
begin
DELETE FROM tbl_course_type where rec_id=@RecID

end
end
GO
/****** Object:  StoredProcedure [dbo].[functionDepartment]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionDepartment] (@RecID varchar(100), @FacultyID varchar(100), @DepartmentName varchar(100), @DepartmentCode varchar(100), @DepartmentDescription varchar(max), @StatementType varchar(100)='')
as
BEGIN
if @StatementType='INSERT'
BEGIN
insert into tbl_department (faculty_id, department_name, department_code, department_description) values (@FacultyID, @DepartmentName, @DepartmentCode, @DepartmentDescription)
END
if @StatementType='UPDATE'
BEGIN
update tbl_department set faculty_id=@FacultyID, department_name=@DepartmentName, department_code=@DepartmentCode, department_description=@DepartmentDescription where rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[FunctionFaculty]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FunctionFaculty](@RecID varchar(100), @FacultyCode varchar(200), @FacultyName varchar(200), @FacultyDescription varchar(max), @StatementType varchar(100)='')
as
BEGIN
if @StatementType='INSERT'
BEGIN
insert into tbl_faculty(faculty_code, faculty_name, faculty_description) values(@FacultyCode, @FacultyName, @FacultyDescription)
END
if @StatementType='UPDATE'
BEGIN
update tbl_faculty set faculty_code=@FacultyCode, faculty_name=@FacultyName, faculty_description=@FacultyDescription where rec_id=@RecID
END
if @StatementType='DELETE'
BEGIN
delete from tbl_faculty where rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionLevel]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionLevel](@RecID varchar(100), @levelName varchar(200), @StatementType varchar(200)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_level(level_name) values(@levelName)
end
if @StatementType='UPDATE'
begin
update tbl_level set level_name=@levelName where rec_id=@RecID
end
if @StatementType='DELETE'
begin
DELETE from tbl_level where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[FunctionProgram]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FunctionProgram](@RecID VARCHAR(100), @departmentID varchar(200), @programTitle varchar(200), @StatementType varchar(100)='') as 
begin
if @StatementType='INSERT'
BEGIN
insert into tbl_program (department_id, program_title) values (@departmentID, @programTitle)
END
if @StatementType='UPDATE'
BEGIN
update tbl_program set department_id=@departmentID, program_title=@programTitle where rec_id=@RecID
END
if @StatementType='DELETE'
BEGIN
delete from tbl_program where rec_id=@RecID
END
end
GO
/****** Object:  StoredProcedure [dbo].[FunctionSemester]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FunctionSemester] (@RecID VARCHAR(100), @semesterName varchar(200), @statementType varchar(200)='')
as
begin
if @statementType='INSERT'
begin
insert into tbl_semester(semester_name) values (@semesterName)
end
if @statementType='UPDATE'
begin
update tbl_semester set semester_name=@semesterName where rec_id=@RecID
end
if @statementType='DELETE'
begin
DELETE from tbl_semester where rec_id=@RecID
end

end
GO
/****** Object:  StoredProcedure [dbo].[functionSms]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionSms](@RecID varchar(100), @SmsName varchar(100), @AuthID varchar(200), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_sms (sms_name, auth_id) values (@SmsName, @AuthID)
end
if @StatementType='UPDATE'
begin
UPDATE  tbl_sms SET sms_name=@SmsName, auth_id=@AuthID WHERE rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[functionStaff]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionStaff](@RecID varchar(100),@DepartmentID varchar(200), @StaffID varchar(100), @Firstname varchar(100),@MiddleName varchar(100), @LastName varchar(100),@Email varchar(100), @TelephoneNo varchar(20), @Gender varchar(20), @MaritalStatus varchar(20), @Description varchar(max), @Title varchar(200), @Position varchar(100), @ProfilePic varchar(200), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_staff(department_id, staff_id,firstname, middlename, lastname,email, Telephone_no, gender, marital_status, staff_description, title, position, profile_pic) values (@DepartmentID, @StaffID, @Firstname,@MiddleName, @LastName,@Email, @TelephoneNo, @Gender, @MaritalStatus, @Description, @Title, @Position, @ProfilePic)
end
if @StatementType='UPDATE'
begin
update tbl_staff set department_id=@DepartmentID, staff_id=@StaffID,firstname=@Firstname, middlename=@MiddleName, lastname=@LastName,email=@Email, Telephone_no=@TelephoneNo, gender=@Gender, marital_status=@MaritalStatus, staff_description=@Description, title=@Title, position=@Position, profile_pic=@ProfilePic where rec_id=@RecID
end
if @StatementType='DELETE'
begin
delete from tbl_staff where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[functionStudent]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionStudent]
(@RecID varchar(10), @ProgramID varchar(100), @LevelID varchar(100), @MatricNo varchar(100),
@FirstName varchar(100),@MiddleName varchar(100), @LastName varchar(100),
@Email varchar(100), @TelephoneNo varchar(30), @Gender varchar(20), @MaritalStatus varchar(100),
@ProfilePic varchar(100), @StatementType varchar(100)) as 
BEGIN
IF @StatementType='INSERT'
BEGIN
insert into tbl_student (program_id, level_id, matric_no, firstname, middlename, lastname, email, telephone_no, gender, marital_status, profile_pic) values (@ProgramID, @LevelID, @MatricNo, @FirstName, @MiddleName, @LastName, @Email, @TelephoneNo, @Gender, @MaritalStatus, @ProfilePic)
END
IF @StatementType='UPDATE'
BEGIN
UPDATE tbl_student SET program_id=@ProgramID, level_id=@LevelID, matric_no=@MatricNo, firstname=@FirstName, middlename=@MiddleName, lastname=@LastName, email=@Email, telephone_no=@TelephoneNo, gender=@Gender, marital_status=@MaritalStatus, profile_pic=@ProfilePic where rec_id=@RecID
END

END

GO
/****** Object:  StoredProcedure [dbo].[functionUserManagement]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionUserManagement](@RecID varchar(100), @Username varchar(100), @UserPassword varchar(100), @Vice varchar(10), @ExamOfficer varchar(10), @Lecturer varchar(10), @Hod varchar(10), @Administrator varchar(10), @Dean varchar(10), @StatementType varchar(100)='') as 
begin
if @StatementType='INSERT'
begin
insert into tbl_usermanagement (username, user_password, vice, exam_officer, lecturer, hod, administrator, dean) values(@Username, @UserPassword, @Vice, @ExamOfficer, @Lecturer, @Hod, @Administrator, @Dean)
end
if @StatementType='UPDATE'
begin
UPDATE tbl_usermanagement SET username=@Username, user_password=@UserPassword, vice=@Vice, exam_officer=@ExamOfficer, lecturer=@Lecturer, hod=@Hod, administrator=@Administrator, dean=@Dean WHERE rec_id=@RecID
end

end
GO
/****** Object:  StoredProcedure [dbo].[functionVice]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[functionVice](@RecID varchar(100), @StaffID varchar(100), @ViceSignature varchar(100), @Active varchar(10), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_vice(staff_id, vice_signature, active) values (@StaffID, @ViceSignature, @Active)
end
if @StatementType='UPDATE'
begin
UPDATE  tbl_vice SET staff_id=@StaffID, vice_signature=@ViceSignature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetAuditTrail]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAuditTrail] (@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_user_log;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], user_name as [UserName], log_url as [Log Url], log_date as [Log Date], log_time as [Log Time], log_sql as [Log SQL], log_desc as [Log Description]  from tbl_user_log
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end

GO
/****** Object:  StoredProcedure [dbo].[GetCourse]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCourse] (@StartIndex int, @PageSize int, @TotalCount int output, @DepartmentSearch int, @LevelSearch int, @SemesterSearch int, @CourseTypeSearch int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_course;
if @DepartmentSearch=0
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description], [Created Date], [Created Time] from qry_course
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
else if @DepartmentSearch !=0 AND @LevelSearch=0 AND @SemesterSearch=0 AND @CourseTypeSearch=0
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], 
Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description],
[Created Date], [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
else if  @LevelSearch !=0 AND @SemesterSearch=0 AND @CourseTypeSearch=0
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], 
Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description],
[Created Date], [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
else if   @SemesterSearch !=0 AND @CourseTypeSearch=0
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], 
Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description],
[Created Date], [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
else IF @CourseTypeSearch !=0
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], 
Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description],
[Created Date], [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch AND TypeID=@CourseTypeSearch
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
else 
begin
with CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber, RecID, Department, Semester, [Level], 
Course, CourseCode as [Course Code], CourseUnit as [Course Unit], [Course Type], [Course Check], [Description],
[Created Date], [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch AND TypeID=@CourseTypeSearch
)
SELECT * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end

END


GO
/****** Object:  StoredProcedure [dbo].[getCourseRegistration]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCourseRegistration](@StartIndex int, @PageSize int, @TotalCount int output, @DepartmentSearch varchar(100), @SessionSearch varchar(100), @LevelSearch varchar(100), @SemesterSearch varchar(100), @CourseSearch varchar(100)) as
BEGIN
select @TotalCount=count(1) from qry_course_registration;
if @DepartmentSearch=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] from qry_course_registration
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if @DepartmentSearch != 0 AND @CourseSearch= 0  AND @SessionSearch = 0 AND @LevelSearch = 0 AND @SemesterSearch=0
BEGIN 
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
END
else if  @CourseSearch != 0  AND @SessionSearch = 0 AND @LevelSearch = 0 AND @SemesterSearch=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch AND CourseID=@CourseSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if   @SessionSearch != 0 AND @LevelSearch = 0 AND @SemesterSearch=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch AND CourseID=@CourseSearch AND SessionID=@SessionSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if   @LevelSearch != 0 AND @SemesterSearch=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch AND CourseID=@CourseSearch AND SessionID=@SessionSearch AND LevelID=@LevelSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if   @SemesterSearch !=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch AND CourseID=@CourseSearch AND SessionID=@SessionSearch AND LevelID=@LevelSearch AND SemesterID=@SemesterSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE DepartmentID=@DepartmentSearch AND CourseID=@CourseSearch AND SessionID=@SessionSearch AND LevelID=@LevelSearch AND SemesterID=@SemesterSearch
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
END






GO
/****** Object:  StoredProcedure [dbo].[GetCourseType]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCourseType](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_course_type;
with CTE as 
(
select top(@StartIndex + @PageSize-1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], type_ref as [Course Type], created_date as [Created Date], created_time as [Created Time] from tbl_course_type
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)

end

GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDepartment](@StartIndex int, @PageSize int,  @FacultySearch int ,@TotalCount int output)
as
BEGIN

 if @FacultySearch =0
 BEGIN
 Select @TotalCount=count(1) from qry_DepartmentByFaculty;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber,RecID, Faculty, Department, [Department Code], [Description], [Created Date], [Created Time] from qry_DepartmentByFaculty
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)
END

else
BEGIN
 Select @TotalCount=count(1) from qry_DepartmentByFaculty;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Faculty, Department, [Department Code], [Description], [Created Date], [Created Time] from qry_DepartmentByFaculty where FacultyID=@FacultySearch
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)
END
END

GO
/****** Object:  StoredProcedure [dbo].[GetFaculty]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFaculty](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_faculty;
WITH CTE AS 
(
select top(@StartIndex + @PageSize-1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID],faculty_name as [Faculty], faculty_code as [Faculty Code], faculty_description as [Description], created_date as [Created Date], created_time as [Created Time] from tbl_faculty
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)
end

GO
/****** Object:  StoredProcedure [dbo].[GetLevel]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetLevel](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_level;
with CTE as
(
select top(@StartIndex + @PageSize -1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], level_name as [Level], created_date as [Created Date], created_time as [Created Time] from tbl_level
)
select * from CTE where RowNumber between @StartIndex and (@startIndex + @PageSize-1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetProgram]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetProgram] (@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_program;
if @Search=0
begin
WITH CTE as 

(
select top(@StartIndex + @PageSize-1) row_number() over (order by p.rec_id) as RowNumber, p.rec_id as [RecID], d.department_name as [Department], p.program_title as [Program], p.created_date as [Created Date], p.created_time as [Created Time]  from tbl_program p
join tbl_department d on d.department_id=p.department_id

)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex+ @PageSize-1)
end
else
begin
WITH CTE as 

(
select top(@StartIndex + @PageSize-1) row_number() over (order by p.rec_id) as RowNumber, p.rec_id as [RecID], d.department_name as [Department], p.program_title as [Program], p.created_date as [Created Date], p.created_time as [Created Time]  from tbl_program p
join tbl_department d on d.department_id=p.department_id where p.department_id=@Search

)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex+ @PageSize-1)
end


end


GO
/****** Object:  StoredProcedure [dbo].[GetSemester]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSemester](@StartIndex int, @PageSize int, @TotalCount int output) as
begin
select @TotalCount=count(1) from tbl_semester;
with CTE as
(
select top(@StartIndex + @PageSize-1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], semester_name as [Semester], created_date as [Created Date], created_time as [Created Time] from tbl_semester
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)

end
GO
/****** Object:  StoredProcedure [dbo].[GetSms]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSms](@StartIndex int, @PageSize int, @TotalCount int output) as
BEGIN
select @TotalCount =count(1) from qry_sms;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, [SMS Name], [Authentication ID], [Created Date], [Created Time] from qry_sms
)
SELECT * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetStudent]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetStudent](@StartIndex int, @PageSize int, @TotalCount int output, @ProgramSearch varchar, @LevelSearch varchar) as 
BEGIN
SELECT @TotalCount=count(1) from qry_student;
if @ProgramSearch=0
begin
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1) row_number () over (order by RecID) as RowNumber, RecID, Program, [Level Name], [Student Names], email as [Email], [Telephone No.], gender as [Gender], [Marital Status], [Pic], [Created Date], [Created Time] from qry_student where ProgramID=@ProgramSearch 
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
else if @ProgramSearch=0 AND @LevelSearch !=0
begin
select  top (@StartIndex + @PageSize -1) row_number () over (order by RecID) as RowNumber, RecID, Program, [Level Name], [Student Names], email as [Email], [Telephone No.], gender as [Gender], [Marital Status], [Pic], [Created Date], [Created Time] from qry_student where  [Level]=@LevelSearch
end
else if @ProgramSearch !=0 AND @LevelSearch !=0
begin 
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1) row_number () over (order by RecID) as RowNumber, RecID, Program, [Level Name], [Student Names], email as [Email], [Telephone No.], gender as [Gender], [Marital Status], [Pic], [Created Date], [Created Time] from qry_student where ProgramID=@ProgramSearch AND [Level]=@LevelSearch
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
else
begin 
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1) row_number () over (order by RecID) as RowNumber, RecID, Program, [Level Name], [Student Names], email as [Email], [Telephone No.], gender as [Gender], [Marital Status], [Pic], [Created Date], [Created Time] from qry_student where ProgramID=@ProgramSearch AND [Level]=@LevelSearch
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
END







SELECT * from qry_student
















GO
/****** Object:  StoredProcedure [dbo].[GetUserManagement]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserManagement] (@StartIndex int, @PageSize int, @Search varchar, @TotalCount int output) as 
begin
select @TotalCount=count(1) from tbl_usermanagement;
if @Search !=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by  u.rec_id) as RowNumber from tbl_usermanagement u
join tbl_staff st on st.staff_id=u.staff_id
join tbl_department dp on dp.department_id= st.department_id 
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)
end
if @Search =0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by  u.rec_id) as RowNumber from tbl_usermanagement u
join tbl_staff st on st.staff_id=u.staff_id
join tbl_department dp on dp.department_id=st.department_id where dp.department_id=@Search
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize-1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetVice]    Script Date: 24/03/2021 4:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetVice] (@StartIndex int, @PageSize int, @TotalCount int output) as 
BEGIN
select @TotalCount=count(1) from tbl_vice;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by v.rec_id) as RowNumber, v.rec_id  as [RecID], v.staff_id as [Staff ID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name],v.active as [Active], v.created_date as [Created Date], v.created_time as [Created Time] from tbl_vice  v join tbl_staff st on v.staff_id=st.staff_id
)
select * from CTE where RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
END
GO
