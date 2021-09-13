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
        public string Vice = "functionVice";
        public string Registrar = "functionRegistrar";
        public string Dean = "functionDean";
        public string Hod = "functionHod";
        public string ExamOfficer = "functionExamOfficer";

        public string GetVice = "GetVice";
        public string GetRegistrar = "GetRegistrar";
        public string GetDean = "GetDean";
        public string GetHod = "GetHod";
        public string GetExamOfficer = "GetExamOfficer";
        public bool functionProcedure(string RecID, string StaffID, string Signature, string Active, string ActiveType, string Parameter)
        {
            try
            {

                string sSQL = Parameter ;
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@StaffID", StaffID );
                objCmd.Parameters.AddWithValue("@Signature", Signature );
                objCmd.Parameters.AddWithValue("@Active", Active );
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

        public DataTable GetProToExcel(string DepartmentID, string sView)
        {

            if (DepartmentID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from " + sView + " ", conn))
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
                using (var cmd = new SqlCommand("select * from " + sView + " where DepartmentID='" + DepartmentID + "'", conn))
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
