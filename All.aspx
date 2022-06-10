<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="MET_Station.All" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="middle">
        <div id="content" class="dashboard padding-20">					
		    <div id="panel-1" class="panel panel-default">
			    <div class="panel-heading">
				    <span class="title elipsis">
					    <strong>GIỚI THIỆU PROJECT</strong> <!-- panel title -->
					    <small class="size-12 weight-300 text-mutted hidden-xs">9/3/2021</small>
				    </span>
				    <!-- right options -->
				    <ul class="options pull-right list-inline">
					    <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
					    <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Fullscreen"><i class="fa fa-expand"></i></a></li>
				    </ul>
				    <!-- /right options -->

			    </div>

			    <!-- panel content -->
			    <div class="panel-body text-center">
				    <img src="assets/images/Hust.png" width="500"/>	
                    <div> <h4>   </h4></div>
                    <h1><strong>TRẠM QUAN TRẮC THỜI TIẾT</strong></h1>
                    <span style="font-size:22px"><strong>GVHD: TS.Đào Quý Thịnh </strong></span><br />
                    <span style="font-size:18px"><strong>Nhóm : Đồ Án Thiết Kế </strong></span>
			    </div>
			    <!-- /panel content -->

			    <!-- panel footer -->
			    <div class="panel-footer">

				    <!-- 
					    .md-4 is used for a responsive purpose only on col-md-4 column.
					    remove .md-4 if you use on a larger column
				    -->
				    <ul class="easypiecharts list-unstyled">
					    <li class="clearfix">
						    <span class="stat-number">Nguyễn Thị Thanh</span>
						    <span class="stat-title">MSSV: 20174207</span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-circle" src="assets/images/Nguyen_Thanh.jpg" width="60px" />
						    </span> 
					    </li>
					    <li class="clearfix">
						    <span class="stat-number">Phạm Trung Hiếu</span>
						    <span class="stat-title">MSSV: 20173873</span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-circle" src="assets/images/Trung_Hieu.jpg" width="60px" />
						    </span> 
					    </li>
					    <li class="clearfix">
						    <span class="stat-number">Vũ Văn Hoan</span>
						    <span class="stat-title">MSSV: 20173890</span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-circle" src="assets/images/Hoan_Vu.jpg" width="60px" />
						    </span> 
					    </li>
					    <li class="clearfix">
						    <span class="stat-number">Lê Văn Công</span>
						    <span class="stat-title">MSSV: 20173694</span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-circle" src="assets/images/Cong_Le.png" width="60px" />
						    </span> 
					    </li>
				    </ul>

			    </div>
			    <!-- /panel footer -->

		    </div>
		    <!-- /PANEL -->



		    <!-- BOXES -->
		    <div class="row">

			    <!-- Cảm biến nhiệt độ số 1 Box -->
			    <div class="col-md-4 col-sm-6">

				    <!-- BOX -->
				    <div class="box danger"><!-- default, danger, warning, info, success -->

					    <div class="box-title">
							<div class="text-center"><!-- add .noborder class if box-body is removed -->
						    <h4><a href="Nhiet_do.aspx">Dữ liệu về nhiệt độ</a></h4>
						    <small class="block">TOP 5 MỚI NHẤT</small>
						    <i class="fa fa-sun-o"></i>
						</div>
					    </div>

					    <div class="box-body text-center">
						    <asp:Literal ID="Literal_ShowValue1" runat="server"></asp:Literal>
					    </div>

				    </div>
				    <!-- /BOX -->

			    </div>

			    <!-- Cảm biến nhiệt độ số 2 Box -->
			    <div class="col-md-4 col-sm-6">

				    <!-- BOX -->
				    <div class="box warning"><!-- default, danger, warning, info, success -->

					    <div class="box-title"><!-- add .noborder class if box-body is removed -->
							<div class="text-center">
						    <h4><a href="Do_am.aspx">Dữ liệu về độ ẩm</a></h4>
						    <small class="block">TOP 5 MỚI NHẤT</small>
						    <i class="fa fa-sun-o"></i>
							</div>
					    </div>

					    <div class="box-body text-center">
                            <asp:Literal ID="Literal_ShowValue2" runat="server"></asp:Literal>
					    </div>

				    </div>
				    <!-- /BOX -->

			    </div>

			    <!-- Cảm biến khoảng cách Box -->
			    <div class="col-md-4 col-sm-6">

				    <!-- BOX -->
				    <div class="box info"><!-- default, danger, warning, info, success -->

					    <div class="box-title"><!-- add .noborder class if box-body is removed -->
							<div class="text-center">
						    <h4><a href="toc_do_gio.aspx">Dữ liệu về tốc độ gió</a></h4>
						    <small class="block">TOP 5 MỚI NHẤT</small>
						    <i class="fa fa-arrows-v"></i>
							</div>
					    </div>

					    <div class="box-body text-center">
                            <asp:Literal ID="Literal_ShowValue3" runat="server"></asp:Literal>
					    </div>

				    </div>
				    <!-- /BOX -->
			    </div>
		    </div>
		    <!-- /BOXES -->
	    </div>
    </section>
    <!-- JAVASCRIPT FILES -->
	<script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
	<script type="text/javascript" src="assets/plugins/jquery/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="assets/js/app.js"></script>
</asp:Content>
