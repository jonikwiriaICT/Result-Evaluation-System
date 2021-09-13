using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;

public partial class StaffFolder_Dashboard : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                getStaffProfile();
            }
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

    protected void Page_Init(object sender, EventArgs e)
    {

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
    private void getStaffProfile()
    {
        try
        {
            if (objAdm.GetStaff(UserName()) == true)
            {
                lblDepartment.Text = objAdm.department_id;
                lblStaffID.Text = objAdm.staff_id;
                lblName.Text = objAdm.title + ' ' + objAdm.firstname + ' ' + objAdm.middlename + ' ' + objAdm.lastname;

                lblEmail.Text = objAdm.email;
                lblTelephoneNo.Text = objAdm.Telephone_no;
                lblDescription.Text = objAdm.staff_description;
                lblPosition.Text = objAdm.Position;
                imgStaff.Src ="../" +  objAdm.profile_pic;
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
    protected void UpdateProfile(object sender, EventArgs e)
    {
        try
        {
            string sYearMonthDay = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(HttpContext.Current.Server.MapPath("~/upload/") + sYearMonthDay + FileUpload1.FileName);
                string URL3 = "~/upload/" + sYearMonthDay + FileUpload1.FileName;
                profilePic.Value = URL3;
            }
            if (objAdm.functionStaff(lblStaffID.Text, lblDepartment.Text, lblStaffID.Text, FirstName.Value, MiddleName.Value, Lastname.Value, Email.Value, TelephoneNo.Value, gender.SelectedValue, status.SelectedValue, ckEditor.InnerText, title.SelectedValue, position.Value, profilePic.Value, "UPDATE") == true)
            {
                getStaffProfile();
                DisplaySuccess("Record updated successfully.");

            }
            else
            {
                getStaffProfile();
            }
        }
        catch (Exception ex)
        {

        }
    }
}