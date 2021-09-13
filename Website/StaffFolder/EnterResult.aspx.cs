using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;
using System.Data;
using System.IO;
using OfficeOpenXml;

public partial class StaffFolder_EnterResult : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();

    private void GetResult()
    {
        try
        {
            DataSet ds = objAdm.GetTeacherView();
            TableResult.DataSource = ds;
           
            TableResult.DataBind();
            TableResult.UseAccessibleHeader = true;
            TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;



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
                    if(objAdm .ValidateMyCourse(UserName()) == true)
                    {
                        bindGrid(1);
                        TableResult.UseAccessibleHeader = true;
                        TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                    else
                    {
                        Response.Redirect("ErrorEN");
                    }
                
                }
          
        }
        catch(Exception ex)
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
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
          
        }
        catch (Exception ex)
        {

        }
    }
    protected void tableChanged(object sender, EventArgs e)
    {
        try
        {


            GridViewRow dgi = TableResult.SelectedRow;
            string CourseID = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "CourseID")].Text;
            string SessionID = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "SessionID")].Text;
            string Result = (TableResult.SelectedRow.FindControl("hdResult") as HiddenField).Value;
            string Remark = (TableResult.SelectedRow.FindControl("lblRemark") as Label).Text;
   
            if (Result.Contains("NO"))
            {
                //Assigning the text 'BookMark' to link button
                DisplayError("There is no registered student for this course.");
            }
            //Checking the Value of Link Button is 'Remove Book Mark' or not
            else if (Result.ToString().ToUpper().Contains("ENTER") && Remark.ToString().Contains("No"))
            {
                Response.Redirect("Result-Input?CourseID=" + CourseID.ToString() + "&SessionID=" + SessionID.ToString());
            }
            else if (Result.ToString().ToUpper().Contains("ENTER") && !Remark.ToString().Contains("No"))
            {
                //Assigning the text 'Remove BookMark' to link button
                DisplaySuccess ("This course has already been submitted.");
            }


        }
        catch (Exception ex)
        {

        }
    }
    protected void ExportToExcel_Click(object sender, EventArgs e)
    {

        if (Lecturer () == "1")
        {
            var products = objAdm.getMyCourse(UserName ());
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
                Response.AddHeader("content-disposition", "attachment;  filename=MyCourse.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
        else
        {
            Response.Redirect("error");
        }
    }
    protected void TableCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            for (int i = 0; i < TableResult.Rows.Count; i++)
            {
                if (e.CommandName == "Submit")
                {
                    
                    GridViewRow dgi = TableResult.Rows[i];
                    CourseID.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "CourseID")].Text;
                    SessionID.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "SessionID")].Text;
                    Response.Redirect("Result-Statistics?CourseID=" + CourseID .Value + " &SessionID=" + SessionID .Value + "");

                }
            }
                

        }
        catch (Exception ex)
        {
        }
    }
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
            string lecturer = ((Doctors_DoctorMaster)this.Master).Lecturer ;
            return lecturer;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public void bindGrid(int currentPage)
    {

        TableResult.DataSource = objAdm.PopulateDatas(currentPage, "GetEnterResultView", UserName() );
        TableResult.DataBind();

        generatePager(objAdm._TotalRowCount, objAdm.pageSize, currentPage);


    }
    protected void UpdateRecord(object sender, EventArgs e)
    {
        try
        {
            if(objAdm .UpdateRecord( CourseID.Value,  SessionID.Value) == true)
            {
                DisplaySuccess("Result has been submitted.");
                bindGrid(1);
                TableResult.UseAccessibleHeader = true;
                TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                DisplayError(objAdm.ErrorMessage);
                bindGrid(1);
                TableResult.UseAccessibleHeader = true;
                TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void TableDelete(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            GridViewRow dgi = TableResult.Rows[e.RowIndex];
            CourseID.Value  = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "CourseID")].Text;
            SessionID.Value  = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "SessionID")].Text;
            Response.Redirect("Result-Statistics?CourseID=" + CourseID .Value + " &SessionID=" + SessionID .Value + "");
Response.Redirect("Result-Statistics?CourseID=" + CourseID .Value + " &SessionID=" + SessionID .Value + "");


        }
        catch (Exception ex)
        {
        }
    }
    protected void lbDeleteYes_Click(object sender, EventArgs e)
    {
        try
        {
             
                if (objAdm.UpdateRecord( CourseID.Value,  SessionID.Value) == true)
                {
                    DisplaySuccess(objAdm .ErrorMessage );
                bindGrid(1);
                TableResult.UseAccessibleHeader = true;
                TableResult.HeaderRow.TableSection = TableRowSection.TableHeader;


            }
                else
                {

                }
            
        }
        catch (Exception ex)
        {

        }
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
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        for (int i = 0; i < TableResult.Rows.Count; i++)
        {
          /*  LinkButton status = (LinkButton)TableResult.Rows[i].FindControl("lnk_BookmarkVideo");*/ // find control from your button ID
            LinkButton result = (LinkButton)TableResult.Rows[i].FindControl("lbSelect");
            LinkButton submitResult = (LinkButton)TableResult.Rows[i].FindControl("lbDelete");
            Label  lblRemark = (Label)TableResult.Rows[i].FindControl("lblRemark");
            HiddenField hdResult = (HiddenField)TableResult.Rows[i].FindControl("hdResult");
           //String state = status.CommandArgument.ToString(); // assume the value given by Eval data binding


            if (hdResult.Value.Equals("confirmed") || hdResult.Value.Equals("rejected"))
            {
                result.Text = "No registered student.";
                result.CssClass = "nav-link nav-tabs-rounded btn btn-outline-warning";
                submitResult.CssClass = "nav-link nav-tabs-rounded btn btn-outline-warning";
                submitResult.Text = "Result Analysis";
            }
            else
            {
                result.Text = hdResult.Value;
                result.CssClass = "nav-link nav-tabs-rounded btn btn-outline-info";
                submitResult.CssClass = "nav-link nav-tabs-rounded btn btn-outline-info";
                submitResult.Text = "Result Analysis";
            }
            if (lblRemark.Text.Contains("No"))
            {
                lblRemark.ForeColor = System.Drawing.Color.DarkRed;
            }
            else if (lblRemark.Text.Contains("Waiting"))
            {
                lblRemark.ForeColor = System.Drawing.Color.DeepSkyBlue;
                result.Text = "Waiting for Result Approval.";
                submitResult.CssClass = "nav-link nav-tabs-rounded btn btn-outline-danger";
                submitResult.Text = "Result Analysis";
                submitResult.Enabled = false;
            }
            else
            {
                lblRemark.ForeColor = System.Drawing.Color.DeepSkyBlue;
                result.Text = "Already Approved Result";
                submitResult.CssClass = "nav-link nav-tabs-rounded btn btn-outline-danger";
                submitResult.Text = "Result Analysis";
                submitResult.Enabled = false;
            }

        }
        
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
}