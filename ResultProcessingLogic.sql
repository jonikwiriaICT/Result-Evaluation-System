SELECT *
FROM  qry_report_Result 
PIVOT
(
    SUM(Total)
    FOR CourseCode IN ( [CSC219], [CSC218])
) piv where SessionID !=( select max(SessionID) from qry_report_Result)

alter view qry_report1 as select *  from (select RecID, DepartmentName,DepartmentID, ProgramID,ProgramTitle, StudentName, MatricNo, CourseID, CourseName, CourseUnit, CourseCode, LevelID, LevelName, SemesterID, SemesterName, SessionID, [Session], max(SessionID) as [MaxSessionID], min(SessionID) as [MinSessionID], Total from (select r.rec_id as [RecID], d.department_name as [DepartmentName],
 d.department_id as [DepartmentID], p.program_id as [ProgramID],p.program_title as [ProgramTitle],
  st.firstname + ' ' + st.middlename + ' ' + st.lastname as [StudentName], st.gender as [Gender],
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
join tbl_level l on l.level_id=c.level_id group by r.rec_id, d.department_name, d.department_id, p.program_id, st.gender,`
 p.program_title, st.firstname, st.middlename, st.lastname, st.matric_no, r.course_id, c.course_name, c.course_unit, c.course_title, c.course_code, st.level_id, l.level_name, se.semester_id, se.semester_name, sem.session_id, sem.session_year_from, sem.session_year_to, r.firstca, r.secondca, r.thirdca, r.exam) as qry1 group by  RecID, DepartmentName,DepartmentID, ProgramID,ProgramTitle, StudentName, MatricNo, CourseID, 
CourseName, CourseUnit, CourseCode, LevelID, LevelName, 
SemesterID, SemesterName, SessionID, [Session], Total) as qry4

select * from qry_report1

alter view qryCurrentGrade as select MatricNo, SessionID, SemesterID, TotalCredit, TotalGrade, convert(decimal(18,2), convert(float, TotalGrade) /convert(float,TotalCredit) ) as [TotalGp] from ( SELECT MatricNo, SessionID, SemesterID, sum(convert(int,CourseUnit))  as [TotalCredit], case
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

update tbl_course_registration set flag_on=0

select * from qry_input_score


alter view qryBroughtForward as select MatricNo, TotalCredit, TotalGrade, convert(decimal(18,2), convert(float, TotalGrade) / convert(float,TotalCredit) ) as [TotalGp] from (SELECT MatricNo, sum(convert(int,CourseUnit))  as [TotalCredit], case
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



alter view qry_report_Result as select r.RecID, r.DepartmentName,  r.DepartmentID,  r.ProgramID,  r.ProgramTitle,  r.StudentName,  r.MatricNo,  r.CourseID,  r.CourseName,  r.CourseCode,  r.LevelID,  r.LevelName,  r.SemesterID,  r.SemesterName, 
 r.SessionID,  r.Session, r.CourseUnit as [CourseUnit], r.Total as [Total], c.TotalCredit as [CurrentCredit], c.TotalGrade as [CurrentGrade], c.TotalGp as [TotalGradePoint], b.TotalCredit as [BroughtForwardCredit], b.TotalGrade as [BroughtForwardGrade], b.TotalGp as [BroughtForwardTotalGradePoint] from qry_report1 r

full join qryBroughtForward b on b.MatricNo=r.MatricNo AND b.SessionID=r.SessionID

full join qryCurrentGrade c on c.SemesterID=r.SemesterID AND c.SessionID=r.SessionID AND c.MatricNo=r.MatricNo

select DISTINCT MatricNo, C_SessionID, C_SemesterID, C_TotalCredit, C_TotalGrade, C_TotalGradePoint, BF_TotalCredit, BF_TotalGrade, BF_TotalGradePoint, CumulativeCredit, CumulativeGrade, CONVERT(decimal(18,2), convert(float, CumulativeGrade) / convert(float,CumulativeCredit)) as [CumulativeGP] from (select MatricNo, C_SessionID, C_SemesterID, C_TotalCredit, C_TotalGrade, C_TotalGradePoint, BF_TotalCredit, BF_TotalGrade, BF_TotalGradePoint, BF_TotalCredit +C_TotalCredit as [CumulativeCredit], BF_TotalGrade + C_TotalGrade as [CumulativeGrade] from (select b.MatricNo, c.SessionID as [C_SessionID], c.SemesterID as [C_SemesterID], c.TotalCredit as [C_TotalCredit], c.TotalGrade as [C_TotalGrade], c.TotalGp as [C_TotalGradePoint], b.TotalCredit as [BF_TotalCredit], b.TotalGrade as [BF_TotalGrade], b.TotalGp as [BF_TotalGradePoint]  from qryBroughtForward b

join qryCurrentGrade c on c.MatricNo=b.MatricNo) as qry3) as qry4 

select * from tbl_course_registration
update tbl_course_registration set exam=56 