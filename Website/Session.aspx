<%@ Page Title="" Language="C#" MasterPageFile="~/ResultProcessing.master" AutoEventWireup="true" CodeFile="Session.aspx.cs" Inherits="Session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" runat="server" id="formTemplate">
        <div class="col-12 col-sm-12 col-lg-12">
            <div class="card ">
                <div class="card-header">
                    <h4>Session</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="LinkButton1" CssClass="dropdown-item has-icon" OnClick="GoBackClicked" runat="server"><i class="fas fa-eye"></i>View Record</asp:LinkButton>

                            </div>
                        </div>

                    </div>
                </div>
                <asp:Label ID="lblCheck" runat="server" Visible="false" Text=""></asp:Label>
                <div class="card-body">
                    <asp:Panel ID="PnlSession" runat="server">
                        <asp:HiddenField ID="rec_id" runat="server" />

                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Session Year From</label>
                            <div class="col-sm-12 col-md-7">
                                <asp:TextBox ID="session_year_from" runat="server" CssClass="form-control decimal"></asp:TextBox>
                            </div>
                        </div>
                          <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Session Year To</label>
                            <div class="col-sm-12 col-md-7">
                                <asp:TextBox ID="session_year_to" runat="server" CssClass="form-control decimal"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                            <div class="col-sm-12 col-md-7">
                                <button class="btn btn-success  pull-right" runat="server" id="btnchange" onserverclick="SaveChangesClicked"><i class="fa fa-save"></i>&nbsp  Save Changes</button>
                            </div>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>
    <div class="row" runat="server" id="View">
        <div class="col-12 col-sm-12 col-lg-12">
            <div class="card ">
                <div class="card-header">
                    <h4>Session</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="lnkAddNewRecord" CssClass="dropdown-item has-icon" OnClick="AddNewRecordClicked" runat="server"><i class="fas fa-plus"></i>Add New Record</asp:LinkButton>

                                <asp:LinkButton ID="lnkDownloadTemplate" CssClass="dropdown-item has-icon" OnClick="downloadExcelTemplate" runat="server"><i class=" fa fa-download"></i>Download Template</asp:LinkButton>

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
                    <div class="form-group row mb-4">
                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Upload Excel</label>
                        <div class="col-sm-12 col-md-7">
                            <div class="input-group">
                                <asp:FileUpload ID="FlUploadcsv" CssClass="form-control " runat="server" />
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:LinkButton ID="LinkButton2" OnClick="ExcelInsertClicked" runat="server"><i class="fas fa-upload text-success "></i></asp:LinkButton>

                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
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

