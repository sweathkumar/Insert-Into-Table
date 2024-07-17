using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBlock;
using System.Data.SqlClient;

namespace Insert_Into_Table
{
    public partial class Insert_Into_Table : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["myDbs"].ToString();
        DateTime dateTimeNow = DateTime.Now;
        string date = DateTime.Now.ToShortDateString();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "insert into DataEntry(userid,name,date) values('" + txtuserId.Text + "','" + txtuserName.Text + "','" + date + "')";
            int ds = SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string sql = "select * from DataEntry";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtuserId.Text = "";
            txtuserName.Text = "";
        }
    }
}