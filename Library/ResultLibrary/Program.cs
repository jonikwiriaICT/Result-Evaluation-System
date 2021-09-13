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
        public bool functionProgram(string RecID, string DepartmentID, string ProgramTitle,  string ActiveType)
        {
            try
            {

                string sSQL = "functionProgram";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                objCmd.Parameters.AddWithValue("@ProgramTitle", ProgramTitle);


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
        public DataSet GetDepartment()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select 0 as [Code], 'All Departments' as [Desc] union select department_id as [Code], department_name as [Desc] from tbl_department";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataTable getProgramInfoToExcel(string departmentID)
        {

            if (departmentID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select  row_number() over (order by p.rec_id) as [S/N], p.rec_id as [RecID], d.department_name as [Department], p.program_title as [Program], p.created_date as [Created Date], p.created_time as [Created Time]  from tbl_program p join tbl_department d on d.department_id=p.department_id", conn))
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
                using (var cmd = new SqlCommand("select  row_number() over (order by p.rec_id) as [S/N], p.rec_id as [RecID], d.department_name as [Department], p.program_title as [Program], p.created_date as [Created Date], p.created_time as [Created Time]  from tbl_program p join tbl_department d on d.department_id=p.department_id where d.department_id='" + departmentID + "'", conn))
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
