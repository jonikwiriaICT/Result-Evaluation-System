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
        public DataTable getInputScores(string CourseID, string SessionID)
        {

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
            using (var cmd = new SqlCommand(" select MaxSt, MatricNumber, firstCa as [First CA (10%)], secondCa AS [Second CA (10%)], thirdCa as [Third CA (10%)], Exam as [Exam (70%)] from qry_input_score where CourseID='" + CourseID + "' and SessionID='" + SessionID + "'", conn))
            using (var adapter = new SqlDataAdapter(cmd))
            {
                var teacher = new DataTable();
                adapter.Fill(teacher);
                return teacher;
            }

        }
        public bool functionInputScore(string CourseID,  string SessionID , string MaxSt, string firstCa , string secondCa, string thirdCa, string Exam, string ActiveType)
        {
            try
            {

                string sSQL = "functionInputScore";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@CourseID", CourseID);
                objCmd.Parameters.AddWithValue("@SessionID", SessionID);
                objCmd.Parameters.AddWithValue("@MaxSt", MaxSt);
                objCmd.Parameters.AddWithValue("@firstCa", firstCa);
                objCmd.Parameters.AddWithValue("@secondCa", secondCa);
                objCmd.Parameters.AddWithValue("@thirdCa", thirdCa);
                objCmd.Parameters.AddWithValue("@Exam", Exam);
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

    }
}
