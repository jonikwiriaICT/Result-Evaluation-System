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
        public string department_id;
        public string staff_id;
        public string firstname;
        public string middlename;
        public string lastname;
        public string email;
        public string Telephone_no;
        public string gender;
        public string marital_status;
        public string staff_description;
        public string title;
        public string position;
        public string profile_pic;
        public bool GetStaff(string username)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_staff WHERE [staff_id]=@username ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@username", username);
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage = "Invalid User. Contact Administrator.";
                    return false;
                }
                department_id  = ds.Tables[0].Rows[0]["department_id"].ToString();
                staff_id  = ds.Tables[0].Rows[0]["staff_id"].ToString();
                firstname  = ds.Tables[0].Rows[0]["firstname"].ToString();
                middlename  = ds.Tables[0].Rows[0]["middlename"].ToString();
                lastname  = ds.Tables[0].Rows[0]["lastname"].ToString();
                email  = ds.Tables[0].Rows[0]["email"].ToString();
                Telephone_no = ds.Tables[0].Rows[0]["Telephone_no"].ToString();
                gender  = ds.Tables[0].Rows[0]["gender"].ToString();
                marital_status = ds.Tables[0].Rows[0]["marital_status"].ToString();
                staff_description = ds.Tables[0].Rows[0]["staff_description"].ToString();
                title  = ds.Tables[0].Rows[0]["title"].ToString();
                Position = ds.Tables[0].Rows[0]["position"].ToString();
                profile_pic  = ds.Tables[0].Rows[0]["profile_pic"].ToString();


                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }
        public bool functionStaff(string rec_id, string department_id, string staff_id, string firstname, string middlename, string lastname, string email, string Telephone_no, string gender, string marital_status, string staff_description, string title, string position, string profile_pic, string ActiveType)
        {
            try
            {

                string sSQL = "functionStaff";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", rec_id);
                objCmd.Parameters.AddWithValue("@DepartmentID", department_id );
                objCmd.Parameters.AddWithValue("@StaffID", staff_id);
                objCmd.Parameters.AddWithValue("@FirstName", firstname );
                objCmd.Parameters.AddWithValue("@MiddleName", middlename );
                objCmd.Parameters.AddWithValue("@Lastname", lastname );
                objCmd.Parameters.AddWithValue("@Email", email);
                objCmd.Parameters.AddWithValue("@TelephoneNo", Telephone_no);
                objCmd.Parameters.AddWithValue("@Gender", gender );
                objCmd.Parameters.AddWithValue("@MaritalStatus", marital_status );
                objCmd.Parameters.AddWithValue("@Description", staff_description );
                objCmd.Parameters.AddWithValue("@Title", title );
                objCmd.Parameters.AddWithValue("@Position", position );
                objCmd.Parameters.AddWithValue("@ProfilePic", profile_pic );
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


        public DataTable GetStaffToExcel(string DepartmentID)
        {

            if (DepartmentID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_staff ", conn))
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
                using (var cmd = new SqlCommand("select * from qry_staff where DepartmentID='" + DepartmentID  + "'", conn))
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
