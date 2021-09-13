<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="ResultInput.aspx.cs" Inherits="StaffFolder_ResultInput" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" runat="server" id="formTemplate" visible="false">
        <div class="col-12 col-sm-12 col-lg-12">
            <div class="card ">
                <div class="card-header">
                    <h4>En</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="lnkViewRecord" CssClass="dropdown-item has-icon" runat="server"><i class="fas fa-eye"></i>View Record</asp:LinkButton>

                            </div>
                        </div>

                    </div>
                </div>
                <asp:Label ID="lblCheck" runat="server" Text=""></asp:Label>
                <div class="card-body">
                    <asp:Panel ID="PnlProgram" runat="server">
                        <asp:HiddenField ID="rec_id" runat="server" />
                        <asp:HiddenField ID="department_id" runat="server" />

                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Program Title</label>
                            <div class="col-sm-12 col-md-7">
                                <asp:TextBox ID="program_title" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row mb-4">
                            <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                            <div class="col-sm-12 col-md-7">
                                <button class="btn btn-success  pull-right" id="btndep" runat="server"><i class="fa fa-save"></i>&nbsp  Save Changes</button>
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
                    <h4>Enter Result</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                 <asp:LinkButton ID="lnkDownload" CssClass="dropdown-item has-icon" OnClick="DownloadTemplate" runat="server"><i class=" fa fa-download"></i>Download Template</asp:LinkButton>
                                <asp:LinkButton ID="lnkExportToExcel" CssClass="dropdown-item has-icon" OnClick="DownloadTemplate" runat="server"><i class=" fa fa-eye"></i>Export To Excel</asp:LinkButton>
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
                                        <asp:LinkButton ID="lnkInsertClicked" OnClick="ExcelInsertClicked" runat="server"><i class="fas fa-upload text-info "></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="table-responsive">
                        <div id="dvGrid" style="padding: 10px;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="TableResult" CssClass="table table-striped table-bordered c  table-hover weather-table" Font-Size="10px" BorderColor="Transparent" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                                        DataKeyNames="CourseID, SessionID, MaxSt" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                        PageSize="20" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating"
                                        OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S/N">
                                                <ItemTemplate>
                                                    <asp:Label ID="serialNumber" runat="server" Text='<%# Eval("S/N") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Matric Number" ItemStyle-Width="150">
                                                <ItemTemplate>
                                                    <asp:Label ID="MatricNumber" runat="server" Text='<%# Eval("MatricNumber") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="First CA 10%" ItemStyle-Width="150">
                                                <ItemTemplate>
                                                    <asp:Label ID="firstCa" runat="server" Text='<%# Eval("firstCa") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="firstCa" CssClass="form-control decimal" runat="server" Text='<%# Eval("firstCa") %>'></asp:TextBox>
                                                    <asp:RangeValidator ID="RangeValidator1" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="firstCa" runat="server" CssClass="text-danger font-weight-bold" ErrorMessage="Enter only numbers between 0 and 10"></asp:RangeValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Second CA 10%" ItemStyle-Width="150">
                                                <ItemTemplate>
                                                    <asp:Label ID="secondCa" runat="server" Text='<%# Eval("secondCa") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="secondCa" CssClass="form-control decimal" runat="server" Text='<%# Eval("secondCa") %>'></asp:TextBox>
                                                    <asp:RangeValidator ID="RangeValidator155" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="secondCa" runat="server" CssClass="text-danger font-weight-bold" ErrorMessage="Enter only numbers between 0 and 10"></asp:RangeValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Third CA 10%" ItemStyle-Width="150">
                                                <ItemTemplate>
                                                    <asp:Label ID="thirdCa" runat="server" Text='<%# Eval("thirdCa") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="thirdCa" CssClass="form-control decimal" runat="server" Text='<%# Eval("thirdCa") %>'></asp:TextBox>
                                                    <asp:RangeValidator ID="RangeValidator143" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="thirdCa" runat="server" CssClass="text-danger font-weight-bold" ErrorMessage="Enter only numbers between 0 and 10"></asp:RangeValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exam 70%" ItemStyle-Width="150">
                                                <ItemTemplate>
                                                    <asp:Label ID="Exam" runat="server" Text='<%# Eval("Exam") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="Exam" CssClass="form-control decimal" runat="server" Text='<%# Eval("Exam") %>'></asp:TextBox>
                                                    <asp:RangeValidator ID="RangeValidator14" Type="Integer" MinimumValue="0" MaximumValue="70" ControlToValidate="Exam" runat="server" CssClass="text-danger font-weight-bold" ErrorMessage="Enter only numbers between 0 and 70"></asp:RangeValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-outline-info" ShowEditButton="true"
                                                ItemStyle-Width="150" />
                                        </Columns>
                                    </asp:GridView>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>


                       <%-- <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dlPager"
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
                        </asp:DataList>--%>
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
                    <button type="button" class="btn btn-danger" id="delteall" runat="server"><i class="fa fa-trash"></i>&nbsp Delete</button>
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
                    <asp:Label ID="Label2" CssClass="text-danger " runat="server" Text="Label"></asp:Label>
                </div>
                <div class="modal-footer bg-whitesmoke br">
                    <button type="button" class="btn btn-danger" runat="server" id="Button1"><i class="fa fa-trash"></i>&nbsp Delete</button>
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



