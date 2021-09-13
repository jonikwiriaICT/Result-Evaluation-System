<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Doctors_ChangePassword" ValidateRequest ="false"  %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="section">
          <div class="section-body">
            <div class="row mt-sm-4">
              <div class="col-12 col-md-12 col-lg-4">
                <div class="card author-box">
                  <div class="card-body">
                    <div class="author-box-center">
                      <img alt="image" runat ="server" id="imgUser" style="width:6em; height:6em"  src="" class="rounded-circle author-box-picture"/>
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
             
              </div>
              <div class="col-12 col-md-12 col-lg-8">
                   <div class="card ">
                <div class="card-header">
                  <h4>Change Password</h4>
                 
                </div>
               <div class="card-body">
                    <div class="form-group row mb-4">
                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Current Password</label>
                      <div class="col-sm-12 col-md-7">
                        <input type="password" runat ="server" id="OldPassword" class="form-control"/>
                      </div>
                    </div>
                   <div class="form-group row mb-4">
                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">New Password</label>
                      <div class="col-sm-12 col-md-7">
                        <input type="password" runat ="server" id="NewPassword" class="form-control"/>
                      </div>
                    </div>
                       <div class="form-group row mb-4">
                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Confirm Password</label>
                      <div class="col-sm-12 col-md-7">
                           <input type="password" runat ="server" id="ConfirmPassword" class="form-control"/>
                      </div>
                    </div>
                  
                    <div class="form-group row mb-4">
                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                      <div class="col-sm-12 col-md-7">
                        <button class="btn btn-success  pull-right" runat ="server" onserverclick ="ChangePasswordClicked"><i class="fa fa-save"></i>&nbsp  Save Changes</button>
                      </div>
                    </div>
                  </div>
              </div>
              </div>
            </div>
          </div>
        </section>
</asp:Content>

