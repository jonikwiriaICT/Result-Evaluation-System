<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="StaffDashboard.aspx.cs" Inherits="StaffFolder_StaffDashboard" ValidateRequest ="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="card">
       <div class="card-header">
           <div class="card-title ">
               <i data-feather="monitor"></i>&nbsp Dashboard
           </div>
       </div>
       <div class="card-body">
            <section class="section">
          <div class="row ">
              <asp:LinkButton ID="lnkCourses" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-pen "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">My Courses</h4>
                     <span>
                         <i class="fa fa-pen fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">My Course</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               <asp:LinkButton ID="lnkHodApproval" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-anchor "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Approve Course</h4>
                     <span>
                         <i class="fa fa-anchor fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">Approve Course</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               <asp:LinkButton ID="lnkApproveDepartment" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-home "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Approve Department</h4>
                     <span>
                         <i class=" fa fa-home fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">Approve Department</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               <asp:LinkButton ID="lnkFaculty" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-school "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Approve Faculty</h4>
                     <span>
                         <i class=" fa fa-school fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">Approve Faculty</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
              
          </div>
                <div class="row">
                     <asp:LinkButton ID="lnkResultProcessing" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class="fa fa-chart-bar "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Result Processing</h4>
                     <span>
                         <i class=" fa fa-chart-bar fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">Result Processing</span>
                      </p>
                    </div>
                  </div>
                </div>
            
              </asp:LinkButton>
               <asp:LinkButton ID="lnkMasterSheet" OnClick ="NavigateClicked" CssClass="col-xl-3 col-lg-6" runat="server">
                   
               <div class="card l-bg-green">
                  <div class="card-statistic-3">
                    <div class="card-icon card-icon-large"><i class=" fa fa-tasks "></i></div>
                    <div class="card-content">
                      <h4 class="card-title">Master Sheet</h4>
                     <span>
                         <i class=" fa fa-tasks fa-3x"></i>
                     </span>
                      <div class="progress mt-1 mb-1" data-height="8">
                        <div class="progress-bar l-bg-orange" role="progressbar" data-width="0%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <p class="mb-0 text-sm">
                        <span class="mr-2"><i class="fa fa-arrow-up text-white"></i></span>
                        <span class="text-nowrap text-white ">Master Sheet</span>
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

