USE [VeritasEvaluation]
GO
/****** Object:  UserDefinedFunction [dbo].[FuzzyMatchString]    Script Date: 9/9/2021 8:44:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[FuzzyMatchString] (@s1 varchar(100), @s2 varchar(100))
RETURNS int
AS
BEGIN

    DECLARE @i int, @j int;
    SET @i = 1;
    SET @j = 0;
    WHILE @i < LEN(@s1)
    BEGIN
        IF CHARINDEX(SUBSTRING(@s1,@i,2), @s2) > 0 SET @j=@j+1;
        SET @i=@i+1;
    END
    RETURN @j;
END
GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student](
	[program_id] [bigint] NULL,
	[level_id] [bigint] NULL,
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
	[matric_no] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([matric_no]),
	[mt_id] [varchar](200) NULL,
	[user_password] [varchar](200) NULL,
	[username] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[matric_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [fkUnique] UNIQUE NONCLUSTERED 
(
	[mt_id] ASC,
	[email] ASC,
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course_registration]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course_registration](
	[registration_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([registration_id]),
	[course_id] [bigint] NULL,
	[session_id] [bigint] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[matric_no] [bigint] NULL,
	[flag_on] [int] NULL,
	[firstca] [int] NULL,
	[secondca] [int] NULL,
	[thirdca] [int] NULL,
	[exam] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course](
	[department_id] [bigint] NULL,
	[course_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([course_id]),
	[semester_id] [bigint] NULL,
	[level_id] [bigint] NULL,
	[course_typeID] [bigint] NULL,
	[course_code] [varchar](100) NULL,
	[course_title] [varchar](10) NULL,
	[course_name] [varchar](100) NULL,
	[course_ref] [varchar](100) NULL,
	[course_unit] [varchar](100) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[course_description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_level]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_level](
	[level_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([level_id]),
	[level_name] [varchar](100) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_pivot_Score]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_pivot_Score] as select mt, StLevel, level, Names, matric_no, course_id, convert(varchar,Total ) + ' ' + '[' + Grade + ']'+ ' ' + '[' + convert(varchar,Unit) + ']' as [Total] from (
select mt, StLevel, level, Names, matric_no, course_id, Total, case when Total>=70 then 5 * course_unit when
Total>=60 then 4 * course_unit when Total >= 50 then 3 * course_unit when
Total >=45 then 2 * course_unit else 0 end as [Unit], case when Total >=70 then 'A' when Total
>=60 then 'B' when Total >=50 then 'C' when Total >=45 then 'D' else 'F' 
end as Grade from (select s.level_id as [StLevel], l.level_name as level, s.firstname as Names, s.matric_no as mt, s.mt_id as matric_no, c.course_unit as course_unit, c.course_title + ' ' + c.course_code + '  ' + '[' + c.course_unit + ']' as course_id, co.firstca + 
co.secondca + co.thirdca + co.exam as [Total] from tbl_course_registration co 
join tbl_course c on c.course_id=co.course_id
join tbl_student s on s.matric_no=co.matric_no 
 join tbl_level l on l.level_id=c.level_id
) as qry1) as qry2 group by course_id, mt, StLevel, Level, Names , matric_no, Total, Grade, Unit
GO
/****** Object:  View [dbo].[gert]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[gert] AS 
                SELECT Names, matric_no,[CSC 101  [3]]],[CSC 103  [3]]],[CSC 403  [2]]]
FROM (
    SELECT Names, matric_no,course_id,Total

    FROM qry_pivot_Score where StLevel=4
) as s
PIVOT
(
    MAX(Total)
    FOR course_id IN ([CSC 101  [3]]],[CSC 103  [3]]],[CSC 403  [2]]]) 
) pvt
GO
/****** Object:  View [dbo].[qry_pivotReport]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[qry_pivotReport] AS 
                SELECT [CSC 101  [3]]],[CSC 103  [3]]],[CSC 403  [2]]],Names, matric_no
FROM (
    SELECT Names, matric_no,course_id,Total

    FROM qry_pivot_Score where StLevel=4
) as s
PIVOT
(
    MAX(Total)
    FOR course_id IN ([CSC 101  [3]]],[CSC 103  [3]]],[CSC 403  [2]]]) 
) pvt
GO
/****** Object:  Table [dbo].[tbl_semester]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_semester](
	[semester_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([semester_id]),
	[semester_name] [varchar](100) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_session]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_department]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_department](
	[faculty_id] [bigint] NULL,
	[department_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([department_id]),
	[department_code] [varchar](10) NULL,
	[department_name] [varchar](100) NULL,
	[department_description] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_program]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_program](
	[department_id] [bigint] NULL,
	[program_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([program_id]),
	[program_title] [varchar](100) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[program_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_report1]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_report1] as select *  from (select RecID, DepartmentName,DepartmentID, ProgramID,ProgramTitle, StudentName, MatricNo, CourseID, CourseName, CourseUnit, CourseCode, LevelID, LevelName, SemesterID, SemesterName, SessionID, [Session], max(SessionID) as [MaxSessionID], min(SessionID) as [MinSessionID], Total from (select r.rec_id as [RecID], d.department_name as [DepartmentName],
 d.department_id as [DepartmentID], p.program_id as [ProgramID],p.program_title as [ProgramTitle],
  st.firstname + ' ' + st.middlename + ' ' + st.lastname as [StudentName],
  st.matric_no as [MatricNo], r.course_id as [CourseID],
  c.course_name as [CourseName], c.course_unit AS [CourseUnit], c.course_title + convert(varchar, c.course_code) as CourseCode, 
  st.level_id as [LevelID], l.level_name as [LevelName], se.semester_id as [SemesterID],
   se.semester_name as [SemesterName],
   sem.session_id as [SessionID], 
   sem.session_year_from + '/' + sem.session_year_to as [Session], firstca + secondca + thirdca + exam as [Total]
   from tbl_course_registration r
inner join tbl_course c on c.course_id=r.course_id
inner join tbl_semester se on se.semester_id=c.semester_id
inner join tbl_session sem on sem.session_id=r.session_id
join tbl_department d on d.department_id=c.department_id
join tbl_program p on p.department_id=d.department_id
join tbl_student st on st.matric_no=r.matric_no
join tbl_level l on l.level_id=c.level_id group by r.rec_id, d.department_name, d.department_id, p.program_id, p.program_title, st.firstname, st.middlename, st.lastname, st.matric_no, r.course_id, c.course_name, c.course_unit, c.course_title, c.course_code, st.level_id, l.level_name, se.semester_id, se.semester_name, sem.session_id, sem.session_year_from, sem.session_year_to, r.firstca, r.secondca, r.thirdca, r.exam) as qry1 group by  RecID, DepartmentName,DepartmentID, ProgramID,ProgramTitle, StudentName, MatricNo, CourseID, 
CourseName, CourseUnit, CourseCode, LevelID, LevelName, 
SemesterID, SemesterName, SessionID, [Session], Total) as qry4
GO
/****** Object:  View [dbo].[qryBroughtForward]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryBroughtForward] as select MatricNo, TotalCredit, TotalGrade, convert(decimal(18,2), convert(float, TotalGrade) / convert(float,TotalCredit) ) as [TotalGp] from (SELECT MatricNo, sum(convert(int,CourseUnit))  as [TotalCredit], case
 when Total >=70 then CourseUnit * 5
  when Total >=60 then CourseUnit * 4 when
   Total >=50 then CourseUnit * 3 when 
   Total >=45 then CourseUnit * 2 when Total <=44 then 0 else 0 end as [TotalGrade] from (SELECT 
  MatricNo, CourseUnit, Total
FROM qry_report1 t1
WHERE SessionID !=(SELECT
  MAX(t2.SessionID)
FROM qry_report1 t2
)
GROUP BY MatricNo, CourseUnit, Total) as qry1 group by MatricNo, Total, CourseUnit) as qry4
GO
/****** Object:  View [dbo].[qryBr]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryBr] as select s.mt_id as Mt, q.TotalCredit as [BF Total Credit], q.TotalGrade as [BF Total Grade], q.TotalGp as [BF Total Grade Point] from qryBroughtForward q
join tbl_student s on s.matric_no =q.MatricNo
GO
/****** Object:  View [dbo].[qryCurrentGrade]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryCurrentGrade] as select MatricNo, SessionID, SemesterID, TotalCredit, TotalGrade, convert(decimal(18,2), convert(float, TotalGrade) /convert(float,TotalCredit) ) as [TotalGp] from ( SELECT MatricNo, SessionID, SemesterID, sum(convert(int,CourseUnit))  as [TotalCredit], case
 when Total >=70 then CourseUnit * 5
  when Total >=60 then CourseUnit * 4 when
   Total >=50 then CourseUnit * 3 when 
   Total >=45 then CourseUnit * 2 when Total <=44 then 0 else 0 end as [TotalGrade] from (SELECT 
  MatricNo, SessionID, SemesterID, CourseUnit, Total
FROM qry_report1 t1
WHERE SessionID =(SELECT
  MAX(t2.SessionID)
FROM qry_report1 t2
)
GROUP BY MatricNo, SemesterID, CourseUnit, Total, SessionID) as qry1 group by MatricNo, SessionID, SemesterID, Total, CourseUnit ) as qry5
GO
/****** Object:  View [dbo].[qryLineReport]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryLineReport] as SELECT        r.Names, r.StLevel, r.matric_no, r.course_id, r.Total, c.SessionID, c.SemesterID, b.TotalCredit AS [BF Total Credit], b.TotalGrade AS [BF Total Grade], b.TotalGp AS [BF Grade Point], c.TotalCredit AS [Current Total Credit], 
                         c.TotalGrade AS [Current Grade], c.TotalGp AS [Current Grade Point]
FROM            dbo.qry_pivot_Score AS r left  JOIN
                         dbo.qryBroughtForward AS b ON b.MatricNo = r.mt left  JOIN
                         dbo.qryCurrentGrade AS c ON c.MatricNo = r.mt
GO
/****** Object:  View [dbo].[qryPerformance]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryPerformance] as SELECT        r.Names, r.StLevel, r.matric_no, r.mt as Mt, r.course_id, r.Total, c.SessionID, ses.session_year_from + '/' + ses.session_year_to as [Session], 
c.SemesterID, seme.semester_name as [Semester], b.TotalCredit AS [BF Total Credit], b.TotalGrade AS [BF Total Grade], b.TotalGp AS [BF Grade Point], c.TotalCredit AS [Current Total Credit], 
                         c.TotalGrade AS [Current Grade], c.TotalGp AS [Current Grade Point]
FROM            dbo.qry_pivot_Score AS r LEFT OUTER JOIN
                         dbo.qryBroughtForward AS b ON b.MatricNo = r.mt LEFT OUTER JOIN
                         dbo.qryCurrentGrade AS c ON c.MatricNo = r.mt
						 join tbl_session ses on ses.session_id=c.SessionID
						 join tbl_semester seme on seme.semester_id=c.SemesterID
GO
/****** Object:  View [dbo].[qry_StudentIdentity]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_StudentIdentity] as select matric_no as [User], 'Student' as [Position], firstname as [Name], email as [Email], profile_pic as [Pic] from tbl_student
GO
/****** Object:  Table [dbo].[tbl_assign_course]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_assign_course](
	[assign_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([assign_id]),
	[course_id] [bigint] NULL,
	[session_id] [bigint] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[assign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_assign_duplicates]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_assign_duplicates] as select max(session_id) as [MaxSes], course_id, staff_id, session_id from tbl_assign_course group by course_id, staff_id, session_id
GO
/****** Object:  View [dbo].[qry_view1]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_view1] as select max(matric_no) as [S/N],matric_no, session_id, course_id from tbl_course_registration group by session_id, course_id, matric_no
GO
/****** Object:  View [dbo].[qry_view2]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_view2] as select distinct v.matric_no, v.session_id, v.course_id, reg.flag_on from qry_view1 v join tbl_course_registration reg on reg.matric_no=v.matric_no
GO
/****** Object:  View [dbo].[qry_view3]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_view3] as select d.staff_id, v.course_id, v.session_id, count(v.matric_no) as [TotalStudents] from qry_assign_duplicates d

right join qry_view2 v on v.course_id=d.course_id AND v.session_id=d.session_id group by d.staff_id, v.course_id, v.session_id
GO
/****** Object:  View [dbo].[qry_view4]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_view4] as select  distinct v.staff_id as [StaffID], v.course_id as [CourseID], c.course_name as [Course], c.course_title + c.course_code as [Course Code], s.semester_name as [Semester],l.level_name as [Level],se.session_id as [SessionID], se.session_year_from +'/' + se.session_year_to as [Session] , case when v.TotalStudents <=0 then 'Confirm' when v.TotalStudents=1 then  'Enter score for ' + ' '  + convert(varchar, v.TotalStudents) + ' ' + 'student' when v.TotalStudents > 1 then  'Enter score for '+ ' ' + convert(varchar,v.TotalStudents) + ' ' + 'students' end as [Enter Result], case when va.flag_on <=0 then 'No Approval yet' when va.flag_on=1 then 'Waiting for Approval' when va.flag_on=2 then 'Approved by HOD' when va.flag_on=3 then 'Approved by Dean' when va.flag_on=4 then 'Approved by Vice Chancellor' else 'No Approval yet' end as [Remark]
 from qry_view3 v
join tbl_course c on c.course_id=v.course_id
join tbl_semester s on s.semester_id=c.semester_id
join tbl_level l on l.level_id=c.level_id
join tbl_session se on se.session_id=v.session_id
join qry_view2 va on va.course_id=v.course_id AND va.session_id=v.session_id and va.matric_no=va.matric_no
GO
/****** Object:  View [dbo].[qry_view6]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_view6] as select row_number() over (order by reg.matric_no) as [S/N], reg.rec_id as [Recid], reg.matric_no as [MaxSt], st.mt_id as [MatricNumber], reg.course_id as [CourseID], reg.session_id as [SessionID],  reg.firstca as [firstCa], reg.secondCa as [secondCa], reg.thirdca as [thirdCa], reg.exam as [Exam], reg.firstca + reg.secondca + reg.thirdca + reg.exam as [Total]   from tbl_course_registration reg
join tbl_student st on st.matric_no=reg.matric_no
GO
/****** Object:  View [dbo].[qry_view7]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_view7] as select max(Total) as [Total], MaxSt, SessionID, CourseID from qry_view6 group by MaxSt, SessionID, CourseID
GO
/****** Object:  View [dbo].[qry_input_view]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_input_view] as select row_number() over (order by SessionID desc) as [S/N], StaffID, CourseID, Course, [Course Code], Semester, [Level], SessionID, Session, [Enter Result], Remark from qry_view4
GO
/****** Object:  Table [dbo].[tbl_hod]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_hod](
	[hod_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([hod_id]),
	[hod_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_staff]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_staff](
	[department_id] [bigint] NULL,
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
	[title] [varchar](100) NULL,
	[program] [varchar](100) NULL,
	[position] [varchar](100) NULL,
	[staff_description] [varchar](max) NULL,
	[staff_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([staff_id]),
	[st_id] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ghgkd] UNIQUE NONCLUSTERED 
(
	[st_id] ASC,
	[email] ASC,
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[telephone_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ary_approve]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ary_approve] as select row_number() over (order by SessionID ASC) AS [S/N], DepartmentID, SessionID, CourseID, CourseCode, CourseUnit, CourseName, StaffID, StaffName, FlagOn from (select distinct d.department_id as [DepartmentID], se.session_id as [SessionID], se.session_year_from + '/' + se.session_year_to as [Session], s.firstname + ' ' + s.middlename + ' ' + s.lastname as [StaffName], h.staff_id as [StaffID], c.course_title + c.course_code as [CourseCode], c.course_unit as [CourseUnit], c.course_id as [CourseID],c.course_name as [CourseName], r.flag_on as [FlagOn] from tbl_hod h
inner join tbl_staff s on s.staff_id=h.staff_id
inner join tbl_department d on d.department_id=s.department_id
inner join tbl_course c on c.department_id=d.department_id
join tbl_course_registration r on r.course_id=c.course_id
join tbl_session se on se.session_id=r.session_id) as qry1
GO
/****** Object:  View [dbo].[qry_assign_course]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_assign_course] as select distinct row_number() over (order by ass.rec_id) as [S/N], ass.rec_id as [RecID], dp.department_name as [Department], st.staff_id as [StaffID], st.title as [Title], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [StaffNames], co.course_id as [CourseID], co.course_name as [CourseName], co.course_title + co.course_code as [CourseCode], se.session_id as [SessionID], se.session_year_from  + '/' + se.session_year_to as [Session], sem.semester_name as [Semester], le.level_name as [Level], ass.created_date as [Created Date], ass.created_time as [Created Time] from tbl_assign_course ass
inner join tbl_course co on co.course_id=ass.course_id
inner join tbl_staff st on st.staff_id=ass.staff_id
inner join tbl_department dp on dp.department_id=co.department_id
inner join tbl_level le on le.level_id=co.level_id
inner join tbl_semester sem on sem.semester_id =co.semester_id
inner join tbl_session se on se.session_id=ass.session_id
GO
/****** Object:  Table [dbo].[tbl_course_type]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course_type](
	[course_typeID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([course_typeID]),
	[type_ref] [varchar](100) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_course]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_course] as select distinct row_number() over (order by co.rec_id) as [S/N], co.rec_id as [RecID], dp.department_id as [DepartmentID], dp.department_name as [DepartmentName], le.level_id as [LevelID], le.level_name as [LevelName], se.semester_id as [SemesterID], se.semester_name as [SemesterName], tp.course_typeID as [TypeID], tp.type_ref as [CourseType], co.course_name as [CourseName], co.course_title + convert(varchar,co.course_code) as [CourseCode], co.course_ref as [Course Reference], co.course_unit as [CourseUnit], co.course_description as [CourseDescription], co.created_date as [CreatedDate], co.created_time as [CreatedTime] from tbl_course co
inner join tbl_department dp on dp.department_id=co.department_id
inner join tbl_level le on le.level_id=co.level_id
inner join tbl_semester se on se.semester_id=co.semester_id
inner join tbl_course_type tp on tp.course_typeID=co.course_typeID
GO
/****** Object:  View [dbo].[qry_course_registration]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_course_registration] as SELECT distinct        reg.rec_id AS RecID, dp.department_id AS DepartmentID, dp.department_name AS Department, se.session_id AS SessionID, se.session_year_from + '/' + se.session_year_to AS Session, sem.semester_id AS SemesterID, 
                         sem.semester_name AS Semester, le.level_id AS LevelID, le.level_name AS LevelName, st.matric_no as MatNo, st.mt_id AS MatricNo, st.firstname + ' ' + st.middlename + ' ' + st.lastname AS [Student Names], co.course_id AS CourseID, 
                         co.course_name AS [Course Name], co.course_title + CONVERT(varchar, co.course_code) AS [Course Code], co.course_unit AS [Course Unit], reg.created_date AS [Created Date], reg.created_time AS [Created Time]
FROM            dbo.tbl_course_registration AS reg INNER JOIN
                         dbo.tbl_student AS st ON st.matric_no = reg.matric_no INNER JOIN
                         dbo.tbl_session AS se ON se.session_id = reg.session_id INNER JOIN
                         dbo.tbl_course AS co ON co.course_id = reg.course_id INNER JOIN
                         dbo.tbl_department AS dp ON dp.department_id = co.department_id INNER JOIN
                         dbo.tbl_level AS le ON le.level_id = co.level_id INNER JOIN
                         dbo.tbl_semester AS sem ON sem.semester_id = co.semester_id
GO
/****** Object:  Table [dbo].[tbl_dean]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dean](
	[dean_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([dean_id]),
	[dean_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_dean]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_dean] as select DISTINCT row_number() over (order by v.rec_id) as [S/N], v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department], st.staff_id as [StaffID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], case when v.active='0' then 'Not Active Anymore' else 'Currently Active' end as [Active], v.created_date as [CreatedDate], v.created_time as [CreatedTime] from tbl_dean v
inner join tbl_staff st on st.staff_id=v.staff_id
inner join tbl_department d on d.department_id=st.department_id
GO
/****** Object:  Table [dbo].[tbl_faculty]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_faculty](
	[faculty_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([faculty_id]),
	[faculty_code] [varchar](10) NULL,
	[faculty_name] [varchar](100) NULL,
	[faculty_description] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_DepartmentByFaculty]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_DepartmentByFaculty] as select distinct dp.rec_id as [RecID], fa.faculty_id as [FacultyID], fa.faculty_name as [Faculty] , dp.department_name as [Department], dp.department_code as [Department Code], dp.department_description as [Description], dp.created_date as [Created Date], dp.created_time as [Created Time] from tbl_department dp
join tbl_faculty fa on fa.faculty_id=dp.faculty_id
GO
/****** Object:  Table [dbo].[tbl_exam_officer]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_exam_officer](
	[officer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([officer_id]),
	[officer_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_examofficer]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_examofficer] as select DISTINCT row_number() over (order by v.rec_id) as [S/N], v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department], st.staff_id as [StaffID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], case when v.active='0' then 'Not Active Anymore' else 'Currently Active' end as [Active], v.created_date as [CreatedDate], v.created_time as [CreatedTime] from tbl_exam_officer v
inner join tbl_staff st on st.staff_id=v.staff_id
inner join tbl_department d on d.department_id=st.department_id
GO
/****** Object:  View [dbo].[qry_hod]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_hod] as select DISTINCT row_number() over (order by v.rec_id) as [S/N], v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department], st.staff_id as [StaffID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], case when v.active='0' then 'Not Active Anymore' else 'Currently Active' end as [Active], v.created_date as [CreatedDate], v.created_time as [CreatedTime] from tbl_hod v
inner join tbl_staff st on st.staff_id=v.staff_id
inner join tbl_department d on d.department_id=st.department_id
GO
/****** Object:  Table [dbo].[tbl_usermanagement]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usermanagement](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([UserID]),
	[username] [varchar](100) NULL,
	[vice] [varchar](10) NULL,
	[exam_officer] [varchar](10) NULL,
	[lecturer] [varchar](10) NULL,
	[hod] [varchar](10) NULL,
	[administrator] [varchar](10) NULL,
	[dean] [varchar](10) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL,
	[pass] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_identity]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_identity] AS SELECT U.staff_id AS [User],s.position as [Position],s.title + '  ' +  s.firstname + ' ' + s.middlename + ' ' + s.lastname as [Name], s.email as [Email], s.profile_pic as [Pic] FROM tbl_usermanagement u
join tbl_staff s on s.staff_id=u.staff_id
GO
/****** Object:  View [dbo].[qry_input_score]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_input_score] as select row_number() over (order by r.rec_id) as [S/N], r.matric_no as [MaxSt], s.mt_id as [MatricNumber], r.course_id as [CourseID],
R.session_id as [SessionID], r.firstca as [firstCa], r.secondca as [SecondCa], r.thirdca as [ThirdCa],
r.exam as [Exam] from tbl_course_registration r
join tbl_student s on s.matric_no=r.matric_no
GO
/****** Object:  View [dbo].[qry_reg_duplicates]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_reg_duplicates] as select max(session_id) as [MaxSes], course_id, matric_no, session_id from tbl_course_registration group by course_id, matric_no, session_id
GO
/****** Object:  Table [dbo].[tbl_registrar]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_registrar](
	[registrar_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([registrar_id]),
	[registrar_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_registrar]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[qry_registrar] as select DISTINCT row_number() over (order by v.rec_id) as [S/N], v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department], st.staff_id as [StaffID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], case when v.active='0' then 'Not Active Anymore' else 'Currently Active' end as [Active], v.created_date as [CreatedDate], v.created_time as [CreatedTime] from tbl_registrar v
inner join tbl_staff st on st.staff_id=v.staff_id
inner join tbl_department d on d.department_id=st.department_id
GO
/****** Object:  Table [dbo].[tbl_sms]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_Sms]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_Sms] as select rec_id as [RecID], sms_name as [SMS Name], auth_id as [Authentication ID], created_date as [Created Date], created_time as [Created Time] from tbl_sms
GO
/****** Object:  View [dbo].[qry_staff]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_staff] as select DISTINCT row_number() over(order by st.rec_id) as [S/N], st.rec_id as [RecID], dp.department_id as [DepartmentID], dp.department_name as [DepartmentName], st.title as [Title],  st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], st.email as [Email],st.telephone_no as [Telephone Number], case when st.gender='M' then 'MALE' else 'FEMALE' end as [Gender],st. marital_status as [MaritalStatus], st.position as [Position], st.created_date as [Created Date], st.created_time as [Created Time] from tbl_staff st
inner join tbl_department dp on dp.department_id=st.department_id
GO
/****** Object:  View [dbo].[qry_statistics]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_statistics] as select DISTINCT RecID, max(MatNo) as [MaxSt], MatricNumber, StudentName, Gender, MaritalStatus, CourseName, CourseCode,CourseUnit, LevelID, SemesterID, Semester, [Level], SessionID, [Session],FirstCa, CourseID, SecondCa, ThirdCa, Exam,  Total, case when Total >=70 then CourseUnit * 5 when Total >=60 then CourseUnit * 4 when Total >=50 then CourseUnit * 3 WHEN Total >=45 then CourseUnit * 2 else '0' end as [Grade], case when Total >=70 then 'A' when Total >=60 then 'B' when Total >=50 then 'C' when Total >=45 then 'D' else 'F' end as [Remark] from (select row_number() over (order by reg.rec_id) as [RecID],st.matric_no as [MatNo], st.mt_id as [MatricNumber], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [StudentName], st.gender as [Gender], st.marital_status as [MaritalStatus],co.course_id as [CourseID],co.course_name as [CourseName], co.course_title + co.course_code as [CourseCode], co.course_unit as [CourseUnit],st.level_id as [LevelID], sem.semester_id as [SemesterID], sem.semester_name as [Semester], le.level_name as [Level], se.session_id as [SessionID], se.session_year_from + '/' + se.session_year_to as [Session], reg.firstca as [FirstCa], reg.secondca as [SecondCa], reg.thirdca as [ThirdCa], reg.exam as [Exam], reg.firstca + reg.secondca + reg.thirdca + reg.exam as [Total] from tbl_course_registration reg
inner join tbl_course co on co.course_id=reg.course_id
inner join tbl_level le on le.level_id =co.level_id
inner join tbl_semester sem on sem.semester_id=co.semester_id
inner join tbl_session se on se.session_id=reg.session_id
inner join tbl_student st on st.matric_no=reg.matric_no) as tblQuery1 group by RecID, MatNo, MatricNumber, StudentName, CourseName, CourseCode,CourseUnit, LevelID, SemesterID, Semester, [Level], SessionID, [Session],FirstCa, SecondCa, ThirdCa, Exam,  Total, Gender, MaritalStatus, CourseID
GO
/****** Object:  View [dbo].[qry_student]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_student] as select distinct row_number() over (order by st.rec_id) as [S/N], st.rec_id as [RecID], st.matric_no as [Mat], dp.department_name as [Department], pg.program_id as [ProgramID], pg.program_title as [Program], le.level_id as [LevelID], le.level_name as [Level], st.mt_id as [Matric Number], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Student Name], st.email as [Email], st.telephone_no as [Telephone Number], st.gender as [Gender], st.marital_status as [Marital Status], st.created_date as [CreatedDate], st.created_time as [CreatedTime] from tbl_student st
inner join tbl_program pg on pg.program_id=st.program_id
inner join tbl_department dp on dp.department_id=pg.department_id
left join tbl_level le on le.level_id =st.level_id
GO
/****** Object:  View [dbo].[qry_usermanagement]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_usermanagement] as select distinct row_number() over (order by us.rec_id) as [S/N], us.rec_id as [RecID], dp.department_id as [DepartmentID], dp.department_name as [DepartmentName], st.firstname+ ' ' + st.middlename + ' ' + st.lastname as [Staff Name], st.staff_id as [StaffID], us.username as [UserName], us.created_date as [CreatedDate], us.created_time as [CreatedTime] from tbl_usermanagement us
inner join tbl_staff st on st.staff_id=us.staff_id
inner join tbl_department dp on dp.department_id=st.department_id
GO
/****** Object:  Table [dbo].[tbl_vice]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vice](
	[vice_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([vice_id]),
	[vice_signature] [varchar](100) NULL,
	[active] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[staff_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_vice]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_vice] as select DISTINCT row_number() over (order by v.rec_id) as [S/N], v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department], st.staff_id as [StaffID], st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Staff Name], case when v.active='0' then 'Not Active Anymore' else 'Currently Active' end as [Active], v.created_date as [CreatedDate], v.created_time as [CreatedTime] from tbl_vice v
inner join tbl_staff st on st.staff_id=v.staff_id
inner join tbl_department d on d.department_id=st.department_id
GO
/****** Object:  View [dbo].[qry_view5]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_view5] as select matric_no,session_id,course_id, firstca, secondca, thirdca, exam, firstca + secondca + thirdca + exam as [Total] from tbl_course_registration group by matric_no, session_id, course_id, firstca, secondca, thirdca, exam
GO
/****** Object:  Table [dbo].[customers]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customerid] [int] IDENTITY(1,1) NOT NULL,
	[customername] [nvarchar](50) NULL,
	[customeremail] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chat]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chat](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[queries] [varchar](max) NULL,
	[replies] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dict_tables]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dict_tables](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[panel_id] [varchar](50) NOT NULL,
	[table_name] [varchar](50) NOT NULL,
	[key_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_dict_tables] PRIMARY KEY CLUSTERED 
(
	[panel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_message_log]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_message_log](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([log_id]),
	[client_id] [bigint] NULL,
	[client_message] [varchar](max) NULL,
	[bot_message] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_performance_message]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_performance_message](
	[message_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([message_id]),
	[replies] [varchar](max) NULL,
	[queries] [varchar](max) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_result_entry]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_result_entry](
	[entry_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([entry_id]),
	[course_id] [bigint] NULL,
	[session_id] [bigint] NULL,
	[firstca] [int] NULL,
	[secondca] [int] NULL,
	[thirdca] [int] NULL,
	[exam] [int] NULL,
	[flag_on] [int] NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[matric_no] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_log]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_log](
	[user_name] [varchar](50) NOT NULL,
	[log_url] [varchar](250) NOT NULL,
	[log_date] [date] NULL,
	[log_time] [time](7) NULL,
	[log_sql] [varchar](max) NULL,
	[log_desc] [varchar](max) NULL,
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_RecID] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_assign_course] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_assign_course] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_chat] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_chat] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_course] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_course] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT ((0)) FOR [flag_on]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT ((0)) FOR [firstca]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT ((0)) FOR [secondca]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT ((0)) FOR [thirdca]
GO
ALTER TABLE [dbo].[tbl_course_registration] ADD  DEFAULT ((0)) FOR [exam]
GO
ALTER TABLE [dbo].[tbl_course_type] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_course_type] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_dean] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_dean] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_department] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_department] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_exam_officer] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_exam_officer] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_faculty] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_faculty] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_hod] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_hod] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_level] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_level] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_message_log] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_message_log] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_performance_message] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_performance_message] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_program] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_program] ADD  DEFAULT (getdate()) FOR [created_time]
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
ALTER TABLE [dbo].[tbl_semester] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_semester] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_session] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_session] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_sms] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_sms] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_staff] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_staff] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_student] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_student] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_student] ADD  DEFAULT ('welcome') FOR [user_password]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_date]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_time]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [vice]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [exam_officer]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [lecturer]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [hod]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [administrator]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT ('0') FOR [dean]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_usermanagement] ADD  DEFAULT (getdate()) FOR [created_time]
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
ALTER TABLE [dbo].[tbl_assign_course]  WITH CHECK ADD  CONSTRAINT [dgdjhs] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_assign_course] CHECK CONSTRAINT [dgdjhs]
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
ALTER TABLE [dbo].[tbl_course_registration]  WITH CHECK ADD  CONSTRAINT [fkCourseReg_sessionID] FOREIGN KEY([session_id])
REFERENCES [dbo].[tbl_session] ([session_id])
GO
ALTER TABLE [dbo].[tbl_course_registration] CHECK CONSTRAINT [fkCourseReg_sessionID]
GO
ALTER TABLE [dbo].[tbl_course_registration]  WITH CHECK ADD  CONSTRAINT [fkCourseRegistrationMatric] FOREIGN KEY([matric_no])
REFERENCES [dbo].[tbl_student] ([matric_no])
GO
ALTER TABLE [dbo].[tbl_course_registration] CHECK CONSTRAINT [fkCourseRegistrationMatric]
GO
ALTER TABLE [dbo].[tbl_dean]  WITH CHECK ADD  CONSTRAINT [fkUsermanagementss] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_dean] CHECK CONSTRAINT [fkUsermanagementss]
GO
ALTER TABLE [dbo].[tbl_department]  WITH CHECK ADD  CONSTRAINT [department_Faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[tbl_faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[tbl_department] CHECK CONSTRAINT [department_Faculty]
GO
ALTER TABLE [dbo].[tbl_exam_officer]  WITH CHECK ADD  CONSTRAINT [fkUsermanagementsssss] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_exam_officer] CHECK CONSTRAINT [fkUsermanagementsssss]
GO
ALTER TABLE [dbo].[tbl_hod]  WITH CHECK ADD  CONSTRAINT [fkUsermanagementsss] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_hod] CHECK CONSTRAINT [fkUsermanagementsss]
GO
ALTER TABLE [dbo].[tbl_program]  WITH CHECK ADD  CONSTRAINT [program_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[tbl_department] ([department_id])
GO
ALTER TABLE [dbo].[tbl_program] CHECK CONSTRAINT [program_department]
GO
ALTER TABLE [dbo].[tbl_registrar]  WITH CHECK ADD  CONSTRAINT [fkUsermanagementssss] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_registrar] CHECK CONSTRAINT [fkUsermanagementssss]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkCourseRegistrationMatridc] FOREIGN KEY([matric_no])
REFERENCES [dbo].[tbl_student] ([matric_no])
GO
ALTER TABLE [dbo].[tbl_result_entry] CHECK CONSTRAINT [fkCourseRegistrationMatridc]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkResultEntry_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_result_entry] CHECK CONSTRAINT [fkResultEntry_course]
GO
ALTER TABLE [dbo].[tbl_result_entry]  WITH CHECK ADD  CONSTRAINT [fkResultEntry_session] FOREIGN KEY([session_id])
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
ALTER TABLE [dbo].[tbl_usermanagement]  WITH CHECK ADD  CONSTRAINT [fkUsermanagement] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_usermanagement] CHECK CONSTRAINT [fkUsermanagement]
GO
ALTER TABLE [dbo].[tbl_vice]  WITH CHECK ADD  CONSTRAINT [fkUsermanagements] FOREIGN KEY([staff_id])
REFERENCES [dbo].[tbl_staff] ([staff_id])
GO
ALTER TABLE [dbo].[tbl_vice] CHECK CONSTRAINT [fkUsermanagements]
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
/****** Object:  StoredProcedure [dbo].[DynamicPivot]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DynamicPivot]
    @Course                VARCHAR(200) = NULL
AS
BEGIN

    DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

    SELECT @cols = STUFF((SELECT  ',' + QUOTENAME([CourseID]) 
                        FROM qry_report_Result WHERE (@Course IS NULL) OR (CourseID = @Course)
                FOR XML PATH(''), TYPE
                ).value('.', 'NVARCHAR(MAX)') 
            ,1,1,'')

    PRINT @cols

    SELECT @query = 
    'SELECT * FROM
    (SELECT  DISTINCT   
        [CourseID], 
        Total
    FROM qry_report_Result)X
    PIVOT 
    (
        AVG(Total)
        for [CourseID] in (' + @cols + ')
    ) P'

    EXEC SP_EXECUTESQL @query

END
GO
/****** Object:  StoredProcedure [dbo].[functionAssignCourses]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionAssignCourses](@RecID varchar(100), @CourseID varchar(100), @StaffID varchar(100), @SessionID varchar(100), @StatementType varchar(100)) as 
BEGIN 
if @StatementType='INSERT'
BEGIN
insert into tbl_assign_course(course_id, staff_id, session_id) values (@CourseID, @StaffID, @SessionID)
END
if @StatementType='UPDATE'
BEGIN
UPDATE tbl_assign_course SET course_id=@CourseID, staff_id=@StaffID, session_id=@SessionID WHERE rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionCourse]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionCourse] (@RecID varchar(100), @DepartmentID varchar(200), @Level varchar(200), @Semester varchar(200), @CourseType varchar(200), @CourseName varchar(200), @CourseTitle varchar(200), @CourseCode varchar(200), @CourseRef varchar(200), @CourseUnit varchar(100), @CourseDescription varchar(max), @StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
BEGIN
INSERT INTO tbl_course(department_id, level_id, semester_id, course_typeID, course_name, course_title, course_code, course_ref, course_unit, course_description) values ( @DepartmentID , @Level, @Semester, @CourseType, @CourseName, @CourseTitle, @CourseCode, @CourseRef, @CourseUnit, @CourseDescription)
END
if @StatementType='UPDATE'
BEGIN
UPDATE tbl_course set department_id=@DepartmentID, level_id=@Level, semester_id=@Semester, course_typeID=@CourseType, course_name=@CourseName, course_title=@CourseTitle, course_code=@CourseCode, course_ref=@CourseRef, course_unit=@CourseUnit, course_description=@CourseDescription where rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionCourseAssign]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionCourseRegistration]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionCourseRegistration](@RecID varchar(100), @CourseID varchar(100), @MatricNo varchar(200), @SessionID varchar(100), @StatementType varchar(100))
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
/****** Object:  StoredProcedure [dbo].[functionCourseType]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionDean]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionDean](@RecID varchar(100), @StaffID varchar(200), @Signature varchar(200), @Active varchar(100), @StatementType varchar(200))
as
begin
if @StatementType='INSERT'
begin
insert into tbl_dean (staff_id, dean_signature, active) values (@StaffID, @Signature, @Active)
end
if @StatementType='UPDATE'
begin
update tbl_dean set staff_id=@StaffID, dean_signature=@Signature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[functionDepartment]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionExamOfficer]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionExamOfficer](@RecID varchar(100), @StaffID varchar(200), @Signature varchar(200), @Active varchar(100), @StatementType varchar(200))
as
begin
if @StatementType='INSERT'
begin
insert into tbl_exam_officer (staff_id, officer_signature, active) values (@StaffID, @Signature, @Active)
end
if @StatementType='UPDATE'
begin
update tbl_exam_officer set staff_id=@StaffID, officer_signature=@Signature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[FunctionFaculty]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionHod]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionHod](@RecID varchar(100), @StaffID varchar(200), @Signature varchar(200), @Active varchar(100), @StatementType varchar(200))
as
begin
if @StatementType='INSERT'
begin
insert into tbl_hod (staff_id, hod_signature, active) values (@StaffID, @Signature, @Active)
end
if @StatementType='UPDATE'
begin
update tbl_hod set staff_id=@StaffID, hod_signature=@Signature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[functionInputScore]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionInputScore](@CourseID varchar(100), @SessionID varchar(100),@MaxSt varchar(100),@firstCa varchar(100), @secondCa varchar(100), @thirdCa varchar(100), @Exam varchar(100), @StatementType varchar(100)) as 
BEGIN
IF @StatementType='UPDATE'
BEGIN
UPDATE tbl_course_registration set firstca=@firstCa, secondca=@secondCa, thirdca=@thirdCa, exam=@Exam where course_id=@CourseID and session_id=@SessionID and matric_no=@MaxSt
END

END
GO
/****** Object:  StoredProcedure [dbo].[functionLevel]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FunctionProgram]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionRegistrar]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionRegistrar](@RecID varchar(100), @StaffID varchar(200), @Signature varchar(200), @Active varchar(100), @StatementType varchar(200))
as
begin
if @StatementType='INSERT'
begin
insert into tbl_registrar (staff_id, registrar_signature, active) values (@StaffID, @Signature, @Active)
end
if @StatementType='UPDATE'
begin
update tbl_registrar set staff_id=@StaffID, registrar_signature=@Signature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[FunctionSemester]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[functionSession]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionSession](@RecID varchar(100), @SessionYearFrom varchar(100), @SessionYearTo varchar(100), @StatementType varchar(100)) as 
BEGIN
IF @StatementType='INSERT'
BEGIN
INSERT INTO tbl_session(session_year_from, session_year_to) values (@SessionYearFrom, @SessionYearTo)
END
IF @StatementType='UPDATE'
BEGIN
UPDATE tbl_session SET session_year_from=@SessionYearFrom, session_year_to=@SessionYearTo WHERE rec_id=@RecID
END

END
GO
/****** Object:  StoredProcedure [dbo].[functionSms]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionSms](@RecID varchar(100),@SmsName varchar(100), @AuthID varchar(300), @StatementType varchar(100)='')
as
BEGIN
IF @StatementType='INSERT'
BEGIN
INSERT INTO tbl_sms(sms_name, auth_id) values (@SmsName, @AuthID)
END
IF @StatementType='UPDATE'
BEGIN
UPDATE tbl_sms SET sms_name=@SmsName, auth_id=@AuthID WHERE rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionStaff]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionStaff](@RecID varchar(100),@DepartmentID varchar(200), @StaffID varchar(100), @Firstname varchar(100),@MiddleName varchar(100), @LastName varchar(100),@Email varchar(100), @TelephoneNo varchar(20), @Gender varchar(20), @MaritalStatus varchar(20), @Description varchar(max), @Title varchar(200), @Position varchar(100), @ProfilePic varchar(200), @StatementType varchar(100)='')
as
begin
if @StatementType='INSERT'
begin
insert into tbl_staff(department_id, st_id,firstname, middlename, lastname,email, Telephone_no, gender, marital_status, staff_description, title, position, profile_pic) values (@DepartmentID, @StaffID, @Firstname,@MiddleName, @LastName,@Email, @TelephoneNo, @Gender, @MaritalStatus, @Description, @Title, @Position, @ProfilePic)
end
if @StatementType='UPDATE'
begin
update tbl_staff set department_id=@DepartmentID, st_id=@StaffID,firstname=@Firstname, middlename=@MiddleName, lastname=@LastName,email=@Email, Telephone_no=@TelephoneNo, gender=@Gender, marital_status=@MaritalStatus, staff_description=@Description, title=@Title, position=@Position, profile_pic=@ProfilePic where rec_id=@RecID
end
if @StatementType='DELETE'
begin
delete from tbl_staff where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[functionStudent]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionStudent]
(@RecID varchar(10), @ProgramID varchar(100), @LevelID varchar(100), @MatricNo varchar(100),
@FirstName varchar(100),@MiddleName varchar(100), @LastName varchar(100),
@Email varchar(100), @TelephoneNo varchar(30), @Gender varchar(20), @MaritalStatus varchar(100),
@ProfilePic varchar(100), @StatementType varchar(100), @UserName varchar(200), @UserPassword varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
BEGIN
insert into tbl_student (program_id, level_id, mt_id, firstname, middlename, lastname, email, telephone_no, gender, marital_status, profile_pic, username, user_password) values (@ProgramID, @LevelID, @MatricNo, @FirstName, @MiddleName, @LastName, @Email, @TelephoneNo, @Gender, @MaritalStatus, @ProfilePic, @UserName, @UserPassword)
END
IF @StatementType='UPDATE'
BEGIN
UPDATE tbl_student SET program_id=@ProgramID, level_id=@LevelID, mt_id=@MatricNo, firstname=@FirstName, middlename=@MiddleName, lastname=@LastName, email=@Email, telephone_no=@TelephoneNo, gender=@Gender, marital_status=@MaritalStatus, profile_pic=@ProfilePic where rec_id=@RecID
END

END
GO
/****** Object:  StoredProcedure [dbo].[functionUserManagement]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionUserManagement] (@RecID varchar(100),@StaffID varchar(100), @Username varchar(200), @Vice  varchar(10), @ExamOfficer varchar(10), @Lecturer varchar(10), @Hod varchar(10), @Administrator varchar(10), @Dean varchar(10), @Password nvarchar(500), @StatementType varchar(100))
as
BEGIN
if @StatementType='INSERT'
BEGIN
INSERT into tbl_usermanagement(staff_id, username, vice, exam_officer, lecturer, hod, administrator, dean, pass) values (@StaffID, @Username, @Vice, @ExamOfficer, @Lecturer, @Hod, @Administrator, @Dean, @Password)
END
IF @StatementType='UPDATE'
BEGIN
update tbl_usermanagement set staff_id= @StaffID, username=@Username, vice=@Vice, exam_officer=@ExamOfficer, lecturer=@Lecturer, hod=@Hod, administrator=@Administrator, dean=@Dean WHERE rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionUserManagementss]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[functionUserManagementss] (@RecID varchar(100),@StaffID varchar(100), @Username varchar(200), @Vice  varchar(10), @ExamOfficer varchar(10), @Lecturer varchar(10), @Hod varchar(10), @Administrator varchar(10), @Dean varchar(10), @Password nvarchar(500), @StatementType varchar(100))
as
BEGIN
if @StatementType='INSERT'
BEGIN
INSERT into tbl_usermanagement(staff_id, username, vice, exam_officer, lecturer, hod, administrator, dean, pass) values (@StaffID, @Username, @Vice, @ExamOfficer, @Lecturer, @Hod, @Administrator, @Dean, @Password)
END
IF @StatementType='UPDATE'
BEGIN
update tbl_usermanagement set staff_id= @StaffID, username=@Username, vice=@Vice, exam_officer=@ExamOfficer, lecturer=@Lecturer, hod=@Hod, administrator=@Administrator, dean=@Dean WHERE rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[functionVice]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[functionVice](@RecID varchar(100), @StaffID varchar(200), @Signature varchar(200), @Active varchar(100), @StatementType varchar(200))
as
begin
if @StatementType='INSERT'
begin
insert into tbl_vice (staff_id, vice_signature, active) values (@StaffID, @Signature, @Active)
end
if @StatementType='UPDATE'
begin
update tbl_vice set staff_id=@StaffID, vice_signature=@Signature, active=@Active where rec_id=@RecID
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetAssignCourse]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAssignCourse](@StartIndex int, @PageSize int, @TotalCount int output, @Staff int, @Course int, @Session int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_assign_course;
if @Staff =0
BEGIN
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], RecID, Department, StaffNames as [Staff Name], CourseName as [Course], CourseCode as [Course Code], [Session], Semester, [Level], [Created Date], [Created Time] FROM qry_assign_course
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
else if @Staff !=0 AND @Course=0 AND @Session=0
BEGIN 
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], RecID, Department, StaffNames as [Staff Name], CourseName as [Course], CourseCode as [Course Code], [Session], Semester, [Level], [Created Date], [Created Time] FROM qry_assign_course WHERE StaffID=@Staff 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
else if  @Course !=0 AND @Session=0
BEGIN 
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], RecID, Department, StaffNames as [Staff Name], CourseName as [Course], CourseCode as [Course Code], [Session], Semester, [Level], [Created Date], [Created Time] FROM qry_assign_course WHERE StaffID=@Staff  AND CourseID = @Course 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
else if  @Session !=0
BEGIN 
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], RecID, Department, StaffNames as [Staff Name], CourseName as [Course], CourseCode as [Course Code], [Session], Semester, [Level], [Created Date], [Created Time] FROM qry_assign_course WHERE StaffID=@Staff  AND CourseID= @Course AND SessionID=@Session 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE
BEGIN
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], RecID, Department, StaffNames as [Staff Name], CourseName as [Course], CourseCode as [Course Code], [Session], Semester, [Level], [Created Date], [Created Time] FROM qry_assign_course WHERE StaffID=@Staff  AND CourseID= @Course AND SessionID=@Session 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuditTrail]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAuditTrail](@StartIndex int, @PageSize int , @TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from tbl_user_log;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], user_name as [UserName], log_url as [Log Url], log_date as [Log Date], log_time as [Log Time], log_sql as [Log SQL]  from tbl_user_log
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetCourse]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCourse] (@StartIndex int, @PageSize int, @TotalCount int output, @DepartmentSearch int, @LevelSearch int, @SemesterSearch int, @CourseTypeSearch int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_course;
if @DepartmentSearch =0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE IF @DepartmentSearch !=0  AND @LevelSearch =0 AND @SemesterSearch =0 AND @CourseTypeSearch=0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE IF @LevelSearch !=0 AND @SemesterSearch =0 AND @CourseTypeSearch =0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE IF @SemesterSearch!=0 AND @CourseTypeSearch =0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE IF @CourseTypeSearch !=0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch AND TypeID=@CourseTypeSearch
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
ELSE
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName as [Department], LevelName as [Level], SemesterName as [Semester], CourseType as [Course Type], CourseName as [Course Name], CourseCode as [Course Code], [Course Reference], CourseUnit as [Course Unit], CourseDescription as [Course Description], CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_course WHERE DepartmentID=@DepartmentSearch and LevelID=@LevelSearch and SemesterID=@SemesterSearch AND TypeID=@CourseTypeSearch
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
END
GO
/****** Object:  StoredProcedure [dbo].[getCourseRegistration]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCourseRegistration](@StartIndex int, @PageSize int, @TotalCount int output, @Course int, @Session int,@MatricNo int) as
BEGIN
select @TotalCount=count(1) from qry_course_registration;
if @Course=0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] from qry_course_registration
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if @Course != 0 AND @Session= 0  AND @MatricNo = 0  
BEGIN 
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE CourseID=@Course
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
END
else if   @Session != 0 AND @MatricNo = 0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE CourseID=@Course AND SessionID=@Session
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else if   @MatricNo != 0 
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE CourseID=@Course AND SessionID=@Session AND MatNo=@MatricNo
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end
else  
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by RecID) as RowNumber, RecID, Department, [Session], Semester, LevelName as [Level], [MatricNo], [Student Names], [Course Name], [Course Code], [Course Unit], [Created Date], [Created Time] 
from qry_course_registration WHERE CourseID=@Course AND SessionID=@Session AND MatNo=@MatricNo
)
select * from CTE WHERE RowNumber between @StartIndex  and (@StartIndex + @PageSize -1)
end

END
GO
/****** Object:  StoredProcedure [dbo].[GetCourseType]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetDean]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDean](@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qry_dean;
if @Search =0
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID,Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_dean
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_dean where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEnterResultView]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetEnterResultView](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
select @TotalCount=count(1) from qry_input_view;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as [RowNumber], [S/N], StaffID, CourseID, Course, [Course Code], Semester, [Level], SessionID, Session, [Enter Result], Remark from qry_input_view where  StaffID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamOfficer]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetExamOfficer](@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qry_examofficer;
if @Search =0
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID,Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_examofficer
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID,Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_examofficer where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetFaculty]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHod]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetHod](@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qry_hod;
if @Search =0
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_hod
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_hod where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetLevel]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProgram]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetRegistrar]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRegistrar](@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qry_registrar;
if @Search =0
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_registrar
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber,RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_registrar where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetSemester]    Script Date: 9/9/2021 8:44:01 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetSession]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSession](@StartIndex int, @PageSize int , @TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from tbl_session;
with CTE AS
(
select top(@StartIndex +@PageSize-1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], session_year_from + '/' + session_year_to as [Session], created_date as [Created Date], created_time as [Created Time] from tbl_session
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetSms]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSms](@StartIndex int, @PageSize int , @TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from tbl_sms;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], sms_name as [User SMS Name], auth_id as [Authentication ID], created_date as [Created Date], created_time as [Created Time] from tbl_sms
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetStaff]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStaff](@StartIndex int, @PageSize int, @TotalCount int output, @FacultySearch int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_staff;
if @FacultySearch =0
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName, Title, [Staff Name], [Email], [Telephone Number], [Gender], MaritalStatus as [Marital Status], [Position], [Created Date], [Created Time] from qry_staff
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
else 
BEGIN
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, DepartmentName, Title, [Staff Name], [Email], [Telephone Number], [Gender], MaritalStatus as [Marital Status], [Position], [Created Date], [Created Time] from qry_staff WHERE DepartmentID = @FacultySearch 
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
END
GO
/****** Object:  StoredProcedure [dbo].[GetStatistics]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStatistics] (@StartIndex int, @PageSize int, @TotalCount int output,@CourseID int, @SessionID int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_statistics;
WITH CTE AS 
(
SELECT TOP(@StartIndex + @PageSize -1) RecID as RowNumber, RecID, MatricNumber as [Matric Number], StudentName as [Student Name], case when Gender ='M' then 'Male' else 'Female' end as [Gender], MaritalStatus as [Marital Status], CourseName as [Course], CourseCode as [Course Code], CourseUnit as [Course Unit], Semester as [Semester], [Level], [Session], FirstCa as [First CA 10%], SecondCa as [Second CA 10%], ThirdCa as [Third CA 10%], Exam as [Exam 70%], Total as [Total 100%], Grade as [Grade], [Remark] from qry_statistics where CourseID=@CourseID AND SessionID=@SessionID
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetStudent]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStudent](@StartIndex int, @PageSize int, @TotalCount int output, @ProgramSearch int, @LevelSearch int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_student;
if @ProgramSearch=0
begin
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1)  [S/N] as RowNumber, RecID, Program, [Level],[Matric Number], [Student Name], [Email], [Telephone Number], gender as [Gender], [Marital Status], CreatedDate as  [Created Date], CreatedTime as  [Created Time] from qry_student
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
else if @ProgramSearch !=0 AND @LevelSearch =0
begin
select  top (@StartIndex + @PageSize -1)  [S/N] as RowNumber, RecID, Program, [Level],[Matric Number], [Student Name], [Email], [Telephone Number], gender as [Gender], [Marital Status], CreatedDate as  [Created Date], CreatedTime as  [Created Time] from qry_student where ProgramID=@ProgramSearch
end
else if  @LevelSearch !=0
begin 
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1)  [S/N] as RowNumber, RecID, Program, [Level],[Matric Number], [Student Name], [Email], [Telephone Number], gender as [Gender], [Marital Status], CreatedDate as  [Created Date], CreatedTime as  [Created Time] from qry_student where ProgramID=@ProgramSearch AND [LevelID] = @LevelSearch
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
else
begin 
WITH CTE AS 
(
select  top (@StartIndex + @PageSize -1)  [S/N] as RowNumber, RecID, Program, [Level],[Matric Number], [Student Name], [Email], [Telephone Number], gender as [Gender], [Marital Status], CreatedDate as  [Created Date], CreatedTime as  [Created Time] from qry_student where ProgramID=@ProgramSearch AND [LevelID] = @LevelSearch 
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)
end
END
GO
/****** Object:  StoredProcedure [dbo].[GetStudentStatistics]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStudentStatistics] (@StartIndex int, @PageSize int, @TotalCount int output,@MaxSt int, @SemesterID int, @SessionID int) as 
BEGIN
SELECT @TotalCount=count(1) from qry_statistics;
if @SemesterID =0
begin
with cte as (
select top(@StartIndex + @PageSize -1) * from qry_statistics where MaxSt=@MaxSt
)
select * from cte



end
if @SemesterID !=0 AND @SessionID=0
begin
with cte as (
select top(@StartIndex + @PageSize -1) * from qry_statistics where MaxSt=@MaxSt AND SemesterID=@SemesterID
)
select * from cte



end
if @SemesterID !=0 AND @SessionID!=0
begin
with cte as (
select top(@StartIndex + @PageSize -1) * from qry_statistics where MaxSt=@MaxSt AND SemesterID=@SemesterID AND SessionID=@SessionID
)
select * from cte



end





END
GO
/****** Object:  StoredProcedure [dbo].[GetUserManagement]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUserManagement](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
select @TotalCount=count(1) from qry_usermanagement;
IF @Search =0
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID,  DepartmentName as [Department], StaffID as [Staff ID.], [Staff Name], UserName, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_usermanagement
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else 
begin
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID,  DepartmentName as [Department], StaffID as [Staff ID.], [Staff Name], UserName, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_usermanagement where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
END
GO
/****** Object:  StoredProcedure [dbo].[GetVice]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetVice](@StartIndex int, @PageSize int, @Search int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qry_vice;
if @Search =0
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, Department, StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_vice
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
else
begin
with CTE AS 
(
select top(@StartIndex + @PageSize -1) [S/N] as RowNumber, RecID, Department,  StaffID as [Staff ID], [Staff Name], Active Remark, CreatedDate as [Created Date], CreatedTime as [Created Time] from qry_vice where DepartmentID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[myStoredProc]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[myStoredProc]
AS
BEGIN
Declare @colList varchar(max)
Declare @qry varchar(max)

SET @colList = STUFF((SELECT distinct ',' + QUOTENAME(c.course_id) 
            FROM qry_pivot_Score c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @qry = 'SELECT Names, matric_no,'+@colList+'
FROM (
    SELECT Names, matric_no,course_id,Total

    FROM qry_pivot_Score where StLevel=4 
) as s
PIVOT
(
    MAX(Total)
    FOR course_id IN (' + @colList + ') 
) pvt '

EXEC(@qry)
end
GO
/****** Object:  StoredProcedure [dbo].[studentReport]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[studentReport] 
(  
    @SessionID int 
	
)  
AS  
  
BEGIN  
      
    SET NOCOUNT ON;  
      
    --Parameter will hold the Pivoted Column values  
    DECLARE @Cols AS NVARCHAR(MAX)  
      
    --Parameter will hold the dynamically created SQL script  
    DECLARE @Query  AS NVARCHAR(MAX)   
      
    SELECT DISTINCT CourseID INTO #TmpSubject FROM qry_report_Result WITH(NOLOCK)  
      
    SELECT @Cols = STUFF  
    (  
        (  
            SELECT DISTINCT ',' + QUOTENAME(CourseCode +'|'+ CourseUnit)   
                FROM qry_report_Result WITH(NOLOCK), #TmpSubject  
                WHERE SessionID = @SessionID  
                GROUP BY CourseCode,CourseUnit  
                FOR XML PATH(''), Type  
        ).value('.', 'NVARCHAR(MAX)'  
    ),1,1,'')  
  
    SET @Query = N'SELECT MatricNo, ' + @Cols + N' FROM   
        (  
            SELECT MatricNo, CourseCode +''|''+ CourseUnit as Subjects  
            FROM qry_report_Result WITH(NOLOCK)  
        ) x  
        PIVOT   
        (  
            SUM(Total)  
            FOR CourseID IN (' + @Cols + N')  
        ) p '  
  
    EXEC SP_EXECUTESQL @Query  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[StudentReports]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudentReports]
AS
BEGIN
    DECLARE @cols NVARCHAR(MAX), @sql NVARCHAR(MAX)

    SET @cols = STUFF((SELECT DISTINCT ',' + QUOTENAME(c.course_id)
                FROM qryLineReport c
                WHERE Not(c.course_id = '') AND StLevel=4
                ORDER BY 1
                FOR XML PATH(''), TYPE
                ).value('.', 'NVARCHAR(MAX)'),1,1,'')

    SET @sql = '
                SELECT distinct Names, matric_no, '+@cols+', [BF Total Credit], 
	[BF Total Grade], [BF Grade Point], [Current Total Credit], [Current Grade], [Current Grade Point]
FROM (
    SELECT Names, matric_no,course_id,Total,[BF Total Credit], 
	[BF Total Grade], [BF Grade Point], [Current Total Credit], [Current Grade], [Current Grade Point]

    FROM qryLineReport where StLevel=4
) as s
PIVOT
(
    MAX(Total)
    FOR course_id IN (' + @cols + ') 
) pvt'

execute (@sql)


END


GO
/****** Object:  StoredProcedure [dbo].[USP_StudentReport]    Script Date: 9/9/2021 8:44:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_StudentReport]  
(  
    @SessionID VARCHAR(20) = ''  
)  
AS  
  
BEGIN  
      
    SET NOCOUNT ON;  
      
    --Parameter will hold the Pivoted Column values  
    DECLARE @Cols AS NVARCHAR(MAX)  
      
    --Parameter will hold the dynamically created SQL script  
    DECLARE @Query  AS NVARCHAR(MAX)   
      
    SELECT DISTINCT course_id INTO #TmpSubject FROM tbl_course_registration WITH(NOLOCK)  
      
    SELECT @Cols = STUFF  
    (  
        (  
            SELECT DISTINCT ',' + QUOTENAME(course_title +'/'+ course_code)   
                FROM tbl_course_registration WITH(NOLOCK), #TmpSubject  
                WHERE session_id = @SessionID  
                GROUP BY course_title,course_code  
                FOR XML PATH(''), Type  
        ).value('.', 'NVARCHAR(MAX)'  
    ),1,1,'')  
  
    SET @Query = N'SELECT matric_no, ' + @Cols + N' FROM   
        (  
            SELECT matric_no, course_title +''/''+ course_code as Subjects  
            FROM tbl_course_registration WITH(NOLOCK)  
        ) x  
        PIVOT   
        (  
            SUM(exam)  
            FOR course_id IN (' + @Cols + N')  
        ) p '  
  
    EXEC SP_EXECUTESQL @Query  
  
END  
GO
