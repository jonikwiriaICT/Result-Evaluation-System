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
        public bool functionDepartment(string RecID, string FacultyID, string DepartmentName, string DepartmentCode, string DepartmentDescription, string ActiveType)
        {
            try
            {

                string sSQL = "functionDepartment";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@FacultyID", FacultyID );
                objCmd.Parameters.AddWithValue("@DepartmentName", DepartmentName);
                objCmd.Parameters.AddWithValue("@DepartmentCode", DepartmentCode );
                objCmd.Parameters.AddWithValue("@DepartmentDescription", DepartmentDescription);

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
        public DataSet GetSemester()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select 0 as [Code], 'All Semesters' as [Desc] union select semester_id as [Code], semester_name as [Desc] from tbl_semester";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

        public DataSet GetStaffByDepartmentPro(string DepartmentID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select staff_id as [Code], convert(varchar,staff_id) + ':  ' + ' ' + firstname + '  ' + middlename + '  ' + lastname as [Desc] from tbl_staff where department_id='" + DepartmentID  + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetTeacherView()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = " select * from qry_input_view order by SessionID DESC";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

        public DataSet getInputScore(string CourseID, string SessionID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = " select * from qry_input_score where CourseID='" + CourseID + "' and SessionID='" + SessionID  + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }


        public DataSet GetMatricNumber(string CourseID)
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Students' as [Desc] union select distinct st.matric_no as [Code], convert(varchar,st.matric_no) + ': ' + ' ' + st.firstname + ' ' + st.middlename + ' ' + st.lastname as [Desc] from tbl_student st inner join tbl_program pg on pg.program_id=st.program_id inner join tbl_department dp on dp.department_id=pg.department_id inner join tbl_course co on co.department_id=dp.department_id where co.course_id='" + CourseID + "'";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetFaculty()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select 0 as [Code], 'All Faculties' as [Desc] union select faculty_id as [Code], faculty_name as [Desc] from tbl_faculty";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataTable getDepartmentInfoToExcel(string FacultyID)
        {

            if (FacultyID == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select  row_number() over (order by RecID) as [S/N], Faculty, Department, [Department Code], [Created Date], [Created Time] from qry_DepartmentByFaculty ", conn))
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
                using (var cmd = new SqlCommand("select  row_number() over (order by RecID) as [S/N], Faculty, Department, [Department Code], [Created Date], [Created Time] from qry_DepartmentByFaculty where FacultyID='" + FacultyID + "'", conn))
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
