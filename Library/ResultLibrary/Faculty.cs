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
    public partial class SysAdminModel:_Database
    {
        public bool functionFaculty( string RecID, string FacultyCode, string FacultyName, string FacultyDescription, string ActiveType)
        {
            try
            {

                string sSQL = "functionFaculty";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@FacultyCode", FacultyCode);
                objCmd.Parameters.AddWithValue("@FacultyName", FacultyName);
                objCmd.Parameters.AddWithValue("@FacultyDescription", FacultyDescription);
           
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


        public DataSet LoadFaculty(string ddlSelect)
        {
            try
            {
                if (ddlSelect == "0")
                {
                    SqlCommand objCmd = new SqlCommand();
                    string sSQL = "select ROW_NUMBER() over (order by faculty_id) as [S/N], faculty_id as [RecID],  faculty_name as [Faculty Name], faculty_code as [Faculty Code], faculty_description as [Description], create_date as [Registered Date], create_time as [Registered Time] from tbl_faculty";
                    objCmd.CommandText = sSQL;
                    return ExecuteDataSet(objCmd);
                }
                else
                {
                    SqlCommand objCmd = new SqlCommand();
                    string sSQL = "select ROW_NUMBER() over (order by faculty_id) as [S/N], faculty_id as [RecID], faculty_name as [Faculty Name], faculty_code as [Faculty Code], faculty_description as [Description], create_date as [Registered Date], create_time as [Registered Time] from tbl_faculty where faculty_id='" + ddlSelect + "'";
                    objCmd.CommandText = sSQL;
                    return ExecuteDataSet(objCmd);
                }
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet LoadFacultyDropDown()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "SELECT '0' as [Code], 'ALL' as [Desc] union select convert( varchar, faculty_id) as [Code], faculty_name as [Desc] from tbl_faculty";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


        public DataTable getfacultyInfoToExcel()
        {
            
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select ROW_NUMBER() over (order by faculty_id) as [S/N], faculty_id as [RecID],  faculty_name as [Faculty Name], faculty_code as [Faculty Code], faculty_description as [Description], created_date as [Registered Date], created_time as [Registered Time] from tbl_faculty", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            
        }
    }
}
