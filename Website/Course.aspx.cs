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

public partial class Course : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    DataSet ds;
    DataTable Dt;
    static string sRecValue;
    static int itrig = 0;
    public int TotalPage { get; set; }
    public int CurrentPage { get; set; }

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
    private void GetLevel()
    {
        try
        {
            DataSet ds = objAdm.GetCourseLevel ();
            ddlLevel .DataSource = ds;
            ddlLevel.DataValueField = "Code";
            ddlLevel.DataTextField = "Desc";
            ddlLevel.DataBind();



        }
        catch (Exception ex)
        {

        }
    }
    private void GetSemester()
    {
        try
        {
            DataSet ds = objAdm.GetCourseSemester ();
            ddlSemester .DataSource = ds;
            ddlSemester.DataValueField = "Code";
            ddlSemester.DataTextField = "Desc";
            ddlSemester.DataBind();



        }
        catch (Exception ex)
        {

        }


    }
    private void GetCourseType()
    {
        try
        {
            DataSet ds = objAdm.GetCourseTypes();
            ddlCourseType.DataSource = ds;
            ddlCourseType.DataValueField = "Code";
            ddlCourseType.DataTextField = "Desc";
            ddlCourseType.DataBind();



        }
        catch (Exception ex)
        {

        }


    }

    protected void selectDepartment(object sender, EventArgs e)
    {
        try
        {
       
            GetLevel();
            GetSemester();
            GetCourseType();
            ddlLevel.SelectedValue = "0";
            ddlSemester.SelectedValue = "0";
            ddlCourseType.SelectedValue = "0";
            LoadGrid();
          
        }
        catch(Exception ex)
        {

        }
    }
    protected void selectLevel(object sender, EventArgs e)
    {
        try
        {
            if (ddlDepartment .SelectedValue != "0")
            {
             
                GetSemester();
                GetCourseType();
                ddlSemester.SelectedValue = "0";
                ddlCourseType.SelectedValue = "0";
                LoadGrid();
            }
            else
            {
                DisplayError("Please select a Department.");
            }

        }
        catch (Exception ex)
        {

        }
    }
    protected void selectSemester(object sender, EventArgs e)
    {
        try
        {
            if (ddlLevel  .SelectedValue != "0" && ddlDepartment .SelectedValue !="0")
            {
              
                GetCourseType();
                ddlCourseType.SelectedValue = "0";
                LoadGrid();
            }
            else
            {
                DisplayError("Please select a Department and Level");
            }

        }
        catch (Exception ex)
        {

        }
    }
    protected void selectCourseType(object sender, EventArgs e)
    {
        try
        {
            if (ddlLevel.SelectedValue != "0" && ddlDepartment.SelectedValue != "0" && ddlSemester .SelectedValue !="0")
            {

               
                LoadGrid();
            }
            else
            {
                DisplayError("Please select a Department, Level and Semester.");
            }

        }
        catch (Exception ex)
        {

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Administrator() == "1")
                {
                    GetDepartment();
                    GetLevel();
                    GetSemester();
                    GetCourseType();
                    ddlDepartment.SelectedValue = "0";
                    ddlLevel.SelectedValue = "0";
                    ddlSemester.SelectedValue = "0";
                    ddlCourseType.SelectedValue = "0";
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

        if (Administrator() == "1")
        {
            var products = objAdm.getCourseToExcel(ddlDepartment .SelectedValue , ddlLevel .SelectedValue , ddlSemester .SelectedValue , ddlSemester .SelectedValue );
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("CourseTemplate");
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
                Response.AddHeader("content-disposition", "attachment;  filename=CourseTemplate.xlsx");
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
    //Import to Datatable
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
            if (string.IsNullOrEmpty(Dt.Rows[i][1].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][1].ToString()))
            {
                int RowNo = i + 2;
                DisplayError("Please enter Course name in row " + RowNo + "");
                return;

            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][2].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][2].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Course Title in row " + RowNo + "");
                return;

            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][3].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][3].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Course Code in row " + RowNo + "");
                return;

            }

        }
        for (int i = 0; i < Dt.Rows.Count; i++)
        {
            if (string.IsNullOrEmpty(Dt.Rows[i][5].ToString()) || string.IsNullOrWhiteSpace(Dt.Rows[i][5].ToString()))

            {
                int RowNo = i + 2;
                DisplayError("Please enter Course Unit in row " + RowNo + "");
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
           if(ddlDepartment .SelectedValue =="0" || ddlSemester .SelectedValue =="0" || ddlLevel .SelectedValue =="0" || ddlCourseType .SelectedValue == "0")
            {
                DisplayError("Please you must select Department, Level, Semester and CourseType");
            }
            else
            {
                if (objAdm.functionCourse(rec_id .Value , ddlDepartment .SelectedValue , ddlLevel .SelectedValue , ddlSemester .SelectedValue , ddlCourseType .SelectedValue , columns[1].ToUpper ().ToString ().Trim (), columns[2].ToUpper().ToString ().Trim (), columns[3].ToUpper ().ToString ().Trim (), columns[4], columns[5], ckEditor .InnerText,"INSERT") == true)
                {
                    DisplaySuccess(objAdm.ErrorMessage);

                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                }
            }

        }

    }
    protected void ExcelInsertClicked(object sender, EventArgs e)
    {
        try
        {

            if (Administrator() == "1")
            {
                ImporttoDatatable();

                InsertData();
                LoadGrid();
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
    //download excel template
    private void Download_File(string FilePath)
    {
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
        Response.WriteFile(FilePath);
        Response.End();
    }
    protected void downloadExcelTemplate(object sender, EventArgs e)
    {
        try
        {
            if (Administrator() == "1")
            {
                Download_File("~/facultyTemplate/CourseTemplate.xlsx");
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

        TableResult.DataSource = objAdm.PopulateData(currentPage, "GetCourse", ddlDepartment .SelectedValue , ddlLevel .SelectedValue , ddlSemester .SelectedValue , ddlCourseType .SelectedValue );
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
                if (ddlDepartment.SelectedValue == "0" || ddlSemester.SelectedValue == "0" || ddlLevel.SelectedValue == "0" || ddlCourseType.SelectedValue == "0")
                {
                    DisplayError("Please you must select Department, Level, Semester and CourseType");
                }
                else
                {
                    View.Visible = false;
                    formTemplate.Visible = true;
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
            if (ddlDepartment.SelectedValue == "0" || ddlSemester.SelectedValue == "0" || ddlLevel.SelectedValue == "0" || ddlCourseType.SelectedValue == "0")
            {
                DisplayError("Please you must select Department, Level, Semester and CourseType");
            }
            else
            {
                itrig = 1;
                GridViewRow dgi = TableResult.SelectedRow;
                rec_id.Value = dgi.Cells[objAdm.getColumnIndexByName(TableResult, "RecID")].Text;
                int iRec = int.Parse(rec_id.Value);
                objAdm.getPanelByRecID(PnlCourse);
                ckEditor.InnerText = course_descriptiom.Value;
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
                string sTbl = "tbl_course";
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
                if (string.IsNullOrEmpty(course_name.Text) || string.IsNullOrWhiteSpace(course_name.Text))
                {
                    DisplayError("Please enter Course Name.");
                }
                if (string.IsNullOrEmpty(course_title.Text) || string.IsNullOrWhiteSpace(course_title.Text))
                {
                    DisplayError("Please enter Course Title.");
                }
                if (string.IsNullOrEmpty(course_code.Text) || string.IsNullOrWhiteSpace(course_code.Text))
                {
                    DisplayError("Please enter Course Code.");
                }
                if (string.IsNullOrEmpty(course_unit .Text) || string.IsNullOrWhiteSpace(course_unit.Text))
                {
                    DisplayError("Please enter Course Unit.");
                }
                else
                {
                   
                    if (itrig == 0)
                    {
                        if (objAdm.functionCourse(rec_id.Value , ddlDepartment .SelectedValue , ddlLevel .SelectedValue , ddlSemester .SelectedValue , ddlCourseType .SelectedValue , course_name.Text.ToUpper ().ToString ().Trim () , course_title.Text.ToUpper ().ToString ().Trim (), course_code.Text , course_ref .Text , course_unit .Text , ckEditor .InnerText , "INSERT") == true)
                        {
                            DisplaySuccess(objAdm.ErrorMessage);
                            LoadGrid();


                            View.Visible = true;
                            formTemplate.Visible = false;
                            objAdm.clearPanel(PnlCourse);
                            ckEditor.InnerText = "";
                            itrig = 0;
                        }
                        else
                        {
                            DisplayError(objAdm.ErrorMessage);

                        }
                    }
                    if (itrig == 1)
                    {
                        if (objAdm.functionCourse(rec_id.Value, ddlDepartment.SelectedValue, ddlLevel.SelectedValue, ddlSemester.SelectedValue, ddlCourseType.SelectedValue, course_name.Text.ToUpper().ToString().Trim(), course_title.Text.ToUpper().ToString().Trim(), course_code.Text, course_ref.Text, course_unit.Text, ckEditor.InnerText, "UPDATE") == true)
                        {
                            DisplaySuccess(objAdm.ErrorMessage);
                            LoadGrid();


                            View.Visible = true;
                            formTemplate.Visible = false;
                            objAdm.clearPanel(PnlCourse);
                            ckEditor.InnerText = "";
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
                        string stbl = "tbl_course";
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
                string stbl = "tbl_course";
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