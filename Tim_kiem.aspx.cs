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
    public partial class Tim_kiem : System.Web.UI.Page
    {
        SQL _sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
        }
        void Timkiemgiatricambien(string SensorID,
                              string starttime,
                              string endtime)
        {
            string html =
            "<table class='fooTableInit'>" +
                "<thead><tr>" +
                    "<th class='foo-cell'>ID</th>" +
                    "<th class='foo-cell'>Name</th>" +
                    "<th class='foo-cell'>Datetime</th>" +
                    "<th data-type='numeric' data-hide = 's300'> Value </th>" +
                "</tr></thead><tbody>";
            DataTable cb = _sql.SearchSensor(SensorID, starttime, endtime);
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                string macambien = cb.Rows[i]["ID"].ToString();
                string tencambien = cb.Rows[i]["Name"].ToString();
                DateTime thoigian = Convert.ToDateTime(cb.Rows[i]["Datetime"]);
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

            Literal_Timkiemgiatricambien.Text = html;
        }
        protected void btnXem_Click(object sender, EventArgs e)
        {
            string SensorID = tbxID.Text;
            string Starttime = tbxStarttime.Text;
            string Endtime = tbxEndtime.Text;
            Timkiemgiatricambien(SensorID, Starttime, Endtime);
        }
    }
}