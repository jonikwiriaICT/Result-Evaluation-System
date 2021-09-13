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
        public string sUsername = string.Empty;
        public string administrator = string.Empty;
        public string vice = string.Empty;
        public string dean = string.Empty;
        public string hod = string.Empty;
        public string lecturer = string.Empty;
        public string examofficer = string.Empty;
        public string password = string.Empty;
        public string Email = string.Empty;
        public string Pic = string.Empty;
        public string Name = string.Empty;
        public string Position = string.Empty;

        public bool functionUserManagementss(string RecID,string StaffID , string Username, string Vice, string ExamOfficer, string Lecturer, string Hod, string Administrator, string Dean , string Password, string ActiveType)
        {
            try
            {

                string sSQL = "functionUserManagementss";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@StaffID", StaffID);
                objCmd.Parameters.AddWithValue("@Username", Username);
                objCmd.Parameters.AddWithValue("@Vice", Vice);
                objCmd.Parameters.AddWithValue("@ExamOfficer", ExamOfficer);
                objCmd.Parameters.AddWithValue("@Lecturer", Lecturer);
                objCmd.Parameters.AddWithValue("@Hod", Hod);
                objCmd.Parameters.AddWithValue("@Administrator", Administrator);
                objCmd.Parameters.AddWithValue("@Dean", Dean );
                objCmd.Parameters.AddWithValue("@Password", password );
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
        public DataTable GetUserManagementToExcel(string DepartmentID)
        {

            if (DepartmentID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_usermanagement", conn))
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
                using (var cmd = new SqlCommand("select * from qry_usermanagement where DepartmentID='" + DepartmentID  + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }

        }
        public DataSet GetStaffByDepartment(string departmentID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select st.staff_id as [Code], st.staff_id + ':' + ' ' + st.firstname + ' ' + st.middlename + ' ' +  st.lastname as [Desc] from tbl_staff st inner join tbl_department dp on dp.department_id = st.department_id WHERE dp.department_id = '" + departmentID  + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public bool getClientProfile(string username, string sPassword)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_usermanagement WHERE [username]=@username ";
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
                sPasswordDB = ds.Tables[0].Rows[0]["pass"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";

                }
                else
                {

                    sPasswordDB = Decrypt(sPasswordDB);
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                sUsername = ds.Tables[0].Rows[0]["staff_id"].ToString();
                administrator = ds.Tables[0].Rows[0]["administrator"].ToString();
                dean = ds.Tables[0].Rows[0]["dean"].ToString();
                vice = ds.Tables[0].Rows[0]["vice"].ToString();
                hod = ds.Tables[0].Rows[0]["hod"].ToString();
                lecturer = ds.Tables[0].Rows[0]["lecturer"].ToString();
                examofficer = ds.Tables[0].Rows[0]["exam_officer"].ToString();
                password = sPasswordDB;

                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }

        public bool GetStudentDetails(string username, string sPassword)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_student WHERE mt_id=@username ";
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
                sPasswordDB = ds.Tables[0].Rows[0]["user_password"].ToString();
                if (sPasswordDB.Trim() == string.Empty)
                {
                    ErrorMessage = "Password Not found in the database.";

                }
                else
                {

                    sPasswordDB = Decrypt(sPasswordDB);
                    if (sPassword != sPasswordDB)
                    {
                        ErrorMessage = "Invalid password.";
                        return false;
                    }
                }
                sUsername = ds.Tables[0].Rows[0]["matric_no"].ToString();

                password = ds.Tables[0].Rows[0]["user_password"].ToString();

                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }




        public bool ValidateAssignCourse(string staffID, string CourseID, string sessionID)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_assign_course WHERE staff_id=@StaffID AND course_id=@courseID AND session_id=@SessionID ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@StaffID", staffID);
                objCmd.Parameters.AddWithValue("@courseID", CourseID);
                objCmd.Parameters.AddWithValue("@SessionID", sessionID);
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

        public bool ValidateCourseRegistration(string courseID, string sessionID, string matricNo)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM tbl_course_registration WHERE course_id=@courseID AND session_id=@sessionID AND matric_no=@matricNo ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@courseID", courseID);
                objCmd.Parameters.AddWithValue("@sessionID", sessionID);
                objCmd.Parameters.AddWithValue("@matricNo", matricNo);
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

        public bool GetIdentity(string username)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM qry_identity WHERE [User]=@username ";
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
              
                
                Email = ds.Tables[0].Rows[0]["Email"].ToString();
                Pic = ds.Tables[0].Rows[0]["Pic"].ToString();
                Name = ds.Tables[0].Rows[0]["Name"].ToString();
                Position = ds.Tables[0].Rows[0]["Position"].ToString();


                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = "No Login Connection.";
                return false;
            }
        }



        public bool GetStudentIdentity(string username)
        {

            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "SELECT * FROM qry_StudentIdentity WHERE [User]=@username ";
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


                Email = ds.Tables[0].Rows[0]["Email"].ToString();
                Pic = ds.Tables[0].Rows[0]["Pic"].ToString();
                Name = ds.Tables[0].Rows[0]["Name"].ToString();
                Position = ds.Tables[0].Rows[0]["Position"].ToString();


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
