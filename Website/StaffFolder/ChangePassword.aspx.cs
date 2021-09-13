using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;

public partial class Doctors_ChangePassword : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
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
    private void showIdentity()
    {
        try
        {
            if (objAdm.GetIdentity(UserName()) == true)
            {
                lblName.Text = objAdm.Name;
                lblPosition.Text = objAdm.Position;
                imgUser.Src ="../" + objAdm.Pic;

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
            if (!this.IsPostBack)
            {
                showIdentity();
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
    protected void ChangePasswordClicked(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(OldPassword.Value))
            {
                DisplayError("Enter your current password.");
            }
            if (string.IsNullOrEmpty(NewPassword.Value))
            {
                DisplayError("Enter your New password.");
            }
            if (NewPassword.Value != ConfirmPassword.Value)
            {
                DisplayError("New Password does not match confirm password.");
            }
            else
            {
                string NewPasswords = objAdm.Encrypt(NewPassword.Value);
                if (objAdm.changePassword(OldPassword.Value, NewPasswords) == true)
                {
                    DisplaySuccess("Password has been changed successfully.");

                }
                else
                {
                    DisplayError(objAdm.ErrorMessage);
                }
            }
        }
        catch (Exception ex)
        {
            DisplayError(objAdm.ErrorMessage);
        }
    }
}