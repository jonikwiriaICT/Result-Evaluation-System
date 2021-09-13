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
     
        public bool functionStudent(string RecID , string ProgramID, string LevelID, string MatricNo,string FirstName, string MiddleName, string LastName,string Email, string TelephoneNo, string Gender, string MaritalStatus,string ProfilePic,string ActiveType)
        {
            try
            {

                string sSQL = "functionStudent";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@ProgramID", ProgramID );
                objCmd.Parameters.AddWithValue("@LevelID", LevelID);
                objCmd.Parameters.AddWithValue("@MatricNo", MatricNo);
                objCmd.Parameters.AddWithValue("@FirstName", FirstName);
                objCmd.Parameters.AddWithValue("@MiddleName", MiddleName);
                objCmd.Parameters.AddWithValue("@LastName", LastName);
                objCmd.Parameters.AddWithValue("@Email", Email);
                objCmd.Parameters.AddWithValue("@TelephoneNo", TelephoneNo);
                objCmd.Parameters.AddWithValue("@Gender", Gender);
                objCmd.Parameters.AddWithValue("@MaritalStatus", MaritalStatus);
                objCmd.Parameters.AddWithValue("@ProfilePic", ProfilePic);
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
        public DataSet GetProgram()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Programs' as [Desc] union select program_id as [Code], program_title as [Desc] from tbl_program";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetStudentSemester()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code],'All Semester' as [Desc] union select semester_id as [Code], semester_name as [Desc] from tbl_Semester";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetStudentSession()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code],'All Session' as [Desc] union select session_id as [Code], session_year_from + '/' + session_year_to as [Desc] from tbl_session";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetLevel()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Levels' as [Desc] union select level_id as [Code], level_name as [Desc] from tbl_level";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

        public DataTable GetStudentToExcel(string ProgramID, string LevelID)
        {

            if (ProgramID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("SELECT * from qry_student ", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if(ProgramID !="0" && LevelID =="0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_student where ProgramID='" + ProgramID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( LevelID != "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_student where ProgramID='" + ProgramID  + "' AND LevelID='" + LevelID + "'", conn))
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
                using (var cmd = new SqlCommand("select * from qry_student where ProgramID='" + ProgramID + "' AND LevelID='" + LevelID + "'", conn))
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
