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
using System.ServiceModel.Description;

public partial class UserManagement : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    static string sRecValue;
    static int itrig = 0;
    private void GetDepartment()
    {
        try
        {
            DataSet ds = objAdm.GetDepartment ();
            ddlDepartment .DataSource = ds;
            ddlDepartment.DataValueField = "Code";
            ddlDepartment.DataTextField = "Desc";
            ddlDepartment.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    private void GetStaffByDepartment()
    {
        try
        {
            DataSet ds = objAdm.GetStaffByDepartmentPro(ddlDepartment .SelectedValue );
            staff_id .DataSource = ds;
            staff_id.DataValueField = "Code";
            staff_id.DataTextField = "Desc";
            staff_id.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void LoadDepartment(object sender, EventArgs e)
    {
        try
        {
            LoadGrid();

        }
        catch(Exception ex)
        {

        }
    }
    public string Administrator()
    {
        try
        {
            string username = ((ResultProcessing)this.Master).Administrator;
            return username;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {  if(Administrator() == "1")
                {
                    GetDepartment ();
                    ddlDepartment .SelectedValue = "0";
                    GetStaffByDepartment();

                     LoadGrid();
                    View.Visible = true;
                    formTemplate.Visible = false;
                }
                else
                {
                    Response.Redirect("error");
                }

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

    private void ActivateCheck()
    {
        try
        {
            if (lecturers .Checked == true)
            {
                lecturer .Value = "1";
                administrator .Value = "0";
                exam_officer.Value = "0";
                vice.Value = "0";
                hod .Value = "0";
                dean .Value = "0";
            }
            else if (exam_officers.Checked == true)
            {
                lecturer.Value = "0";
                administrator.Value = "0";
                exam_officer.Value = "1";
                vice.Value = "0";
                hod.Value = "0";
                dean.Value = "0";
            }
            else if (administrators .Checked == true)
            {
                lecturer.Value = "0";
                administrator.Value = "1";
                exam_officer.Value = "0";
                vice.Value = "0";
                hod.Value = "0";
                dean.Value = "0";
            }
            else if (vices.Checked == true)
            {
                lecturer.Value = "0";
                administrator.Value = "0";
                exam_officer.Value = "0";
                vice.Value = "1";
                hod.Value = "0";
                dean.Value = "0";
            }
            else if (deans.Checked == true)
            {
                lecturer.Value = "0";
                administrator.Value = "0";
                exam_officer.Value = "0";
                vice.Value = "0";
                hod.Value = "0";
                dean.Value = "1";
            }
            else if (hods .Checked == true)
            {
                lecturer.Value = "0";
                administrator.Value = "0";
                exam_officer.Value = "0";
                vice.Value = "0";
                hod.Value = "1";
                dean.Value = "0";
            }

        }
        catch (Exception ex)
        {

        }
    }
    private void DisplaySuccess(String sMessage)
    {
        try
        {
            (this.Master as ResultProcessing).DisplayMessage(sMessage, ResultProcessing.MsgType.Success);
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
            (this.Master as ResultProcessing).DisplayMessage(sMessage, ResultProcessing.MsgType.Error);
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
            (this.Master as ResultProcessing).DisplayMessage(sMessage, ResultProcessing.MsgType.Warning);
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
    protected void ExportToExcel_Click(object sender, EventArgs e)
    {

        if (Administrator () == "1")
        {
            var products = objAdm.GetUserManagementToExcel (ddlDepartment .SelectedValue);
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("UserManagementTemplate");
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
                Response.AddHeader("content-disposition", "attachment;  filename=UserManagement.xlsx");
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




    protected void GoBackClicked(object sender, EventArgs e)
    {

        try
        {
            itrig = 0;
            View.Visible = true;
            formTemplate.Visible = false;
            LoadGrid();

        }
        catch (Exception ex)
        {

        }
    }
    public void bindGrid(int currentPage)
    {

        TableResult.DataSource = objAdm.PopulateDatas(currentPage, "GetUserManagement", ddlDepartment.SelectedValue);
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


    protected void AddNewRecordClicked(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                if (ddlDepartment.SelectedValue == "0")
                {
                    DisplayError("Please select a Department.");

                }
                else
                {
                    GetStaffByDepartment();
                    View.Visible = false;
                    formTemplate.Visible = true;
                    itrig = 0;
                }
            }
            else
            {
                Response.Redirect("error");
            }

        }
        catch (Exception ex)
        {

        }
    }
    protected void tableChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlDepartment.SelectedValue == "0")
            {
                DisplayError("Please select a Department.");
            }
            else
            {
                itrig = 1;
                GridViewRow dgi = TableResult.SelectedRow;
                rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
                GetStaffByDepartment();
                objAdm.getPanelByRecID(PnlUsermanagement );
                if (administrator.Value == "1")
                {
                    lecturer.Value = "0";
                    hod.Value = "0";
                    dean.Value = "0";
                    exam_officer.Value = "0";
                    vice.Value = "0";
                    administrators.Checked = true;
                }
                if (vice.Value == "1")
                {
                    lecturer.Value = "0";
                    hod.Value = "0";
                    dean.Value = "0";
                    exam_officer.Value = "0";
                    administrator .Value = "0";
                    vices .Checked = true;
                }
                if (dean.Value == "1")
                {
                    lecturer.Value = "0";
                    hod.Value = "0";
                    administrator .Value = "0";
                    exam_officer.Value = "0";
                    vice.Value = "0";
                    deans.Checked = true;
                }
                if (hod.Value == "1")
                {
                    lecturer.Value = "0";
                    dean.Value = "0";
                    administrator.Value = "0";
                    exam_officer.Value = "0";
                    vice.Value = "0";
                    hods.Checked = true;
                }
                if (exam_officer .Value == "1")
                {
                    lecturer.Value = "0";
                    dean.Value = "0";
                    administrator.Value = "0";
                    hod.Value = "0";
                    vice.Value = "0";
                    exam_officers.Checked = true;
                }
                if (lecturer .Value == "1")
                {
                    exam_officer.Value = "0";
                    dean.Value = "0";
                    administrator.Value = "0";
                    hod.Value = "0";
                    vice.Value = "0";
                    lecturers.Checked = true;
                }

                View.Visible = false;
                formTemplate.Visible = true;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void TableDelete(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            GridViewRow dgi = TableResult.Rows[e.RowIndex];
            rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
            Label1.ForeColor = System.Drawing.Color.DarkRed;
            Label1.Text = "Are you sure that you want to delete Record with ID:" + " " + rec_id.Value + " " + " ?";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { showDelete(); });", true);

        }
        catch (Exception ex)
        {
        }
    }

    protected void lbDeleteYes_Click(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                string sTbl = "tbl_usermanagement";
                if (objAdm.DeleteRecord(rec_id.Value, sTbl) == true)
                {
                    DisplaySuccess("Record deleted successfully.");
                    LoadGrid();


                }
                else
                {

                }
            }
            else
            {
                Response.Redirect("error");
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void SaveChangesClicked(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                ActivateCheck();
                if (string.IsNullOrEmpty(username .Text) || string.IsNullOrWhiteSpace(username.Text))
                {
                    DisplayError("Please enter Username.");
                }
               
                else
                {

                    if (itrig == 0)
                    {
                        passwords.Value = "welcome";
                        if (objAdm.functionUserManagementss(rec_id.Value, staff_id.SelectedValue, username.Text, vice.Value, exam_officer.Value, lecturer.Value, hod.Value, administrator.Value, dean.Value, objAdm .Encrypt (passwords .Value), "INSERT") == true)
                        {
                            DisplaySuccess(objAdm.ErrorMessage);
                            LoadGrid();


                            View.Visible = true;
                            formTemplate.Visible = false;
                            objAdm.clearPanel(PnlUsermanagement );
                            itrig = 0;
                        }
                        else
                        {
                            DisplayError(objAdm.ErrorMessage);

                        }
                    }
                    if (itrig == 1)
                    {
                        passwords.Value = "welcome";
                        if (objAdm.functionUserManagementss(rec_id.Value, staff_id.SelectedValue, username.Text, vice.Value, exam_officer.Value, lecturer.Value, hod.Value, administrator.Value, dean.Value, passwords .Value, "UPDATE") == true)
                        {
                            DisplaySuccess(objAdm.ErrorMessage);
                            LoadGrid();


                            View.Visible = true;
                            formTemplate.Visible = false;
                            objAdm.clearPanel(PnlUsermanagement);
                            itrig = 0;
                        }
                        else
                        {
                            DisplayError(objAdm.ErrorMessage);

                        }
                    }
                }
            }
            else
            {
                Response.Redirect("error");
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void checkAll(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                foreach (GridViewRow grow in TableResult.Rows)
                {
                    CheckBox chkVerified = (CheckBox)grow.FindControl("chkResult");
                    if (chkVerified.Checked == false)
                    {
                        chkVerified.Checked = true;
                        lblCheck.Text = "Uncheck";
                    }
                    else
                    {
                        chkVerified.Checked = false;
                        lblCheck.Text = "Check";
                    }
                }
            }
            else
            {
                Response.Redirect("error");
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void deleteCheckedRows(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                foreach (GridViewRow grow in TableResult.Rows)
                {
                    CheckBox chkVerified = (CheckBox)grow.FindControl("chkResult");
                    if (chkVerified.Checked)
                    {
                        string stbl = "tbl_usermanagement";
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
            else
            {
                Response.Redirect("error");
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
            if (Administrator() == "1")
            {
                string stbl = "tbl_usermanagement";
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
            else
            {
                Response.Redirect("error");
            }
        }
        catch (Exception ex)
        {

        }
    }
  

}