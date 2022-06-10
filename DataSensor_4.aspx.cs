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
    public partial class DataSensor_4 : System.Web.UI.Page
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
                    "<th width='50%' class='foo-cell'>Datetime</th>" +
                    "<th data-type='numeric' data-hide = 's300'> Value </th>" +
                "</tr></thead><tbody>";

            DataTable cb = _sql.GetSensor("CB 004");
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                DateTime thoigian = Convert.ToDateTime(cb.Rows[i]["Datetime"]);
                double giatri = Convert.ToDouble(cb.Rows[i]["Value"]);

                html +=
                    "<tr>" +
                        "<td>" + thoigian.ToString() + "</td>" +
                        "<td>" + giatri.ToString() + "</td>" +
                    "</tr>";
            }

            html += "</tbody></table>";

            Literal_Hienthigiatricambien4.Text = html;
        }
    }
}
