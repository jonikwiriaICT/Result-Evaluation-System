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
        public DataTable DownloadAnalysis(string CourseID, string SessionID)
        {



            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
            using (var cmd = new SqlCommand("select * from qry_statistics WHERE CourseID='" + CourseID  + "' AND SessionID='" + SessionID  + "'", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var teacher = new DataTable();
                adapter.Fill(teacher);
                return teacher;
            }


        }
        public DataTable DownloadStudentAnalysis(string MaxSt, string SemesterID, string SessionID)
        {

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
            using (var cmd = new SqlCommand("select * from qry_statistics WHERE MaxSt='" + MaxSt  + "' AND SemesterID='" + SemesterID  + "' AND SessionID='" + SessionID + "'", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var teacher = new DataTable();
                adapter.Fill(teacher);
                return teacher;
            }

        }
        public DataTable getMyCourse(string staffID)
        {

            

                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_input_view WHERE StaffID='" + staffID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            
        }
        public bool ValidateMyCourse(string staffID)
        {

            try
            {
                DataSet ds = new DataSet();
                string sSQL = "select * from qry_input_view WHERE StaffID=@StaffID";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@StaffID", staffID);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {

                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

        public bool ValidateInputScore(string staffID, string SessionID, string CourseID)
        {

            try
            {
                DataSet ds = new DataSet();
                string sSQL = "select * from qry_input_view WHERE StaffID=@StaffID AND CourseID=@CourseID AND SessionID=@SessionID";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@StaffID", staffID);
                objCmd.Parameters.AddWithValue("@CourseID", CourseID );
                objCmd.Parameters.AddWithValue("@SessionID", SessionID );
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {

                    return false;
                }

                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

    }
}
