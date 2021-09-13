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
        public bool functionAssignCourse(string RecID, string CourseID, string StaffID, string SessionID, string ActiveType)
        {
            try
            {

                string sSQL = "functionAssignCourses";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@CourseID", CourseID );
                objCmd.Parameters.AddWithValue("@StaffID", StaffID );
                objCmd.Parameters.AddWithValue("@SessionID", SessionID );
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

        public DataSet GetStaff()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Staffs' as [Desc] union select staff_id as [Code], firstname + ' ' + middlename + ' ' + lastname as [Desc] from tbl_staff";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetCourse()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Courses' as [Desc] union select course_id as [Code], course_title + course_code + ':  '  + '   '  + course_name as [Desc] from tbl_course";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetSession()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Sessions' as [Desc] union select session_id as [Code], session_year_from + '/' + session_year_to as [Session] from tbl_session";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }




        public DataTable getAssignCourseToExcel(string StaffID, string CourseID, string SessionID)
        {
            if(StaffID == "0")
            {

                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_assign_course", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if(StaffID !="0" && CourseID =="0" && SessionID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_assign_course where StaffID='" + StaffID + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( CourseID != "0" && SessionID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_assign_course where StaffID='" + StaffID + "' AND CourseID='" + CourseID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( SessionID != "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_assign_course where StaffID='" + StaffID + "' AND CourseID='" + CourseID + "' AND SessionID='" + SessionID + "'", conn))
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
                using (var cmd = new SqlCommand("select * from qry_assign_course where StaffID='" + StaffID + "' AND CourseID='" + CourseID + "' AND SessionID='" + SessionID + "'", conn))
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
