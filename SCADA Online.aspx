<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="SCADA Online.aspx.cs" Inherits="MET_Station.SCADA_Online" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="middle">
        <div id="content" class="dashboard padding-20">					
		    <div id="panel-1" class="panel panel-default">
			    <div class="panel-heading">
				    <span class="title elipsis">
					    <strong>PHÒNG ĐIỀU KHIỂN GIÁM SÁT TRUNG TÂM</strong> <!-- panel title -->
					    <small class="size-14 weight-300 text-mutted hidden-xs">( Chỉ cho phép dưới quyền Administrator )</small>
				    </span>
					 <!-- right options -->
				    <ul class="options pull-right list-inline">
					    <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
					    <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Fullscreen"><i class="fa fa-expand"></i></a></li>
				    </ul>
				</div>
				    <!-- /right options -->
			    <div class="panel-body text-center">
				 <h3><strong>TRẠM QUAN TRẮC THỜI TIẾT</strong></h3>
				</div>
				 <div class="panel-footer">

				    <!-- 
					    .md-4 is used for a responsive purpose only on col-md-4 column.
					    remove .md-4 if you use on a larger column
				    -->
				    <ul class="easypiecharts list-unstyled">
					    <li class="clearfix" style="left: 0px; top: 0px">
						    <span class="stat-number" style="right: 23px; top: 9px; height: 25px">NHIỆT ĐỘ (ĐỘ C)</span>
						    <span class="stat-number" style="right: 79px; top: 34px; width: 65px">
                                <asp:TextBox ID="tbNhietdo" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-square" src="assets/images/Nhiet_do.png" width="80px" />
						    </span> 
					    </li>
					    <li class="clearfix">
						    <span class="stat-number" style="right: 65px; top: 10px">ĐỘ ẨM (%)</span>
						      <span class="stat-number" style="right: 79px; top: 34px; width: 65px">
                                <asp:TextBox ID="tbDoam" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-square" src="assets/images/Do_am.png" width="80px" /></span></li>
					    <li class="clearfix">
						    <span class="stat-number">TỐC ĐỘ GIÓ (M/S)</span>
						      <span class="stat-number" style="right: 79px; top: 34px; width: 65px">
                                <asp:TextBox ID="tbTocdogio" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-square" src="assets/images/Toc_do_gio.jpg" width="80px" />
						    </span> 
					    </li>
					    <li class="clearfix">
						    <span class="stat-number" style="right: 4px; top: 10px">LƯỢNG MƯA (MM)</span>
						     <span class="stat-number" style="right: 67px; top: 34px; width: 58px">
                                <asp:TextBox ID="tbLuongmua" runat="server" Width="70px" ReadOnly="True"></asp:TextBox></span>

						    <span data-barcolor="#F8CB00" data-trackcolor="#dddddd" data-scalecolor="#dddddd" data-size="60" data-linewidth="4" style="width: 60px; height: 60px;">
							    <img class="img-square" src="assets/images/Luong_mua.png" width="80px" />
						    </span> 
					    </li>
				    </ul>

			    </div>
			 </div>
		    &nbsp;
            <asp:Label ID="Label1" runat="server" EnableTheming="True" Text=" Nhập IP của PLC :"></asp:Label>
&nbsp;<asp:TextBox ID="tbConnect" runat="server" Width="124px"></asp:TextBox>
&nbsp;<asp:Label ID="Label4" runat="server" Text="Duty Cycle (ms) :"></asp:Label>
&nbsp;<asp:TextBox ID="tbCycle" runat="server" Width="51px"></asp:TextBox>
&nbsp;&nbsp; <asp:Button ID="Bt_Connect" runat="server" ForeColor="#0099FF" OnClick="bt_Connect_Click" Text="Kết nối" />
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="Trạng thái :"></asp:Label>
&nbsp;<asp:TextBox ID="tbStatus" runat="server" Width="125px"></asp:TextBox>
            &nbsp;
            <asp:Label ID="Label3" runat="server" Text=" Điều khiển :"></asp:Label>
&nbsp;
            <asp:Button ID="Bt_Start" runat="server" BackColor="Lime" OnClick="Bt_Start_Click" Text="START" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Bt_Stop" runat="server" BackColor="Red" ForeColor="Black" OnClick="Bt_Stop_Click" Text="STOP" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Bt_Reset" runat="server" BackColor="Yellow" OnClick="Bt_Reset_Click" Text="RESET" Width="68px" />
            <br />
&nbsp;
			<div class="panel-body text-center">
				    <span class="title elipsis">
					    <strong>BIỂU ĐỒ PHÂN TÍCH DỮ LIỆU THEO THỜI GIAN (CẬP NHẬT TỪ DATABASE 1 PHÚT/LẦN)</strong> <!-- panel title -->
				    </span>
				</div>	
			<asp:Chart ID="Chart1" runat="server" Height="452px" OnLoad="Chart1_Load" Width="535px">
                <Series>
                    <asp:Series ChartType="Line" Name="Nhietdo" ChartArea="ChartArea1" BorderColor="White" Color="Red" Font="Microsoft Sans Serif, 8pt" MarkerColor="White" XValueType="DateTime" YValuesPerPoint="2">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
		    <asp:Chart ID="Chart2" runat="server" Height="452px" OnLoad="Chart2_Load" Width="535px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" ChartType="Area" Name="Doam" Color="Aqua" XValueType="DateTime">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <br />
            <asp:Chart ID="Chart3" runat="server" Height="452px" OnLoad="Chart3_Load" Width="535px">
                <Series>
                    <asp:Series ChartType="Point" Name="Tocdogio" YValuesPerPoint="3" Color="Red" XValueType="DateTime">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:Timer ID="Timer1" runat="server">
            </asp:Timer>
		    <asp:Chart ID="Chart4" runat="server" Height="452px" Onload="Chart4_Load" Width="535px">
                <Series>
                    <asp:Series Name="Luongmua" XValueType="Date">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
		 </div>				   
    </section>
</asp:Content>
