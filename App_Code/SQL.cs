using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace MET_Station.App_Code
{
    public class SQL
    {
        public string connectionString;
        public SQL(string connectionString)
        {
            //
            // TODO: Add constructor logic here
            //
            this.connectionString = connectionString;
        }
        /// <summary>
        /// Lấy toàn bộ dữ liệu trong table da tao của CSDL Sql Server.
        /// </summary>
        /// <returns></returns>
        public DataTable GetSensor(string SensorID)
        {
            string strSQL;
            if (SensorID == "*")
            {
                strSQL = "select * from Data;";
            }
            else
            {
                strSQL = "select * from Data where Code = N'" + SensorID + "';";
            }
            return GetData(strSQL, connectionString);
        }
        public DataTable GetSensorLatest(string SensorID)
        {
            string strSQL = "select * from Data where Code = N'" + SensorID + "' order by DateTime desc limit 5;";
            return GetData(strSQL, connectionString);
        }
        public DataTable SearchSensor(string SensorID, string starttime, string endtime)
        {
            string strSQL = $"select * from Data where Code = N'" + SensorID + "' " +
                            $"and DateTime between '{starttime}' and '{endtime}'";

            return GetData(strSQL, connectionString);
        }

        public System.Data.DataTable GetData(string selectCommand, string connectionString)
        {
            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(selectCommand, connectionString);
                MySqlCommandBuilder commandBuilder = new MySqlCommandBuilder(dataAdapter);
                System.Data.DataTable table = new System.Data.DataTable();
                table.Locale = System.Globalization.CultureInfo.InstalledUICulture;
                dataAdapter.Fill(table);
                return table;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}