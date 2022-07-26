using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MET_Station
{
    public partial class Page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("/Log_in.aspx");
            }
            else
            {
                Literal_UserName.Text = Session["UserName"].ToString();
                if (Convert.ToInt32(Session["UserRole"]) == 1)
                {
                    Literal_AdminMenu.Text = @"<li class='el_primary' id='el_3'>
                            <a href='SCADA Online.aspx'>
                                <i class='main-icon fa fa-dashboard'></i><span>Online SCADA</span>
                            </a>
                        </li>
                        <li class='el_primary' id='el_4'>
                            <a href='Bao_cao.aspx'>
                                <i class='main-icon fa fa-list'></i> <span>Truy Xuất Báo Cáo</span>
                            </a>
                        </li>";
                }
                else {
                    Literal_AdminMenu.Text = "";
                }
                if (Session["UserAvatar"] == null || string.IsNullOrEmpty(Session["UserAvatar"].ToString()))
                {
                    Literal_Avatar.Text = "<img class='user-avatar' alt='Avatar' src='assets/images/avatars/noavatar.jpg' height='34'>";
                }
                else
                {
                    Literal_Avatar.Text = $"<img class='user-avatar' alt='Avatar' src='assets/images/avatars/{Session["UserAvatar"]}' height='34'>";
                }
            }
        }
    }
}