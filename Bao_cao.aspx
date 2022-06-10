<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Bao_cao.aspx.cs" Inherits="MET_Station.Bao_cao" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="middle">
        <div id="content" class="dashboard padding-20">					
		    <div id="panel-1" class="panel panel-default">
			    <div class="panel-heading">
				    <span class="title elipsis">
					    <strong>PHÒNG TRUY XUẤT BÁO CÁO</strong> <!-- panel title -->
					    <small class="size-14 weight-300 text-mutted hidden-xs">( Chỉ cho phép dưới quyền Administrator )</small>
				    </span>
					 <!-- right options -->
				    <ul class="options pull-right list-inline" style="left: 0px; top: -12px; height: 37px">
					    <li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Colapse"></a></li>
					    <li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="Fullscreen"><i class="fa fa-expand"></i></a></li>
				    </ul>
				</div>
				    <!-- /right options -->
			    <div class="panel-body text-center">
				 <h3><strong>TRẠM QUAN TRẮC THỜI TIẾT QUA MODULE 4G SIEMENS</strong></h3>
					<h4><strong>XUẤT BÁO CÁO CẢM BIẾN </strong></h4>
					    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="ID: "></asp:Label> <asp:TextBox ID="tbxID" runat="server" placeholder="CB 001" Width="89px"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text=" Thời gian bắt đầu: "></asp:Label><asp:TextBox ID="tbxStarttime" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text=" Thời gian kết thúc: "></asp:Label> <asp:TextBox ID="tbxEndtime" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                        <asp:Button  ID="btnXem" runat="server" backcolor="#00ff00" Font-Size="18px" Text="Xuất bản xem trước" OnClick="btnXem_Click" />
					<h4><strong>XUẤT BÁO CÁO THEO NGÀY</strong></h4>
                        <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text=" Thời gian bắt đầu: "></asp:Label><asp:TextBox ID="tbxStarttime1" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                        <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text=" Thời gian kết thúc: "></asp:Label> <asp:TextBox ID="tbxEndtime1" runat="server" placeholder="dd/mm/yyyy hh:mm:ss"></asp:TextBox>
                         <asp:Button  ID="BtnXem1" runat="server" backcolor="#00ff00" Font-Size="18px" Text="Xuất bản xem trước" OnClick="btnXem1_Click" />
					<h4><strong>BẢN XEM TRƯỚC</strong></h4>
					<rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" BorderColor="Black" BorderStyle="Double" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" PromptAreaCollapsed="True" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SizeToReportContent="True" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                    </rsweb:ReportViewer>
				</div>
			</div>	
		</div>	
    </section>
</asp:Content>
