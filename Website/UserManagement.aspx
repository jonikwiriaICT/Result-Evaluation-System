<%@ Page Title="" Language="C#" MasterPageFile="~/ResultProcessing.master" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" runat="server" id="formTemplate">
        <div class="col-12 col-sm-12 col-lg-12">
            <asp:HiddenField ID="passwords" runat="server" />
            <div class="card ">
                <div class="card-header">
                    <h4>User Management</h4>
                    <asp:Label ID="lblCheck" runat="server" Visible ="false"  Text="Label"></asp:Label>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="lnkViewRecord" CssClass="dropdown-item has-icon" OnClick="GoBackClicked" runat="server"><i class="fas fa-eye"></i>View Record</asp:LinkButton>

                            </div>
                        </div>

                    </div>
                </div>

                <asp:Panel ID="PnlUsermanagement" runat="server">
                    <asp:HiddenField ID="rec_id" runat="server" />
                    <asp:HiddenField ID="administrator" runat="server" />
                    <asp:HiddenField ID="exam_officer" runat="server" />
                    <asp:HiddenField ID="lecturer" runat="server" />
                    <asp:HiddenField ID="hod" runat="server" />
                    <asp:HiddenField ID="vice" runat="server" />
                    <asp:HiddenField ID="dean" runat="server" />
                    <div class="card-body">
                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Staff Name</label>
                            <div class="col-sm-12 col-md-7">
                                <asp:DropDownList ID="staff_id" CssClass="form-control select2" runat="server">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Username</label>
                            <div class="col-sm-12 col-md-7">
                                <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Role</label>
                            <div class="col-sm-12 col-md-7">
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="administrators" name="switch1" />
                                    <div class="state p-success">
                                        <label>Administrator</label>
                                    </div>
                                </div>
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="vices" name="switch1" />
                                    <div class="state p-success">
                                        <label>Vice Chancellor</label>
                                    </div>
                                </div>
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="deans" name="switch1" />
                                    <div class="state p-success">
                                        <label>Dean of Faculty</label>
                                    </div>
                                </div>
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="hods" name="switch1" />
                                    <div class="state p-success">
                                        <label>Head of Department</label>
                                    </div>
                                </div>
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="exam_officers" name="switch1" />
                                    <div class="state p-success">
                                        <label>Exam Officer</label>
                                    </div>
                                </div>
                                <div class="pretty p-switch">
                                    <input type="radio" runat="server" id="lecturers" name="switch1" />
                                    <div class="state p-success">
                                        <label>Lecturer</label>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                            <div class="col-sm-12 col-md-7">
                                <button class="btn btn-success  pull-right" runat="server" id="btnuser" onserverclick="SaveChangesClicked"><i class="fa fa-save"></i>&nbsp  Save Changes</button>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

            </div>
        </div>
    </div>
    <div class="row" runat="server" id="View">
        <div class="col-12 col-sm-12 col-lg-12">
            <div class="card ">
                <div class="card-header">
                    <h4>User Management</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="lnkAddNewRecord" CssClass="dropdown-item has-icon" OnClick="AddNewRecordClicked" runat="server"><i class="fas fa-plus"></i>Add New Record</asp:LinkButton>


                                <asp:LinkButton ID="lnkExportToExcel" CssClass="dropdown-item has-icon" OnClick="ExportToExcel_Click" runat="server"><i class=" fa fa-eye"></i>Export To Excel</asp:LinkButton>
                                <div class="dropdown-divider"></div>
                                <asp:LinkButton ID="lnkCheck" CssClass="dropdown-item has-icon" OnClick="checkAll" runat="server"><i class=" fa fa-check"></i>Check All Rows</asp:LinkButton>
                                <asp:LinkButton ID="lnkDeleteCheckedRows" CssClass="dropdown-item has-icon" OnClick="deleteCheckedRows" runat="server"><i class=" fa fa-trash-restore"></i>Delete Checked Rows</asp:LinkButton>

                                <asp:LinkButton ID="lnkDelete" CssClass="dropdown-item has-icon" runat="server" data-toggle="modal" data-target="#DeleteAllRecord"><i class=" fa fa-trash"></i>Delete Record</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Select by Faculty</label>
                                <asp:DropDownList ID="ddlDepartment" CssClass="form-control select2" AutoPostBack="true" OnSelectedIndexChanged="LoadDepartment" runat="server">
                                </asp:DropDownList>

                            </div>
                        </div>
                    </div>
                    <hr />

                    <div class="table-responsive">
                        <asp:GridView ID="TableResult" runat="server" Font-Size="10px"
                            CssClass="table table-striped table-bordered c  table-hover weather-table" AutoGenerateColumns="true" AllowCustomPaging="true"
                            OnSelectedIndexChanged="tableChanged" OnRowDeleting="TableDelete"
                            EmptyDataText="There is no record for the selected item">
                            <Columns>
                                <asp:TemplateField HeaderStyle-Width="7%" HeaderText="Delete Record" Visible="true" HeaderStyle-CssClass=" thead-default" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbDelete" runat="server" Font-Size="14px" CssClass="btn btn-sm btn-outline-danger"
                                            CausesValidation="False" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>'>
                                                    <i class="fa fa-trash"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="5%" HeaderText="Edit Record" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbSelect" Font-Size="14px" runat="server" CssClass="btn btn-sm btn-outline-info"
                                            CausesValidation="False" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>'>
                                                    <i class="fa fa-edit " ></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="7%" HeaderText=" Checked row(s)" HeaderStyle-CssClass=" thead-default" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkResult" CssClass="text-white " runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                        <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dlPager"
                            OnItemCommand="dlPager_ItemCommand">
                            <ItemTemplate>

                                <nav class="pagination">
                                    <ul class="pagination">
                                        <li class="page-item ">
                                            <asp:LinkButton Enabled='<%#Eval("Enabled") %>' CssClass="page-link " runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>

                                        </li>
                                    </ul>
                                </nav>

                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="DeleteAllRecord" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Record</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure that you want to delete all Record
                </div>
                <div class="modal-footer bg-whitesmoke br">
                    <button type="button" class="btn btn-danger" id="delteall" runat="server" onserverclick="deleteAllRecords"><i class="fa fa-trash"></i>&nbsp Delete</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="DeleteRecord" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabels"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabels">Delete Record</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="Label1" CssClass="text-danger " runat="server" Text="Label"></asp:Label>
                </div>
                <div class="modal-footer bg-whitesmoke br">
                    <button type="button" class="btn btn-danger" runat="server" id="jjj" onserverclick="lbDeleteYes_Click"><i class="fa fa-trash"></i>&nbsp Delete</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script src="scripts/ckeditor/ckeditor.js"></script>
    <script>
        function showDelete() {
            $('#DeleteRecord').modal('show')
        }
    </script>
</asp:Content>


