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
        public string sTotalCount = string.Empty;
        public string CountData(string tbl)
        {
            try
            {
                string sPasswordDB = string.Empty;
                DataSet ds = new DataSet();
                string sSQL = "select count(*) as [Total] from " + tbl + " ";
                SqlCommand objCmd = new SqlCommand();
                objCmd.Parameters.Clear();
                objCmd.CommandText = sSQL;
                ds = ExecuteDataSet(objCmd);
                if (ds.Tables[0].Rows.Count <= 0)
                {
                    ErrorMessage += "Error in Count.";
                    return ErrorMessage;
                }
                sTotalCount = ds.Tables[0].Rows[0]["Total"].ToString();

                return sTotalCount;
            }
            catch (Exception ex)
            {
                ErrorMessage += ex.Message;
                return ErrorMessage;
            }
        }

    }
}
