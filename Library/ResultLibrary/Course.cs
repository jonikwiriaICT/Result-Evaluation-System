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
        public bool functionCourse(string RecID, string DepartmentID, string Level, string Semester, string CourseType, string CourseName, string CourseTitle , string CourseCode, string CourseRef, string CourseUnit, string CourseDescription, string ActiveType)
        {
            try
            {

                string sSQL = "functionCourse";
                con.Open();
                SqlCommand objCmd = new SqlCommand(sSQL, con);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@RecID", RecID);
                objCmd.Parameters.AddWithValue("@DepartmentID", DepartmentID );
                objCmd.Parameters.AddWithValue("@Level", Level  );
                objCmd.Parameters.AddWithValue("@Semester", Semester  );
                objCmd.Parameters.AddWithValue("@CourseType", CourseType );
                objCmd.Parameters.AddWithValue("@CourseName", CourseName  );
                objCmd.Parameters.AddWithValue("@CourseTitle", CourseTitle );
                objCmd.Parameters.AddWithValue("@CourseCode", CourseCode  );
                objCmd.Parameters.AddWithValue("@CourseRef", CourseRef );
                objCmd.Parameters.AddWithValue("@CourseUnit", CourseUnit);
                objCmd.Parameters.AddWithValue("@CourseDescription", CourseDescription );
                objCmd.Parameters.AddWithValue("@StatementType", ActiveType );
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

        public DataTable getCourseToExcel(string Department, string Level, string Semester, string CourseType)
        {

           if (Department == "0")
            {

                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
           else if(Department!="0" && Level=="0" && Semester =="0" && CourseType == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course where DepartmentID='" + Department + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( Level != "0" && Semester == "0" && CourseType == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course where DepartmentID='" + Department + "' AND LevelID='" + Level + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( Semester != "0" && CourseType == "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course where DepartmentID='" + Department + "' AND LevelID='" + Level + "' AND semesterID='" + Semester + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }
            else if ( CourseType != "0")
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select * from qry_course where DepartmentID='" + Department + "' AND LevelID='" + Level + "' AND semesterID='" + Semester + "' AND TypeID='" + CourseType  + "'", conn))
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
                using (var cmd = new SqlCommand("select * from qry_course where DepartmentID='" + Department + "' AND LevelID='" + Level + "' AND semesterID='" + Semester + "' AND TypeID='" + CourseType + "'", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }
            }

        }

        public DataSet GetCourseDepartment()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Departments' as [Desc] union select department_id as [Code], department_name as [Desc] from tbl_Department";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetCourseLevel()
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
        public DataSet GetCourseSemester()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Semesters' as [Desc] union select semester_id as [Code], semester_name as [Desc] from tbl_semester";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }
        public DataSet GetCourseTypes()
        {
            try
            {
                SqlCommand objCmd = new SqlCommand();
                string sSQL = "select '0' as [Code], 'All Course Types' as [Desc] union select course_typeID as [Code], type_ref as [Desc] from tbl_course_type";
                objCmd.CommandText = sSQL;
                return ExecuteDataSet(objCmd);
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return null;
            }
        }

    }
}
