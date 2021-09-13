using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _Foundation;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;

namespace ResultLibrary
{
    public partial class SysAdminModel: _Database
    {
        public int pageSize = 100;
        public int _TotalRowCount = 0;
        public string connectionstring = ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString();
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ToString());
        public DataTable PopulateData(int currentPage, string sParameterProcedure)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
        public DataTable AuditTrail(int currentPage, string sParameterProcedure)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
        public DataTable AuditTrail(int currentPage, string sParameterProcedure, string CourseID, string SessionID)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@CourseID", CourseID );
            cmd.Parameters.AddWithValue("@SessionID", SessionID );
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }

        public DataTable GetStudentStatistics(int currentPage, string sParameterProcedure, string MaxSt , string SemesterID , string SessionID )
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@MaxSt", MaxSt);
            cmd.Parameters.AddWithValue("@SemesterID", SemesterID);
            cmd.Parameters.AddWithValue("@SessionID", SessionID);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }



        public DataTable PopulateData(int currentPage, string sParameterProcedure, string DepartmentalSearch, string LevelSearch, string SemesterSearch, string CourseTypeSearch)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@DepartmentSearch", DepartmentalSearch);
            cmd.Parameters.AddWithValue("@LevelSearch", LevelSearch );
            cmd.Parameters.AddWithValue("@SemesterSearch", SemesterSearch );
            cmd.Parameters.AddWithValue("@CourseTypeSearch", CourseTypeSearch );
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }

        public DataTable PopulateDataCourseReg(int currentPage, string sParameterProcedure, string Course, string Session, string MatricNo)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@Course", Course );
            cmd.Parameters.AddWithValue("@Session", Session );
            cmd.Parameters.AddWithValue("@MatricNo", MatricNo  );
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
        public DataTable PopulateDataCourse(int currentPage, string sParameterProcedure, string Staff, string Course, string Session)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@Staff", Staff );
            cmd.Parameters.AddWithValue("@Course", Course );
            cmd.Parameters.AddWithValue("@Session", Session );
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
        public DataTable PopulateDatas(int currentPage, string sParameterProcedure, string Search)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@Search", Search);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
    
        public DataTable PopulateDatass(int currentPage, string sParameterProcedure, string FacultySearch)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@FacultySearch", FacultySearch);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }

        public DataTable PopulateDataStudent(int currentPage, string sParameterProcedure, string ProgramSearch, string LevelSearch)
        {
            DataTable ds = new DataTable();
            con.Open();
            SqlCommand cmd = new SqlCommand(sParameterProcedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.AddWithValue("@ProgramSearch", ProgramSearch );
            cmd.Parameters.AddWithValue("@LevelSearch", LevelSearch );
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);
            con.Close();
            return ds;
        }
        public string Encrypt(string clearText)
        {
            string EncryptionKey = "JOHWEN2019ry@COMmirian2019ry";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "JOHWEN2019ry@COMmirian2019ry";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }


    }
}
