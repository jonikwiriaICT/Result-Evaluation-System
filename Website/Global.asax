<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    static void RegisterRoutes(RouteCollection routes)
    {
        //first param is unique, second param is the expected url, thrid param is the actual file/page
        //general root menu

        routes.MapPageRoute("rten", "en", "~/Default.aspx");
        routes.MapPageRoute("rtIndex", "index", "~/Default.aspx");
        routes.MapPageRoute("rterroir", "error", "~/Error.aspx");

        //Administrator
        routes.MapPageRoute("rtAdministrator", "Dashboard", "~/Administrator.aspx");
        routes.MapPageRoute("rtFaculty", "Faculty", "~/Faculty.aspx");
        routes.MapPageRoute("rtDepartment", "Department", "~/Department.aspx");
        routes.MapPageRoute("rtProgram", "Program", "~/Program.aspx");
        routes.MapPageRoute("rtSemester", "Semester", "~/Semester.aspx");
        routes.MapPageRoute("rtLevel", "Level", "~/Level.aspx");
        routes.MapPageRoute("rtCourseType", "Course-Type", "~/CourseType.aspx");
        routes.MapPageRoute("rtCourse", "Course", "~/Course.aspx");
        routes.MapPageRoute("rtSession", "Session", "~/Session.aspx");
        routes.MapPageRoute("rtStaff", "Staff", "~/Staff.aspx");
        routes.MapPageRoute("rtAssignCourse", "Assign-Course", "~/AssignCourse.aspx");
        routes.MapPageRoute("rtUserManagement", "User-Management", "~/UserManagement.aspx");
        routes.MapPageRoute("rtViceChancellor", "Vice-Chancellor", "~/ViceChancellor.aspx");
        routes.MapPageRoute("rtRegistrar", "Registrar", "~/Registrar.aspx");
        routes.MapPageRoute("rtDeanOfFaculty", "Dean-Of-Faculty", "~/DeanOfFaculty.aspx");
        routes.MapPageRoute("rtHeadOfDepartment", "Head-Of-Department", "~/HeadOfDepartment.aspx");
        routes.MapPageRoute("rtExamOfficer", "Exam-Officer", "~/ExamOfficer.aspx");
        routes.MapPageRoute("rtStudentd", "Student", "~/Student.aspx");
        routes.MapPageRoute("rtCourseRegistration", "Course-Registration", "~/CourseRegistration.aspx");
        routes.MapPageRoute("rtSmsSettings", "Sms-Settings", "~/SmsSettings.aspx");
        routes.MapPageRoute("rtAuditTrail", "Audit-Trail", "~/AuditTrail.aspx");
        routes.MapPageRoute("rtStaffProfile", "Staff-Profile", "~/StaffProfile.aspx");
        routes.MapPageRoute("rtChangePassword", "Change-Password", "~/ChangePassword.aspx");

        //Student
        routes.MapPageRoute("rtStudemtDas", "Student-Dashboard", "~/students/Dashboard.aspx");
         routes.MapPageRoute("rtStudemtDasChangePassword", "student-Change-Password", "~/students/StudentChangePassword.aspx");
        
        //Staff Folder
        routes.MapPageRoute("rtStaffFolderDashboard", "Staff-Dashboard", "~/StaffFolder/Dashboard.aspx");
           routes.MapPageRoute("RTErrorEN", "ErrorEN", "~/StaffFolder/ErrorEN.aspx");
          routes.MapPageRoute("rtDash", "Dash", "~/StaffFolder/StaffDashboard.aspx");
        
        routes.MapPageRoute("rtStaffFolderChangePassword", "Staff-Change-Password", "~/StaffFolder/ChangePassword.aspx");
        routes.MapPageRoute("rtEnterResult", "My-Courses", "~/StaffFolder/EnterResult.aspx");
         routes.MapPageRoute("rtResultInput", "Result-Input", "~/StaffFolder/ResultInput.aspx");
         routes.MapPageRoute("rtCourseAnalysis", "Result-Statistics", "~/StaffFolder/CourseAnalysis.aspx");
         routes.MapPageRoute("rtCourseApproval", "Approve-Course", "~/StaffFolder/HODApproval.aspx");
     routes.MapPageRoute("rtApproveDepartment", "Approve-Department", "~/StaffFolder/ApproveDepartment.aspx");
      routes.MapPageRoute("rtApproveFaculty", "Approve-Faculty", "~/StaffFolder/ApproveFaculty.aspx");
    routes.MapPageRoute("rtResultProcessing", "Result-Processing", "~/StaffFolder/ResultProcessing.aspx");
    routes.MapPageRoute("rtMasterSheet", "Master-Sheet", "~/StaffFolder/MasterSheet.aspx");
    
    
        
        
        

























    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        //SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
    }
</script>
