<%@ Page Title="" Language="C#" MasterPageFile="~/ResultProcessing.master" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Administrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="card">
          <div class="card-header">
              <div class="card-title">
                  <i data-feather="monitor"></i>&nbsp Dashboard
              </div>
          </div>
          <div class="card-body">
                  <section class="section">
          <div class="row ">
              <asp:LinkButton ID="lnkFaculty" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-brown" style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-school"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Faculty</h4>
                      <span >
                          <asp:Label ID="lblfaculty" runat="server" CssClass ="counters" Text="2333"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Faculty Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>

             <asp:LinkButton ID="lnkDepartment" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-home"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Department</h4>
                     <span >
                          <asp:Label ID="lblDepartment" runat="server" CssClass ="counters" Text="567"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Department Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
              <asp:LinkButton ID="lnkProgram" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-certificate"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Program</h4>
                     <span >
                          <asp:Label ID="lblProgram" runat="server" CssClass ="counters" Text="34"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Program Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                <asp:LinkButton ID="lnkSemester" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-pen"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Semester</h4>
                     <span >
                          <asp:Label ID="lblSemester" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Semester Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
          
            
          </div>

          <div class="row ">
               <asp:LinkButton ID="lnkLevel" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-pen-fancy"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Level</h4>
                     <span >
                          <asp:Label ID="lblLevel" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Level Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               <asp:LinkButton ID="lnkCourseType" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-book-reader"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Course Type</h4>
                     <span >
                          <asp:Label ID="lblCourseType" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Course Type Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                <asp:LinkButton ID="lnkCourse" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-book"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Course</h4>
                     <span >
                          <asp:Label ID="lblCourse" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Course Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                 <asp:LinkButton ID="lnkSession" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-address-book"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Session</h4>
                     <span >
                          <asp:Label ID="lblSession" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Session Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
            

      
          
          </div>
          <div class="row ">
                   <asp:LinkButton ID="lnkStaff" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-users"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Staff</h4>
                     <span >
                          <asp:Label ID="lblStaff" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Staff Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                    <asp:LinkButton ID="lnkAssignCourse" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-briefcase"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Assign Course</h4>
                     <span >
                          <asp:Label ID="lblAssignCourse" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Assign Course Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               
                  <asp:LinkButton ID="lnkUserManagement" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">User Management</h4>
                     <span >
                          <asp:Label ID="lblUserManagement" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">User Management Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                  <asp:LinkButton ID="lnkViceChancellor" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-shield"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Vice Chancellor</h4>
                     <span >
                          <asp:Label ID="lblViceChancellor" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Vice Chancellor Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
            
           <asp:LinkButton ID="lnkStudent" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-graduate"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Student</h4>
                     <span >
                          <asp:Label ID="lblStudent" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Student Records</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
          

           
           
          </div>
             <div class="row ">
                   <asp:LinkButton ID="lnkRegistrar" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-edit"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Registrar</h4>
                     <span >
                          <asp:Label ID="lblRegistrar" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Registrar Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                  <asp:LinkButton ID="lnkDean" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-cog"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Dean of Faculty</h4>
                     <span >
                          <asp:Label ID="lblDean" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Dean Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                      <asp:LinkButton ID="lnkHod" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-clock"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Head of Department</h4>
                     <span >
                          <asp:Label ID="lblhod" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Head of Department Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                   <asp:LinkButton ID="lnkExamOfficer" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-user-astronaut"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Exam Officer</h4>
                     <span >
                          <asp:Label ID="lblExamOfficer" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Exam Officer Record</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>


                  
                   
         
            
            
          </div>
          <div class="row">
          
                 
             <asp:LinkButton ID="lnkStudentRegistration" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-book-medical"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Course Registration</h4>
                     <span >
                          <asp:Label ID="lblCourseRegistration" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Course Registration Records</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
                     <asp:LinkButton ID="lnkAuditTrail" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-history"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Audit Trail</h4>
                     <span >
                          <asp:Label ID="lblAuditTrail" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Audit Trail Records</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
             
      <asp:LinkButton ID="lnkSmsSettings" Visible ="false"  OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card " style="background-color: #834747">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-chart-area"></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Sms Settings</h4>
                     <span >
                          <asp:Label ID="lblSmsSettings" runat="server" CssClass ="counters" Text="100"></asp:Label>
                      </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white">Sms setting Records</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
        
          
          </div>
        
        </section>
          </div>
      </div>

</asp:Content>

