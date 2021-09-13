<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="ErrorEN.aspx.cs" Inherits="StaffFolder_ErrorEN" ValidateRequest ="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="section">
      <div class="container mt-5">
        <div class="page-error">
          <div class="page-inner">
            <h1>404</h1>
            <div class="page-description">
              You are not authorized to use this page</div>
            <div class="page-search">
            
              <div class="mt-3">
                <a href="Staff-Dashboard">Back to Home</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</asp:Content>

