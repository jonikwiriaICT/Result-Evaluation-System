<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="StaffFolder_Dashboard" ValidateRequest ="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       <section class="section">
          <div class="section-body">
            <div class="row mt-sm-4">
              <div class="col-12 col-md-12 col-lg-4">
                <div class="card author-box">
                  <div class="card-body">
                    <div class="author-box-center">
                      <img alt="image" src="" id="imgStaff" runat ="server" style="width:7em; height:7em" class="rounded-circle author-box-picture"/>
                      <div class="clearfix"></div>
                      <div class="author-box-name">
                        <a href="#">
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                        </a>
                      </div>
                      <div class="author-box-job">
                             <asp:Label ID="lblPosition" runat="server" Text=""></asp:Label>
                      </div>
                    </div>
                   
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <h4>Personal Details</h4>
                  </div>
                  <div class="card-body">
                    <div class="py-4">
                      <p class="clearfix">
                      
                      <p class="clearfix">
                        <span class="float-left">
                          Phone
                        </span>
                        <span class="float-right text-muted">
                             <asp:Label ID="lblTelephoneNo" runat="server" Text=""></asp:Label>
                        </span>
                      </p>
                      <p class="clearfix">
                        <span class="float-left">
                          Mail
                        </span>
                        <span class="float-right text-muted">
                           <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                        </span>
                      </p>
                     
                    </div>
                  </div>
                </div>
       
              </div>
              <div class="col-12 col-md-12 col-lg-8">
                <div class="card">
                  <div class="padding-20">
                    <ul class="nav nav-tabs" id="myTab2" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="home-tab2" data-toggle="tab" href="#about" role="tab"
                          aria-selected="true">About</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#settings" role="tab"
                          aria-selected="false">Setting</a>
                      </li>
                    </ul>
                    <div class="tab-content tab-bordered" id="myTab3Content">
                      <div class="tab-pane fade show active" id="about" role="tabpanel" aria-labelledby="home-tab2">
                        <div class="row">
                          <div class="col-md-3 col-6 b-r">
                            <strong>Department</strong>
                            <br>
                            <p class="text-muted">
                                   <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label>
                            </p>
                          </div>
                          <div class="col-md-3 col-6 b-r">
                            <strong>Staff ID</strong>
                            <br>
                            <p class="text-muted">
                                   <asp:Label ID="lblStaffID" runat="server" Text=""></asp:Label>
                            </p>
                          </div>
                          
                        </div>
                        <p >
                               <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                        </p>
                       
                      </div>
                      <div class="tab-pane fade" id="settings" role="tabpanel" aria-labelledby="profile-tab2">
                        <div  class="needs-validation">
                          <div class="card-header">
                            <h4>Edit Profile</h4>
                          </div>
                          <div class="card-body">
                              <asp:HiddenField ID="profilePic" runat="server" />
                            <div class="row">
                                 <div class="form-group col-md-3 col-12">
                                <label>Title</label>
                                     <asp:DropDownList ID="title" CssClass ="form-control" runat="server">
                                         <asp:ListItem Value ="MR.">MR.</asp:ListItem>
                                          <asp:ListItem Value ="MRS.">MRS.</asp:ListItem>
                                          <asp:ListItem Value ="HON.">HON.</asp:ListItem>
                                          <asp:ListItem Value ="DR.">DR.</asp:ListItem>
                                          <asp:ListItem Value ="ASS. PROF.">ASS. PROF.</asp:ListItem>
                                          <asp:ListItem Value ="PROF.">PROF.</asp:ListItem>
                                     </asp:DropDownList>
                                
                              </div>
                              <div class="form-group col-md-3 col-12">
                                <label>First Name</label>
                                <input type="text" class="form-control" runat ="server" id="FirstName" value=""/>
                              
                              </div>
                                 <div class="form-group col-md-3 col-12">
                                <label>Middle Name</label>
                                <input type="text" class="form-control" runat ="server" id="MiddleName"  value=""/>
                               
                              </div>
                              <div class="form-group col-md-3 col-12">
                                <label>Last Name</label>
                                <input type="text" class="form-control" runat ="server" id="Lastname" value=""/>
                              
                              </div>
                            </div>
                               <div class="row">
                              <div class="form-group col-md-6 col-12">
                                <label>Gender</label>
                              <asp:DropDownList ID="gender" CssClass ="form-control" runat="server">
                                         <asp:ListItem Value ="M">Male</asp:ListItem>
                                          <asp:ListItem Value ="F">Female</asp:ListItem>
                                        
                                     </asp:DropDownList>
                                
                              </div>
                              <div class="form-group col-md-6 col-12">
                                <label>Marital Status</label>
                                 <asp:DropDownList ID="status" CssClass ="form-control" runat="server">
                                         <asp:ListItem Value ="MARRIED">Married</asp:ListItem>
                                          <asp:ListItem Value ="SINGLE">Single</asp:ListItem>
                                        
                                     </asp:DropDownList>
                              </div>
                            </div>
                            <div class="row">
                              <div class="form-group col-md-6 col-12">
                                <label>Email</label>
                                <input type="email" class="form-control" runat ="server" id="Email" value="test@example.com"/>
                                
                              </div>
                              <div class="form-group col-md-6 col-12">
                                <label>Phone</label>
                                <input type="tel" class="form-control" runat ="server" id="TelephoneNo" value=""/>
                              </div>
                            </div>
                               <div class="row">
                              <div class="form-group col-md-6 col-12">
                                <label>Position</label>
                                <input type="text" class="form-control" runat ="server" id="position" value=""/>
                                
                              </div>
                              <div class="form-group col-md-6 col-12">
                                <label>Upload Photo</label>
                                  <asp:FileUpload ID="FileUpload1" CssClass ="form-control" runat="server" />
                              </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-12">
                                    <label>Bio</label>



                                    <textarea id="ckEditor" runat="server" class="ckeditor" cols="20" rows="2"></textarea>


                                </div>
                            </div>

                          </div>
                          <div class="card-footer text-right">
                            <button class="btn btn-success" runat ="server" onserverclick ="UpdateProfile"><i class="fa fa-save"></i>&nbsp  Save Changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      <script src="scripts/ckeditor/ckeditor.js"></script>
</asp:Content>



