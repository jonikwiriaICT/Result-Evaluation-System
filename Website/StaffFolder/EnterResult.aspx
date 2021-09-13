<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="EnterResult.aspx.cs" Inherits="StaffFolder_EnterResult" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" runat="server" id="formTemplate" visible="false">
        <div class="col-12 col-sm-12 col-lg-12">
            <asp:HiddenField ID="CourseID" runat="server" />
             <asp:HiddenField ID="SessionID" runat="server" />
            <div class="card ">
                <div class="card-header">
                    <h4>Courses</h4>
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
                    <h4>My Courses</h4>
                    <div class="card-header-action">
                        <div class="dropdown">
                            <a href="#" data-toggle="dropdown" class="btn btn-success dropdown-toggle">Action</a>
                            <div class="dropdown-menu">
                                <asp:LinkButton ID="lnkExportToExcel" CssClass="dropdown-item has-icon" OnClick="ExportToExcel_Click" runat="server"><i class=" fa fa-eye"></i>Export To Excel</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="TableResult" CssClass="table table-striped table-bordered c  table-hover weather-table" Font-Size="10px" BorderColor="Transparent" runat="server" AutoGenerateColumns="false" OnRowCommand="TableCommand" OnRowDataBound="OnRowDataBound"
                            OnSelectedIndexChanged="tableChanged" OnRowDeleting="TableDelete" EmptyDataText="There is no record for the selected item">
                            <Columns>
                                <asp:BoundField DataField="S/N" HeaderText="S/N" />

                                <asp:BoundField DataField="CourseID" HeaderText="CourseID" />
                                <asp:BoundField DataField="Course" HeaderText="Course" />
                                <asp:BoundField DataField="Course Code" HeaderText="Course Code" />
                                <asp:BoundField DataField="SessionID" HeaderText="SessionID" />
                                <asp:TemplateField HeaderStyle-Width="5%" HeaderText="Session">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSessionID" CssClass=" font-weight-bold" runat="server" Text='<%# Eval("Session") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="Semester" HeaderText="Semester" />



                                <asp:TemplateField HeaderStyle-Width="15%" HeaderText="Enter Score" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdResult" Value='<%# Eval("Enter Result") %>' runat="server" />
                                        <asp:LinkButton ID="lbSelect" Font-Size="14px" runat="server" CssClass="btn btn-sm btn-outline-info"
                                            CausesValidation="False" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>'>
                                                    <i class="fa fa-edit " ></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="15%" HeaderText="Result Analysis" Visible="true" HeaderStyle-CssClass=" thead-default" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbDelete" runat="server" Font-Size="14px" CssClass="btn btn-sm btn-outline-info"
                                            CausesValidation="False" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>'>
                                                    <i class=" fa fa-save"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="7%"  HeaderText="Result Analysis" Visible="false" HeaderStyle-CssClass=" thead-default" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="de" runat="server" Font-Size="14px" CssClass="btn btn-sm btn-outline-info"
                                            CausesValidation="False" CommandName="Submit" CommandArgument='<%# Container.DataItemIndex %>'>
                                                    <i class=" fa fa-chart-line"></i> 
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderStyle-Width="5%" Visible ="false"  HeaderText="Remark" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" CssClass=" font-weight-bold" runat="server" Text='<%# Eval("Remark") %>'></asp:Label>
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
                    <button type="button" class="btn btn-danger" id="delteall" runat="server" ><i class="fa fa-trash"></i>&nbsp Delete</button>
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
                    <h5 class="modal-title" id="exampleModalLabels">Confirm Submission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="Label1" CssClass="text-danger " runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer bg-whitesmoke br">
                    <button type="button" class="btn btn-success" runat="server" id="Button1" onserverclick="UpdateRecord"><i class="fa fa-save"></i>&nbsp Submit Result</button>
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


