<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Tat_ca_du_lieu.aspx.cs" Inherits="MET_Station.Tat_ca_du_lieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- FOOTABLE TABLE -->
	<link href="assets/plugins/footable/css/footable.core.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/footable/css/footable.standalone.css" rel="stylesheet" type="text/css" />
    <section id="middle">            
            <!-- page title -->
            <header id="page-header">
                <h4>Dữ liệu thời tiết</h4>
                <ol class="breadcrumb">
                    <li><a href="#">Tables</a></li>
                    <li class="active">Tất cả dữ liệu</li>
                </ol>
            </header>
            <!-- /page title -->
            <div id="content" class="padding-20">
                <div id="panel-1" class="panel panel-default">
                    <div class="panel-heading">
                        <span class="title elipsis">
                            <strong>TÁT CẢ DỮ LIỆU </strong> <!-- panel title -->
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
                                <option value="4">1 / page</option>
                                <option value="8">2 / page</option>
                                <option value="12">3 / page</option>
                                <option value="16" selected="selected">4 / page</option>
                                <option value="20">5 / page</option>
                                <option value="24">6 / page</option>
                            </select>
                        </label><!-- /PER PAGE SELECTOR -->
                        <asp:Literal ID="Literal_Hienthigiatricambien" runat="server"></asp:Literal>
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
                            s300: 300,
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
