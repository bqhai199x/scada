using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MET_Station.App_Code;

namespace MET_Station
{
    public partial class Nhiet_do : System.Web.UI.Page
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
                    "<th width='50%' class='foo-cell'>Ngày thực hiện</th>" +
                    "<th data-type='numeric' data-hide = 's300'> Kết quả </th>" +
                "</tr></thead><tbody>";

            DataTable cb = _sql.GetSensor("CB 001");
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                DateTime thoigian = Convert.ToDateTime(cb.Rows[i]["DateTime"]);
                double giatri = Convert.ToDouble(cb.Rows[i]["Value"]);

                html +=
                    "<tr>" +
                        "<td>" + thoigian.ToString() + "</td>" +
                        "<td>" + giatri.ToString() + "</td>" +
                    "</tr>";
            }

            html += "</tbody></table>";

            Literal_Hienthigiatricambien1.Text = html;
        }
    }
}