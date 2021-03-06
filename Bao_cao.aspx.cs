using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using MET_Station.App_Code;
using Microsoft.Reporting.WebForms;
using MySql.Data.MySqlClient;

namespace MET_Station
{
    public partial class Bao_cao : System.Web.UI.Page
    {
        SQL _sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            if (Convert.ToInt32(Session["UserRole"]) != 1)
            {
                Response.Redirect("/All.aspx");
            }
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            string SensorID = tbxID.Text;
            string Starttime = tbxStarttime.Text;
            string Endtime = tbxEndtime.Text;
            tbxStarttime1.Text = null;
            tbxEndtime1.Text = null;
            TimkiemgiatricambientheoID(SensorID, Starttime, Endtime);
        }
        void TimkiemgiatricambientheoID(string SensorID, string starttime, string endtime)
        {
            DataTable cb = _sql.SearchSensor(SensorID, starttime, endtime);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Myreport.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", cb));
            ReportViewer1.LocalReport.Refresh();
        }

        protected void btnXem1_Click(object sender, EventArgs e)
        {
            string Starttime = tbxStarttime1.Text;
            string Endtime = tbxEndtime1.Text;
            tbxStarttime.Text = null;
            tbxEndtime.Text = null;
            Timkiemgiatricambientheongay(Starttime, Endtime);
        }
        void Timkiemgiatricambientheongay(string starttime, string endtime)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
            MySqlDataAdapter da = new MySqlDataAdapter($"select * from Data where DateTime between '{starttime}' and '{endtime}'", con);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Myreport.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}