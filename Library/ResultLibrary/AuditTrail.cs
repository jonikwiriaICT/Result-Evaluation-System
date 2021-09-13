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

        public DataTable GetAuditTrail()
        {          
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mssqlConnectionString"].ConnectionString))
                using (var cmd = new SqlCommand("select  row_number() over(order by rec_id) as [S/N], rec_id as [RecID], user_name as [UserName], log_url as [Log Url], log_date as [Log Date], log_time as [Log Time], log_sql as [Log SQL]  from tbl_user_log", conn))
                using (var adapter = new SqlDataAdapter(cmd))
                {
                    var teacher = new DataTable();
                    adapter.Fill(teacher);
                    return teacher;
                }          
        }
    }
}
