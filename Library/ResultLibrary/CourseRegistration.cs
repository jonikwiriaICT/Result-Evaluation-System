using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ResultLibrary
{
    public partial class SysAdminModel : _Database
    {
        public bool functionCourseRegistration(string RecID, string CourseID, string MatricNo , string SessionID, string ActiveType)
        {
            try
            {

                string sSQL = "functionCourseRegistration";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@CourseID", CourseID);
                objCmd.Parameters.AddWithValue("@MatricNo", MatricNo);
                objCmd.Parameters.AddWithValue("@SessionID", SessionID);
                objCmd.Parameters.AddWithValue("@StatementType", ActiveType);
                con.Close();
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to process transaction";
                    return false;
                }
                ErrorMessage = "Record executed successfully .";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }





        public DataTable getDataToUpload( string CourseID)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
            using (var cmd = new SqlCommand("select distinct row_number() over (order by st.matric_no) as [S/N], st.matric_no as [Code], st.mt_id as [Matric Number],  st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Student Name] from tbl_student st inner join tbl_program pg on pg.program_id=st.program_id inner join tbl_department dp on dp.department_id=pg.department_id inner join tbl_course co on co.department_id=dp.department_id where co.course_id='" + CourseID  + "'", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var teacher = new DataTable();
                adapter.Fill(teacher);
                return teacher;
            }
        }

        public DataTable GetCourseRegistrationToExcel(string CourseID, string SessionID, string MatricNo)
        {
            if (CourseID == "0")
            {

                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course_registration", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if (CourseID  != "0" && SessionID  == "0" && MatricNo  == "0" )
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course_registration where CourseID='" + CourseID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if (SessionID != "0" && MatricNo  == "0" )
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course_registration where CourseID='" + CourseID + "' AND SessionID='" + SessionID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( MatricNo  != "0" )
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course_registration where CourseID='" + CourseID + "' AND SessionID='" + SessionID + "' AND MatricNo='" + MatricNo   + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
           
            else
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course_registration where CourseID='" + CourseID + "' AND SessionID='" + SessionID + "' AND MatricNo='" + MatricNo  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }


        }
    }
}
