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

public partial class students_Dashboard : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    public string chartGender = string.Empty;
    public string chartMaritalStatus = string.Empty;
    public string chartResult = string.Empty;
    static string sRecValue;
    static int itrig = 0;
    public int TotalPage { get; set; }
    public int CurrentPage { get; set; }
    public string UserName()
    {
        try
        {
            string username = ((Student_StudentMaster)this.Master).UserName;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    protected void ExportToExcel_Click(object sender, EventArgs e)
    {

       
            var products = objAdm.DownloadStudentAnalysis(UserName (), ddlSemester .SelectedValue , ddlSession .SelectedValue );
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
                Response.AddHeader("content-disposition", "attachment;  filename=ResultAnalysis.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
      
    }

    private void GetStudentSemester()
    {
        try
        {
            DataSet ds = objAdm.GetStudentSemester();
            ddlSemester.DataSource = ds;
            ddlSemester.DataTextField = "Desc";
            ddlSemester.DataValueField = "Code";
            ddlSemester.DataBind();
        }
        catch(Exception ex)
        {

        }
    }
    private void GetStudentSession()
    {
        try
        {
            DataSet ds = objAdm.GetStudentSession();
            ddlSession .DataSource = ds;
            ddlSession.DataTextField = "Desc";
            ddlSession.DataValueField = "Code";
            ddlSession.DataBind();
        }
        catch (Exception ex)
        {

        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
                if (!this.IsPostBack)
                {
                GetStudentSemester();
                ddlSemester.SelectedValue = "0";
                GetStudentSession();
                ddlSession .SelectedValue = "0";
                LoadGrid();
                    objAdm.SerializeStudentResultPercentage(ddlSemester .SelectedValue , ddlSession .SelectedValue , UserName ());
                    chartResult = objAdm.chartResult;
                }
           

        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_UnLoad(object sender, EventArgs e)
    {
        try
        {
            objAdm.CloseConnection();
        }
        catch (Exception ex)
        {

        }
    }
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as Student_StudentMaster).DisplayMessage(sMessage, Student_StudentMaster.MsgType.Success);
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
            (this.Master as Student_StudentMaster).DisplayMessage(sMessage, Student_StudentMaster.MsgType.Error);
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
            (this.Master as Student_StudentMaster).DisplayMessage(sMessage, Student_StudentMaster.MsgType.Warning);
        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message.ToString();
            Response.Redirect("~/en");
        }
    }
    protected void btResultPrint(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {

        }
    }
    //upload sheet to excel







    public void bindGrid(int currentPage)
    {

        TableResult.DataSource = objAdm.GetStudentStatistics( currentPage, "StudentStatistics", UserName (), ddlSemester .SelectedValue , ddlSession .SelectedValue );
        TableResult.DataBind();

        generatePager(objAdm._TotalRowCount, objAdm.pageSize, currentPage);


    }
    protected void dlPager_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PageNo")
        {
            bindGrid(Convert.ToInt32(e.CommandArgument));
        }
        TableResult.UseAccessibleHeader = true;
        TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    public void generatePager(int totalRowCount, int pageSize, int currentPage)
    {
        int totalLinkInPage = 5;
        int totalPageCount = (int)Math.Ceiling((decimal)totalRowCount / pageSize);

        int startPageLink = Math.Max(currentPage - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
        int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

        if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
        {
            lastPageLink = Math.Min(currentPage + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
            startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
        }

        List<ListItem> pageLinkContainer = new List<ListItem>();

        if (startPageLink != 1)
            pageLinkContainer.Add(new ListItem("First", "1", currentPage != 1));
        for (int i = startPageLink; i <= lastPageLink; i++)
        {
            pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPage != i));
        }
        if (lastPageLink != totalPageCount)
            pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPage != totalPageCount));

        dlPager.DataSource = pageLinkContainer;
        dlPager.DataBind();
    }
    private void LoadGrid()
    {
        try
        {
            bindGrid(1);
            TableResult.UseAccessibleHeader = true;
            TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        catch (Exception ex)
        {

        }
    }

    protected void SelectSemester(object sender, EventArgs e)
    {
        try
        {
            GetStudentSession();
            ddlSession.SelectedValue = "0";
            LoadGrid();
            objAdm.SerializeStudentResultPercentage(ddlSemester.SelectedValue, ddlSession.SelectedValue, UserName());
            chartResult = objAdm.chartResult;
        }
        catch(Exception ex)
        {

        }
    }

    protected void SelectSession(object sender, EventArgs e)
    {
        try
        {
           
            if(ddlSemester .SelectedValue == "0")
            {
                DisplayError("Please select a semester.");
            }
            else
            {
                LoadGrid();
                objAdm.SerializeStudentResultPercentage(ddlSemester.SelectedValue, ddlSession.SelectedValue, UserName());
                chartResult = objAdm.chartResult;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void SelectFacultyClicked(object sender, EventArgs e)
    {
        try
        {
            LoadGrid();
        }
        catch (Exception ex)
        {

        }
    }





    protected void lbDeleteYes_Click(object sender, EventArgs e)
    {
        try
        {
            //if (Administrator() == "1")
            //{
            //    string sTbl = "tbl_program";
            //    if (objAdm.DeleteRecord(rec_id.Value, sTbl) == true)
            //    {
            //        DisplaySuccess("Record deleted successfully.");
            //        LoadGrid();


            //    }
            //    else
            //    {

            //    }
            //}
            //else
            //{
            //    Response.Redirect("error");
            //}
        }
        catch (Exception ex)
        {

        }
    }


    protected void checkAll(object sender, EventArgs e)
    {
        try
        {
            //    if (Administrator() == "1")
            //    {
            //        foreach (GridViewRow grow in TableResult.Rows)
            //        {
            //            CheckBox chkVerified = (CheckBox)grow.FindControl("chkResult");
            //            if (chkVerified.Checked == false)
            //            {
            //                chkVerified.Checked = true;
            //                lblCheck.Text = "Uncheck";
            //            }
            //            else
            //            {
            //                chkVerified.Checked = false;
            //                lblCheck.Text = "Check";
            //            }
            //        }
            //    }
            //    else
            //    {
            //        Response.Redirect("error");
            //    }
        }
        catch (Exception ex)
        {

        }
    }
    protected void deleteCheckedRows(object sender, EventArgs e)
    {
        try
        {
            
                foreach (GridViewRow grow in TableResult.Rows)
                {
                    CheckBox chkVerified = (CheckBox)grow.FindControl("chkResult");
                    if (chkVerified.Checked)
                    {
                        string stbl = "tbl_program";
                        int recID = Convert.ToInt32(grow.Cells[4].Text);
                        if (objAdm.DeleteRecordByRecID(recID, stbl) == true)
                        {
                            DisplaySuccess("Checked record(s) was deleted successfully");
                            LoadGrid();


                        }
                        else
                        {

                            LoadGrid();


                        }
                    }
                }
          
        }
        catch (Exception EX)
        {

        }
    }
    protected void deleteAllRecords(object sender, EventArgs e)
    {
        try
        {
            
                string stbl = "tbl_program";
                if (objAdm.DeleteAllRecord(stbl) == true)
                {
                    DisplaySuccess("Record(s) was deleted successfully");
                    LoadGrid();


                }
                else
                {

                    LoadGrid();


                    DisplayError("You cannot delete this record because it is being used by other tables.");
                }
            
        }
        catch (Exception ex)
        {

        }
    }
}