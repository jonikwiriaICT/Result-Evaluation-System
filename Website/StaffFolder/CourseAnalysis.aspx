<%@ Page Title="" Language="C#" MasterPageFile="~/StaffFolder/StaffMaster.master" AutoEventWireup="true" CodeFile="CourseAnalysis.aspx.cs" Inherits="StaffFolder_CourseAnalysis" ValidateRequest ="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <style>
      #container {
    height: 420px; 
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 360px; 
    max-width: 600px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

  </style>
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
                    <h4>My Courses Analyis</h4>
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
                    <div class="row">
    <div class="col-md-12 table-responsive ">
             <figure class="highcharts-figure">
    <div id="containerss"></div>
    <p class="highcharts-description">
        Result by percentage.
    </p>
</figure>
      
    </div>
  
</div>
  <div class="row">
        <div class="col-md-6 table-responsive ">
        <figure class="highcharts-figure">
    <div id="containers"></div>
    <p class="highcharts-description">
           Marital Status Result Analysis
    </p>
</figure>

    </div>
          <div class="col-md-6">
              <div class="table-responsive ">
     <figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
       Marital Status Result Analysis
    </p>
</figure>
  </div>
          </div>
     
  </div>
      <div class="row">
        <div class="col-md-12">
            
            

                <div class="card card-table mb-0">
                    <div class="card-body">
                        <br />
                     
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-md-12">
                                     <asp:GridView ID="TableResult" runat="server"
                            CssClass="table table-striped table-bordered c  table-hover weather-table" Font-Size="10px" BorderColor ="Transparent" AutoGenerateColumns="true" AllowCustomPaging="true"
                            EmptyDataText="There is no record for the selected item">
                            <Columns>
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



           
        </div>
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
                    <button type="button" class="btn btn-success" runat="server" id="Button1"><i class="fa fa-save"></i>&nbsp Submit Result</button>
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
     <script src="../js/jquery-3.5.0.min.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/cylinder.js"></script>
<script src="https://code.highcharts.com/modules/funnel3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/pyramid3d.js"></script>
      
    <script>
        var subjects = <%=chartGender %>;
        // Set up the chart
        Highcharts.chart('container', {
            chart: {
                type: 'funnel3d',
                options3d: {
                    enabled: true,
                    alpha: 10,
                    depth: 50,
                    viewDistance: 50
                }
            },
            title: {
                text: 'Result by Gender'
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b> ({point.y:,.0f})',
                        allowOverlap: true,
                        y: 10
                    },
                    neckWidth: '30%',
                    neckHeight: '25%',
                    width: '80%',
                    height: '80%'
                }
            },
            series: [{
                name: 'Gender Type',
                data: subjects
            }]
        });
    </script>
    <script>
         var subjects = <%=chartMaritalStatus  %>;
        Highcharts.chart('containers', {
            chart: {
                type: 'pyramid3d',
                options3d: {
                    enabled: true,
                    alpha: 10,
                    depth: 50,
                    viewDistance: 50
                }
            },
            title: {
                text: 'Result by Marital Status'
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b> ({point.y:,.0f})',
                        allowOverlap: true,
                        x: 10,
                        y: -5
                    },
                    width: '60%',
                    height: '80%',
                    center: ['50%', '45%']
                }
            },
            series: [{
                name: 'Marital Status Type',
                data: subjects
            }]
        });
    </script>
    <script>
         var subjects = <%=chartResult  %>;
        Highcharts.chart('containerss', {
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: 'Result Percentage Analysis'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Result Analysis',
                data: subjects
            }]
        });
    </script>
</asp:Content>





