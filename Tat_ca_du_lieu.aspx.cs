using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MET_Station.App_Code;
using System.Data;

namespace MET_Station
{
    public partial class Tat_ca_du_lieu : System.Web.UI.Page
    {
        SQL _sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            Hienthigiatricambien();
        }
        void Hienthigiatricambien()
        {
            string html =
            "<table class='fooTableInit'>" +
                "<thead><tr>" +
                    "<th class='foo-cell'>Mã</th>" +
                    "<th class='foo-cell'>Tên phân loại</th>" +
                    "<th class='foo-cell'>Ngày thực hiện</th>" +
                    "<th data-type='numeric' data-hide = 's300'> Kết quả </th>" +
                "</tr></thead><tbody>";

            DataTable cb = _sql.GetSensor("*");
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                string macambien = cb.Rows[i]["Code"].ToString();
                string tencambien = cb.Rows[i]["Name"].ToString();
                DateTime thoigian = Convert.ToDateTime(cb.Rows[i]["DateTime"]);
                double giatri = Convert.ToDouble(cb.Rows[i]["Value"]);

                html +=
                    "<tr>" +
                        "<td>" + macambien + "</td>" +
                        "<td>" + tencambien + "</td>" +
                        "<td>" + thoigian.ToString() + "</td>" +
                        "<td>" + giatri.ToString() + "</td>" +
                    "</tr>";
            }

            html += "</tbody></table>";

            Literal_Hienthigiatricambien.Text = html;
        }
    }
}