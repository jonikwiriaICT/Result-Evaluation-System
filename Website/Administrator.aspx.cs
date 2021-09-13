using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResultLibrary;

public partial class Administrator : System.Web.UI.Page
{
    SysAdminModel objAdm = new SysAdminModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                CountData();
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
    private void CountData()
    {
        try
        {
            lblfaculty.Text = objAdm.CountData("tbl_faculty");
            lblDepartment .Text = objAdm.CountData("tbl_department");
            lblProgram .Text = objAdm.CountData("tbl_program");
            lblSemester.Text = objAdm.CountData("tbl_semester");
            lblCourse.Text = objAdm.CountData("tbl_course");
            lblCourseType.Text = objAdm.CountData("tbl_course_type");
            lblLevel.Text = objAdm.CountData("tbl_level");
            lblSession.Text = objAdm.CountData("tbl_session");
            lblStaff.Text = objAdm.CountData("tbl_staff");
            lblUserManagement.Text = objAdm.CountData("tbl_usermanagement");
            lblAssignCourse.Text = objAdm.CountData("tbl_assign_course");
            lblViceChancellor.Text = objAdm.CountData("tbl_vice");


            lblRegistrar .Text = objAdm.CountData("tbl_registrar");
            lblDean .Text = objAdm.CountData("tbl_dean");
            lblhod .Text = objAdm.CountData("tbl_hod");
            lblExamOfficer .Text = objAdm.CountData("tbl_exam_officer");

            lblStudent .Text = objAdm.CountData("tbl_student");
            lblCourseRegistration.Text = objAdm.CountData("tbl_course_registration");

            lblAuditTrail .Text = objAdm.CountData("tbl_user_log");
            lblSmsSettings .Text = objAdm.CountData("tbl_sms");

        }
        catch(Exception ex)
        {

        }
    }
    protected void NavigateClicked(object sender, EventArgs e)
    {
        try
        {
            if(sender.Equals(lnkFaculty))
            {
                Response.Redirect("Faculty");
            }
            if (sender.Equals(lnkDepartment))
            {
                Response.Redirect("Department");
            }
            if (sender.Equals(lnkProgram))
            {
                Response.Redirect("Program");
            }
            if (sender.Equals(lnkSemester))
            {
                Response.Redirect("Semester");
            }
            if (sender.Equals(lnkLevel))
            {
                Response.Redirect("Level");
            }
            if (sender.Equals(lnkCourseType))
            {
                Response.Redirect("Course-Type");
            }
            if (sender.Equals(lnkCourse))
            {
                Response.Redirect("Course");
            }
            if (sender.Equals(lnkSession ))
            {
                Response.Redirect("Session");
            }
            if (sender.Equals(lnkStaff ))
            {
                Response.Redirect("Staff");
            }
            if(sender.Equals (lnkAssignCourse))
            {
                Response.Redirect("Assign-Course");
            }
            if(sender.Equals (lnkUserManagement))
            {
                Response.Redirect("User-Management");
            }
            if(sender.Equals (lnkViceChancellor))
            {
                Response.Redirect("Vice-Chancellor");
            }
            if (sender.Equals(lnkRegistrar ))
            {
                Response.Redirect("Registrar");
            }
            if(sender .Equals(lnkDean))
            {
                Response.Redirect("Dean-Of-Faculty");
            }
            if(sender.Equals(lnkHod))
            {
                Response.Redirect("Head-Of-Department");
            }
            if (sender.Equals(lnkExamOfficer ))
            {
                Response.Redirect("Exam-Officer");
            }
            if (sender.Equals(lnkStudent))
            {
                Response.Redirect("Student");
            }
            if(sender.Equals(lnkStudentRegistration))
            {
                Response.Redirect("Course-Registration");
            }
            if(sender.Equals(lnkSmsSettings))
            {
                Response.Redirect("Sms-Settings");
            }
            if (sender.Equals(lnkAuditTrail))
            {
                Response.Redirect("Audit-Trail");
            }
        }
        catch(Exception ex)
        {

        }
    }
}