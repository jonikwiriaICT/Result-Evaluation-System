using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Configuration;
public partial class StaffFolder_ResultInput : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    public string UserName()
    {
        try
        {
            string username = ((Doctors_DoctorMaster)this.Master).UserName;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public string Lecturer()
    {
        try
        {
            string lecturer = ((Doctors_DoctorMaster)this.Master).Lecturer;
            return lecturer;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (!this.IsPostBack)
            {
              
                    GetInputResult();
              
            }
      
    }
   
    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        //string query = "DELETE FROM Customers WHERE CustomerId=@CustomerId";
        //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(constr))
        //{
        //    using (SqlCommand cmd = new SqlCommand(query))
        //    {
        //        cmd.Parameters.AddWithValue("@CustomerId", customerId);
        //        cmd.Connection = con;
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //}

        //this.BindGrid();
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
        //{
        //    (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        //}
    }
    private void GetInputResult()
    {
        try
        {
            DataSet ds = objAdm.getInputScore(Request .QueryString ["CourseID"].ToString (), Request.QueryString ["SessionID"].ToString ());
            TableResult.DataSource = ds;
            TableResult.DataBind();
            TableResult.UseAccessibleHeader = true;
            TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch(Exception ex)
        {

        }
    }
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        TableResult .EditIndex = e.NewEditIndex;
        GetInputResult();
    }
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as Doctors_DoctorMaster).DisplayMessage(sMessage, Doctors_DoctorMaster.MsgType.Success);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    private void DisplayError(String sMessage)
    {
        try
        {
            (this.Master as Doctors_DoctorMaster).DisplayMessage(sMessage, Doctors_DoctorMaster.MsgType.Error);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }

    private void DisplayWarning(String sMessage)
    {
        try
        {
            (this.Master as Doctors_DoctorMaster).DisplayMessage(sMessage, Doctors_DoctorMaster.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    private void ImporttoDatatable()

    {
        try
        {
            if (FlUploadcsv.HasFile == false)
            {
                DisplayError("Please upload a file.");
                return;
            }
            if (FlUploadcsv.HasFile)
            {
                string FileName = FlUploadcsv.FileName;
                string sYearMonthDay = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() +
                DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
                string path = string.Concat(Server.MapPath("~/upload/" + sYearMonthDay + FlUploadcsv.FileName));
                FlUploadcsv.PostedFile.SaveAs(path);
                OleDbConnection OleDbcon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;");
                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", OleDbcon);
                OleDbDataAdapter objAdapter1 = new OleDbDataAdapter(cmd);
                ds = new DataSet();
                objAdapter1.Fill(ds);
                Dt = ds.Tables[0];
            }

        }

        catch (Exception ex)

        {



        }

    }
    //Check Validation before upload

    private void InsertData()

    {
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][0].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][0].ToString()))
            {
                int RowNo = i + 2;
                DisplayError("Please do not temper with the MaxSt" + RowNo + "");
                return;
            }
        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][1].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][1].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please do not temper with the Matric Number in row " + RowNo + "");
                return;
            }
        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][2].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][2].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please do not temper first CA in row " + RowNo + "");
                return;

            }
            if(int.Parse(Dt.Rows[i][2].ToString()) >= 11)
            {
                int RowNo = i + 2;
                DisplayError("Please the range value for first CA 1 should be between the range of 0 to 10 in row " + RowNo + "");
                return;
            }


        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][3].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][3].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Second CA in row " + RowNo + "");
                return;

            }
            if (int.Parse(Dt.Rows[i][3].ToString()) >= 11)
            {
                int RowNo = i + 2;
                DisplayError("Please the range value for Second CA 1 should be between the range of 0 to 10 in row " + RowNo + "");
                return;
            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][4].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][4].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Third CA in row " + RowNo + "");
                return;

            }
            if (int.Parse(Dt.Rows[i][4].ToString()) >= 11)
            {
                int RowNo = i + 2;
                DisplayError("Please the range value for Third CA 1 should be between the range of 0 to 10 in row " + RowNo + "");
                return;
            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][5].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][5].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Exam in row " + RowNo + "");
                return;

            }
            if (int.Parse (Dt.Rows[i][5].ToString()) >= 71)
            {
                int RowNo = i + 2;
                DisplayError("Please the range value for Exam should be between the range of 0 to 70 in row " + RowNo + "");
                return;
            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            DataRow row = Dt.Rows[i];
            int columnCount = Dt.Columns.Count;
            string[] columns = new string[columnCount];
            for (int j = 0; j < columnCount; j++)
            {
                columns[j] = row[j].ToString();
            }
            if (objAdm.functionInputScore(Request.QueryString["CourseID"].ToString(), Request.QueryString["SessionID"].ToString(), columns[0], columns[2], columns[3], columns[4], columns[5], "UPDATE") == true)
            {
                DisplaySuccess(objAdm.ErrorMessage);
            }
            else
            {
                DisplayError(objAdm.ErrorMessage);
            }
        }
    }
    protected void ExcelInsertClicked(object sender, EventArgs e)
    {
        try
        {

            
                ImporttoDatatable();

                InsertData();
            GetInputResult();
          
           
        }
        catch (Exception ex)
        {
            DisplayError(ex.Message);

        }
    }
    protected void DownloadTemplate(object sender, EventArgs e)
    {
            var products = objAdm.getInputScores(Request.QueryString["CourseID"].ToString(), Request.QueryString["SessionID"].ToString());
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
            var totalCols = products.Columns.Count;
            var totalRows = products.Rows.Count;

            for (var col = 1; col <= totalCols; col++)
            {
                workSheet.Cells[1, col].Value = products.Columns[col - 1].ColumnName;
            }
            for (var row = 1; row <= totalRows; row++)
            {
                for (var col = 0; col < totalCols; col++)
                {
                    workSheet.Cells[row + 1, col + 1].Value = products.Rows[row - 1][col];
                }
            }
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=ResultTemplate.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
        
    
    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = TableResult .Rows[e.RowIndex];
        int CourseID = Convert.ToInt32(TableResult.DataKeys[e.RowIndex].Values[0]);
        int SessionID = Convert.ToInt32(TableResult.DataKeys[e.RowIndex].Values[1]);
        int MaxSt = Convert.ToInt32(TableResult.DataKeys[e.RowIndex].Values[2]);
        string firstCa = (row.FindControl("firstCa") as TextBox).Text;
        string secondCa = (row.FindControl("secondCa") as TextBox).Text;
        string thirdCa = (row.FindControl("thirdCa") as TextBox).Text;
        string Exam = (row.FindControl("Exam") as TextBox).Text;

        if (objAdm .functionInputScore(CourseID.ToString () , SessionID.ToString () , MaxSt.ToString (),firstCa,  secondCa,  thirdCa,  Exam, "UPDATE")==true)
        {
            DisplaySuccess("Score entered successfully.");
            TableResult.EditIndex = -1;
            GetInputResult();
        }
        else
        {
            DisplaySuccess("There was an error input.");
            TableResult.EditIndex = -1;
            GetInputResult();
        }
     
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        TableResult.EditIndex = -1;
        GetInputResult();
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        TableResult.PageIndex = e.NewPageIndex;
        GetInputResult();
    }
}