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
    public partial class All : System.Web.UI.Page
    {
        SQL _sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            Literal_ShowValue1.Text = ShowValueSensor("CB 001");
            Literal_ShowValue2.Text = ShowValueSensor("CB 002");
            Literal_ShowValue3.Text = ShowValueSensor("CB 003");
        }
        string ShowValueSensor(string SensorID)
        {
            string html =
            "<table class='table table-bordered table - vertical - middle nomargin'>" +
                "<thead>" +
                    "<tr>" +
                        "<th class='width-30'>ID</th>" +
                        "<th>Value</th>" +
                        "<th>Datetime</th>" +
                    "</tr>" +
                "</thead><tbody>";

            DataTable cb = _sql.GetSensorLatest(SensorID);
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                string macambien = cb.Rows[i]["ID"].ToString();
                double giatri = Convert.ToDouble(cb.Rows[i]["Value"]);
                DateTime thoigian = Convert.ToDateTime(cb.Rows[i]["DateTime"]);
                html +=
                    "<tr>" +
                        "<td>" + macambien + "</td>" +
                        "<td>" + giatri.ToString() + "</td>" +
                        "<td>" + thoigian.ToString() + "</td>" +
                    "</tr>";
            }
            html += "</tbody></table>";
            return html;

        }
    }
}