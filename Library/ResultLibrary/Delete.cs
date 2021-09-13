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
        public bool DeleteRecord(string rec_id, string tbl_name)
        {
            try
            {
                string sSQL = "DELETE FROM  " + tbl_name + "  WHERE  rec_id=@rec_id";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@rec_id", rec_id);
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to delete transaction";
                    return false;
                }
                ErrorMessage = "Record successfully deleted.";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }
        public bool UpdateRecord(string CourseID, string SessionID)
        {
            try
            {
                string sSQL = "update tbl_course_registration set  flag_on='1'  WHERE  course_id=@course_id and session_id=@session_id";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@course_id", CourseID );
                objCmd.Parameters.AddWithValue("@session_id", SessionID);
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to process transaction";
                    return false;
                }
                ErrorMessage = "Result successfully submited.";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }
        public bool DeleteRecordByRecID(int rec_id, string tbl_name)
        {
            try
            {
                string sSQL = "DELETE FROM  " + tbl_name + "  WHERE rec_id=@rec_id";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                objCmd.Parameters.Clear();
                objCmd.Parameters.AddWithValue("@rec_id", rec_id);
                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to delete transaction";
                    return false;
                }
                ErrorMessage = "Record successfully deleted.";
                return true;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.ToString();
                return false;
            }
        }
        public bool DeleteAllRecord(string tbl_name)
        {
            try
            {
                string sSQL = "DELETE FROM  " + tbl_name + "";
                SqlCommand objCmd = new SqlCommand();
                objCmd.CommandText = sSQL;
                objCmd.Parameters.Clear();

                if (ExecuteNonQuery(objCmd) <= 0)
                {
                    ErrorMessage = "Unable to delete transaction";
                    return false;
                }
                ErrorMessage = "Record successfully deleted.";
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
