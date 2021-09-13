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
        public bool functionSemester(string RecID, string SemesterName, string ActiveType)
        {
            try
            {

                string sSQL = "functionSemester";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@SemesterName", SemesterName);
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


       
       

        public DataTable getSemesterToExcel()
        {

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
            using (var cmd = new SqlCommand("select row_number() over (order by rec_id) as [S/N], semester_name as [Semester], created_date as [Created Date], created_time as [Created Time] from tbl_semester", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var teacher = new DataTable();
                adapter.Fill(teacher);
                return teacher;
            }

        }
    }
}
