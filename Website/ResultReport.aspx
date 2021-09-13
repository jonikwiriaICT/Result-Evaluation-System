<%@ Page Title="" Language="C#" MasterPageFile="~/ResultProcessing.master" AutoEventWireup="true" CodeFile="ResultReport.aspx.cs" Inherits="ResultReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row" runat ="server" id="TableView">
            <div class="col-12 col-sm-12 col-lg-12">
              <div class="card ">
                <div class="card-header">
                  <h4> Report Sheet</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                      <div class="dropdown-menu">
                              <asp:LinkButton ID="lnkExportToExcel" CssClass ="dropdown-item has-icon"   runat="server"><i class=" fa fa-eye"></i>Export To Excel</asp:LinkButton>
                        <div class="dropdown-divider"></div>
                      </div>
                    </div>
                   
                  </div>
                </div>
                  <div class="card-body">
                       <div class="row">
                          <div class="col-md-3">
                              <div class="form-group">
                                  <label>Select Department</label>
                                  <asp:DropDownList ID="ddlDepartment" CssClass="form-control select2" runat="server">
                                      
                                  </asp:DropDownList>

                              </div>
                          </div>
                            <div class="col-md-3">
                              <div class="form-group">
                                  <label>Select Session</label>
                                  <asp:DropDownList ID="ddlSession" CssClass="form-control select2" runat="server">
                                      
                                  </asp:DropDownList>

                              </div>
                          </div>
                            <div class="col-md-3">
                              <div class="form-group">
                                  <label>Select Level</label>
                                  <asp:DropDownList ID="ddlLevel" CssClass="form-control select2" runat="server">
                                      
                                  </asp:DropDownList>

                              </div>
                          </div>
                            <div class="col-md-3">
                              <div class="form-group">
                                  <label>Select Semester</label>
                                  <asp:DropDownList ID="ddlSemester" CssClass="form-control select2" runat="server">
                                      
                                  </asp:DropDownList>

                              </div>
                          </div>
                      </div>
                      <hr />
                    <div class="table-responsive">
                      <table class="table table-striped c " id="tblContact">
                        <thead>
                          <tr>
                               <th colspan ="2">Action</th>
                            <th class="text-center">
                              #
                            </th>
                            <th>Task Name</th>
                            <th>Progress</th>
                            <th>Members</th>
                            <th>Due Date</th>
                            <th>Status</th>
                           
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                                  <asp:LinkButton ID="LinkButton3" CssClass ="btn btn-outline-primary "  runat="server"><i class="fas fa-edit text-success "></i></asp:LinkButton>
                            </td>
                          <td><a href="#" class=" btn btn-outline-danger"><i class="fa fa-trash"></i>&nbsp Delete</a></td>
                            <td>Create a mobile app</td>
                            <td class="align-middle">
                              <div class="progress progress-xs">
                                <div class="progress-bar bg-success width-per-40">
                                </div>
                              </div>
                            </td>
                            <td>
                              <img alt="image" src="assets/img/users/user-5.png" width="35">
                            </td>
                            <td>2018-01-20</td>
                            <td>
                              <div class="badge badge-success badge-shadow">Completed</div>
                            </td>
                           <td>
                              <div class="badge badge-success badge-shadow">Completed</div>
                            </td>
                          </tr>
                       
                        </tbody>
                      </table>
                        <nav>
                           <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>
                    </div>
                  </div>
              
              </div>
            </div>
          </div>
</asp:Content>



