using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using S7.Net;
using S7.Net.Types;
using MET_Station.App_Code;
using System.Configuration;

namespace MET_Station
{
    public partial class SCADA_Online : System.Web.UI.Page 
    {
        SQL _sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["UserRole"]) != 1)
            {
                Response.Redirect("/All.aspx");
            }
            Plc _Plc = new Plc(CpuType.S71200, tbConnect.Text, 0, 0);
            if (_Plc.Open() == ErrorCode.NoError)
            { //Xu li du lieu kieu real nhan tu PLC sang C# thanh dau cham dong(float)bang phan tach 4 byte bo nho roi ep kieu
                byte[] temp = new byte[4];
                string temp1 = _Plc.Read("MB10").ToString();
                temp[3] = byte.Parse(temp1);
                string temp2 = _Plc.Read("MB11").ToString();
                temp[2] = byte.Parse(temp2);
                string temp3 = _Plc.Read("MB12").ToString();
                temp[1] = byte.Parse(temp3);
                string temp4 = _Plc.Read("MB13").ToString();
                temp[0] = byte.Parse(temp4);
                float t = BitConverter.ToSingle(temp, 0);

                tbNhietdo.Text = t.ToString("f");//Xong phan nhiet do
                // vi minh muon xem tung byte du lieu nhan ve nhu the nao va thu tu cua chung, doan code nay co the duoc thay bang cau lenh sau
                //double value = ((uint)plc.Read("vungnho")).ConvertToDouble();


                byte[] humid = new byte[4];
                string humid1 = _Plc.Read("MB14").ToString();
                humid[3] = byte.Parse(humid1);
                string humid2 = _Plc.Read("MB15").ToString();
                humid[2] = byte.Parse(humid2);
                string humid3 = _Plc.Read("MB16").ToString();
                humid[1] = byte.Parse(humid3);
                string humid4 = _Plc.Read("MB17").ToString();
                humid[0] = byte.Parse(humid4);
                float h = BitConverter.ToSingle(humid, 0);
                tbDoam.Text = h.ToString();//Xong phan do am

                byte[] speed = new byte[4];
                string speed1 = _Plc.Read("MB18").ToString();
                speed[3] = byte.Parse(speed1);
                string speed2 = _Plc.Read("MB19").ToString();
                speed[2] = byte.Parse(speed2);
                string speed3 = _Plc.Read("MB20").ToString();
                speed[1] = byte.Parse(speed3);
                string speed4 = _Plc.Read("MB21").ToString();
                speed[0] = byte.Parse(speed4);
                float s = BitConverter.ToSingle(speed, 0);
                tbTocdogio.Text = s.ToString();//Xong phan toc do gio

                byte[] rain = new byte[4];
                string rain1 = _Plc.Read("MB22").ToString();
                rain[3] = byte.Parse(rain1);
                string rain2 = _Plc.Read("MB23").ToString();
                rain[2] = byte.Parse(rain2);
                string rain3 = _Plc.Read("MB24").ToString();
                rain[1] = byte.Parse(rain3);
                string rain4 = _Plc.Read("MB25").ToString();
                rain[0] = byte.Parse(rain4);
                float r = BitConverter.ToSingle(rain, 0);
                tbLuongmua.Text = r.ToString();//Xong phan luong mua
            
                _Plc.Close();
            }
            else
            {
                tbStatus.Text = "Kết nối thất bại";
            }

        }
        protected void bt_Connect_Click(object sender, EventArgs e)
        {
            int time = int.Parse(tbCycle.Text);// Ep kieu sang int
            Timer1.Interval = time;
            Timer1.Enabled = true;
            Plc _Plc = new Plc(CpuType.S71200, tbConnect.Text, 0, 0);
            if (_Plc.Open() == ErrorCode.NoError)
            {
                tbStatus.Text = "Kết nối thành công";
            }
            else
            {
                tbStatus.Text = "Kết nối thất bại";
            }
        }

        protected void Bt_Start_Click(object sender, EventArgs e)
        {
            Plc _Plc = new Plc(CpuType.S71200,tbConnect.Text, 0, 0);
            if (_Plc.Open() == ErrorCode.NoError)
            {
                _Plc.Write("M2.0", 1);
                _Plc.Close();
            }
            else
            {
                tbStatus.Text = "Kết nối thất bại";
            }
        }
        protected void Bt_Stop_Click(object sender, EventArgs e)
        {
            Plc _Plc = new Plc(CpuType.S71200, tbConnect.Text, 0, 0);
            if (_Plc.Open() == ErrorCode.NoError)
            {
                _Plc.Write("M2.1", 1);
                _Plc.Write("M2.1", 0);
                _Plc.Close();
            }
            else
            {
                tbStatus.Text = "Kết nối thất bại";
            }
        }
        protected void Bt_Reset_Click(object sender, EventArgs e)
        {
            Plc _Plc = new Plc(CpuType.S71200, tbConnect.Text, 0, 0);
            if (_Plc.Open() == ErrorCode.NoError)
            {
                _Plc.Write("M2.2", 1);
                _Plc.Write("M2.2", 0);
                _Plc.Close();
            }
            else
            {
                tbStatus.Text = "Kết nối thất bại";
            }
        }
        protected void Chart1_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            DataTable cb = _sql.GetSensor("CB 001");// Sử dụng hàm GetSensor ở SQL.cs
            Chart1.ChartAreas["ChartArea1"].AxisX.Title = "Thời gian";//Đặt tên trục hoành là thời gian
            Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Nhiệt độ (Độ C)";//Đặt tên trục tung là nhiệt độ
            for (int i = 0; i < cb.Rows.Count; i++)
            { 
                Chart1.Series["Nhietdo"].Points.AddXY(cb.Rows[i]["DateTime"], cb.Rows[i]["Value"]);//Vẽ biểu đồ đơn giản,sau sẽ vẽ nhiều option hơn
            }
        }
        protected void Chart2_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            DataTable cb = _sql.GetSensor("CB 002");
            Chart2.ChartAreas["ChartArea1"].AxisX.Title = "Thời gian";
            Chart2.ChartAreas["ChartArea1"].AxisY.Title = "Độ ẩm (%)";
            for (int i = 0; i < cb.Rows.Count; i++)
            {             
                Chart2.Series["Doam"].Points.AddXY(cb.Rows[i]["DateTime"], cb.Rows[i]["Value"]);
            }
        }
        protected void Chart3_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            DataTable cb = _sql.GetSensor("CB 003");
            Chart3.ChartAreas["ChartArea1"].AxisX.Title = "Thời gian";
            Chart3.ChartAreas["ChartArea1"].AxisY.Title = "Tốc độ gió (m/s)";
            for (int i = 0; i < cb.Rows.Count; i++)
            {             
                Chart3.Series["Tocdogio"].Points.AddXY(cb.Rows[i]["DateTime"], cb.Rows[i]["Value"]);
            }
        }
        protected void Chart4_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            _sql = new SQL(connectionString);
            DataTable cb = _sql.GetSensor("CB 004");
            Chart4.ChartAreas["ChartArea1"].AxisX.Title = "Thời gian";
            Chart4.ChartAreas["ChartArea1"].AxisY.Title = "Lượng mưa (mm)";
            for (int i = 0; i < cb.Rows.Count; i++)
            {
                Chart4.Series["Luongmua"].Points.AddXY(cb.Rows[i]["Datetime"], cb.Rows[i]["Value"]);
            }
        }
    }
}
