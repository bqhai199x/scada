using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MET_Station
{
    public partial class Log_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }
        public static string ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        protected void btdangnhap_Click(object sender, EventArgs e)
        {
            if (txttaikhoan.Text != null && txttaikhoan.Text.Trim() != "") { }
            else
            {
                Response.Write("<script>alert('Vui lòng nhập tài khoản')</script>");
                txttaikhoan.Focus();
                return;
            }
            if (txtmatkhau.Text != null && txtmatkhau.Text.Trim() != "") { }
            else
            {
                Response.Write("<script>alert('Vui lòng nhập mật khẩu')</script>");
                txtmatkhau.Focus();
                return;
            }
            MySqlConnection con = new MySqlConnection(ConnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string Taikhoan = txttaikhoan.Text.Trim();
            string Matkhau = txtmatkhau.Text.Trim();
            string query = "Select * from Login Where Tai_khoan = '" + Taikhoan + "' and Mat_khau= '" + Matkhau + "'";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>alert('Đăng nhập thành công')</script>");
                Session["UserName"] = ds.Tables[0].Rows[0]["Ho_ten"];
                Session["UserRole"] = ds.Tables[0].Rows[0]["Vai_tro"];
                Session["UserAvatar"] = ds.Tables[0].Rows[0]["Anh"];
                Response.Redirect("~/All.aspx");
            }
            else
            {
                Response.Write("<script>alert('Thông tin tài khoản hoặc mật khẩu không chính xác')</script>");
                txtmatkhau.Focus();
                return;
            }
        }
    }
}