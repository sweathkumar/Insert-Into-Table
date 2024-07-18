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
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "insert into DataEntry(userid,name,date) values('" + txtuserId.Text + "','" + txtuserName.Text + "',getdate())";
            int ds = SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);
            txtuserId.Text = "";
            txtuserName.Text = "";
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            grid1.Visible = true;
            string sql = "select * from DataEntry";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            btnClear.Visible = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtuserId.Text = "";
            txtuserName.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            string sql = "TRUNCATE TABLE DataEntry";
            int rowsAffected = SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Table DataEntry cleared successfully.');", true);
            grid1.Visible = false;
            btnClear.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string sql = "Delete from dataenrty where userid = ";

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Table DataEntry cleared successfully.');", true);
        }

        protected void grid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                                
            }
        }

        protected void grid1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}