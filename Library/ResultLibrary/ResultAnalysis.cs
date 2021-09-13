using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;

namespace ResultLibrary
{
    public partial class SysAdminModel : _Database
    {
        public string chartGender = string.Empty;
        public string chartMaritalStatus = string.Empty;
        public string chartResult = string.Empty;
        public void SerializeGenderType(string CourseID, string SessionID)
        {
            
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
                con.Open();
                SqlCommand comm = new SqlCommand("select case when gender='F' AND y='FAILED' then 'FEMALE THAT FAILED' WHEN gender='F' AND y='PASSED' then 'FEMALE THAT PASSED' WHEN gender='M' and Y='FAILED' THEN 'MALE THAT FAILED' WHEN gender='M' AND y='PASSED' then 'MALE THAT PASSED' end as name, count(y) as y from (select gender, case when y<=0 then 'FAILED' when y>=1 then 'PASSED' end as y from (select gender, case when Total >=45 then count(*) else 0 end as y from qry_statistics where CourseID='" + CourseID  + "' AND SessionID='" + SessionID + "' group by gender, Total) as qry2) as qry3 group by gender, y order by count(gender)", con);
                DataTable dt = new DataTable();
                dt.Load(comm.ExecuteReader());
            chartGender = JsonConvert.SerializeObject(dt);
           
        }
        public void SerializeMaritalStatus(string CourseID, string SessionID)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
            con.Open();
            SqlCommand comm = new SqlCommand("select case when MaritalStatus='SINGLE' AND y='FAILED' then 'SINGLE THAT FAILED' WHEN MaritalStatus='SINGLE' AND y='PASSED' then 'SINGLE THAT PASSED' WHEN MaritalStatus='MARRIED' and Y='FAILED' THEN 'MARRIED THAT FAILED' WHEN MaritalStatus='MARRIED' AND y='PASSED' then 'MARRIED THAT PASSED' end as name, count(y) as y from (select MaritalStatus, case when y<=0 then 'FAILED' when y>=1 then 'PASSED' end as y from (select MaritalStatus, case when Total >=45 then count(*) else 0 end as y from qry_statistics WHERE CourseID='" + CourseID  + "' AND SessionID='" + SessionID  + "'  group by MaritalStatus, Total) as qry2) as qry3 group by MaritalStatus, y order by count(MaritalStatus)", con);
            DataTable dt = new DataTable();
            dt.Load(comm.ExecuteReader());
            chartMaritalStatus  = JsonConvert.SerializeObject(dt);

        }
        public void SerializeResultPercentage(string CourseID, string SessionID)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
            con.Open();
            SqlCommand comm = new SqlCommand("select name, count(*) as y from (select case when Total >=70 then 'Students above 70% score' when Total >=60 then 'Students above 60 to 69% score' when Total >=50 then 'Students above 50 to 59% score' when Total >=45 then 'Students above 45 to 49% score' when Total <=44 then 'Students that failed' else 'Students that failed' end  as name from qry_statistics where CourseID='" + CourseID  + "' AND SessionID='" + SessionID  + "') as qryStat group by name order by count(name)", con);
            DataTable dt = new DataTable();
            dt.Load(comm.ExecuteReader());
            chartResult  = JsonConvert.SerializeObject(dt);

        }
        public void SerializeStudentResultPercentage(string SemesterID, string SessionID, string MaxID)
        {

            if (SemesterID == "0")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
                con.Open();
                SqlCommand comm = new SqlCommand("select name, count(*) as y from (select case when Total >=70 then 'Your score above 70% score' when Total >=60 then 'Your score above 60 to 69% score' when Total >=50 then 'Your score above 50 to 59% score' when Total >=45 then 'Your score above 45 to 49% score' when Total <=44 AND Total >0 then 'You failed' else 'No score was recorded for one or more courses' end  as name from qry_statistics) as qryStat group by name order by count(name)", con);
                DataTable dt = new DataTable();
                dt.Load(comm.ExecuteReader());
                chartResult = JsonConvert.SerializeObject(dt);
            }
            else if (SemesterID != "0")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
                con.Open();
                SqlCommand comm = new SqlCommand("select name, count(*) as y from (select case when Total >=70 then 'Your score above 70% score' when Total >=60 then 'Your score above 60 to 69% score' when Total >=50 then 'Your score above 50 to 59% score' when Total >=45 then 'Your score above 45 to 49% score' when Total <=44 AND Total >0 then 'You failed' else 'No score was recorded for one or more courses' end  as name from qry_statistics where SemesterID='" + SemesterID + "'  AND MaxSt='" + MaxID + "') as qryStat group by name order by count(name)", con);
                DataTable dt = new DataTable();
                dt.Load(comm.ExecuteReader());
                chartResult = JsonConvert.SerializeObject(dt);
            }
            else if (SessionID != "0")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
                con.Open();
                SqlCommand comm = new SqlCommand("select name, count(*) as y from (select case when Total >=70 then 'Your score above 70% score' when Total >=60 then 'Your score above 60 to 69% score' when Total >=50 then 'Your score above 50 to 59% score' when Total >=45 then 'Your score above 45 to 49% score' when Total <=44 AND Total >0 then 'You failed' else 'No score was recorded for one or more courses' end  as name from qry_statistics where SemesterID='" + SemesterID + "' AND SessionID='" + SessionID + "' AND MaxSt='" + MaxID + "') as qryStat group by name order by count(name)", con);
                DataTable dt = new DataTable();
                dt.Load(comm.ExecuteReader());
                chartResult = JsonConvert.SerializeObject(dt);
            }

        }

    }
}
