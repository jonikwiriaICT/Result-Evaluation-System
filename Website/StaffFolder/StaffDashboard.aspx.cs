using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;

public partial class StaffFolder_StaffDashboard : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if(!this.IsPostBack)
            {

            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void NavigateClicked(object sender, EventArgs e)
    {
        try
        {
            if(sender.Equals (lnkCourses ))
            {
                Response.Redirect("My-Courses");
            }
            if(sender.Equals (lnkHodApproval))
            {
                Response.Redirect("Approve-Course");
            }
            if(sender.Equals(lnkApproveDepartment))
            {
                Response.Redirect("Approve-Department");
            }
            if (sender.Equals(lnkFaculty ))
            {
                Response.Redirect("Approve-Faculty");
            }
            if(sender.Equals (lnkResultProcessing))
            {
                Response.Redirect("Result-Processing");
            }
            if (sender.Equals(lnkMasterSheet ))
            {
                Response.Redirect("Master-Sheet");
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
        catch(Exception ex)
        {

        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {

    }
}