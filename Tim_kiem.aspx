<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Tim_kiem.aspx.cs" Inherits="MET_Station.Tim_kiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- FOOTABLE TABLE -->
	<link href="assets/plugins/footable/css/footable.core.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/footable/css/footable.standalone.css" rel="stylesheet" type="text/css" />
    <section id="middle">            
            <!-- page title -->
            <header id="page-header">
                <h4>Tìm kiếm dữ liệu thời tiết</h4>
                <ol class="breadcrumb">
                    <li><a href="#">Tables</a></li>
                    <li class="active">Dữ liệu tìm kiếm</li>
                </ol>
            </header>
            <!-- /page title -->
            <div id="content" class="padding-20">
                <div id="panel-1" class="panel panel-default">
                    <div class="panel-heading">
                        <span class="title elipsis">
                            <strong>DỮ LIỆU TÌM KIẾM</strong> <!-- panel title -->
                        </span>

                        <!-- right options -->
                        <ul class="options pull-right list-inline">
                            <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="Colapse" data-placement="bottom"></a></li>
                            <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="Fullscreen" data-placement="bottom"><i class="fa fa-expand"></i></a></li>
                            <li><a href="#" class="opt panel_close" data-confirm-title="Confirm" data-confirm-message="Are you sure you want to remove this panel?" data-toggle="tooltip" title="Close" data-placement="bottom"><i class="fa fa-times"></i></a></li>
                        </ul>
                        <!-- /right options -->

                    </div>

                    <!-- panel content -->
                    <div class="panel-body">
                        <label>
                            <!-- PER PAGE SELECTOR . you can move it to panel-heading -->
                            <select class="form-control pointer" id="change-page-size">
                               <option value="1000">Select All</option>
                                <option value="5">5 / page</option>
                                <option value="10">10 / page</option>
                                <option value="15">15 / page</option>
                                <option value="20" selected="selected">20 / page</option>
                                <option value="25">25 / page</option>
                                <option value="30">30 / page</option>
                            </select>
                        </label><!-- /PER PAGE SELECTOR -->

                        <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="ID: "></asp:Label> <asp:TextBox ID="tbxID" runat="server" placeholder="CB 001"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text=" StartTime: "></asp:Label><asp:TextBox ID="tbxStarttime" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text=" EndTime: "></asp:Label> <asp:TextBox ID="tbxEndtime" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                        <asp:Button  ID="btnXem" runat="server" backcolor="#ff0000" Font-Size="18px" Text="Xem giá trị cảm biến" OnClick="btnXem_Click" />
                        <asp:Literal ID="Literal_Timkiemgiatricambien" runat="server"></asp:Literal>
                    </div>
                    <!-- /panel content -->

                </div>
                <!-- /PANEL -->

            </div>
        </section>
    <!-- JAVASCRIPT FILES -->
        <script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
        <script type="text/javascript" src="assets/plugins/jquery/jquery-2.2.3.min.js"></script>
        <script type="text/javascript" src="assets/js/app.js"></script>
    <!-- PAGE LEVEL SCRIPTS -->
    <script type="text/javascript">
        loadScript(plugin_path + "footable/dist/footable.min.js", function () {
            loadScript(plugin_path + "footable/dist/footable.sort.min.js", function () {
                loadScript(plugin_path + "footable/dist/footable.paginate.min.js", function () { /** remove if pagination not needed **/

                    // footable
                    var $ftable = jQuery('.fooTableInit');


                    /** 01. FOOTABLE INIT
                    ******************************************* **/
                    $ftable.footable({
                        breakpoints: {
                            s300: 100,
                            s600: 600
                        }
                    });


                    /** 01. PER PAGE SWITCH
                    ******************************************* **/
                    jQuery('#change-page-size').change(function (e) {
                        e.preventDefault();
                        var pageSize = jQuery(this).val();
                        $ftable.data('page-size', pageSize);
                        $ftable.trigger('footable_initialized');
                    });

                    jQuery('#change-nav-size').change(function (e) {
                        e.preventDefault();
                        var navSize = jQuery(this).val();
                        $ftable.data('limit-navigation', navSize);
                        $ftable.trigger('footable_initialized');
                    });


                    /** 02. BOOTSTRAP 3.x PAGINATION FIX
                    ******************************************* **/
                    jQuery("div.pagination").each(function () {
                        jQuery("div.pagination ul").addClass('pagination');
                        jQuery("div.pagination").removeClass('pagination');
                    });

                });
            });
        });
    </script>
</asp:Content>
