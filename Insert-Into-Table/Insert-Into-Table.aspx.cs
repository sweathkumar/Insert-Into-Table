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
        //DateTime dateTimeNow = DateTime.Now;
        //string date = DateTime.Now.ToShortDateString();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string useridToCheck = txtuserId.Text.Trim();
            DataSet ds = new DataSet();
            string check = "select userid from dataentry where userid = " + txtuserId.Text + "";
            ds = SqlHelper.ExecuteDataset(con, CommandType.Text, check, new SqlParameter("@userid", useridToCheck));
            if (ds.Tables[0].Rows.Count > 0)
            {
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record inserted successfully!');", true);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Entered User id " + txtuserId.Text + " is alread Exists!');", true);

            }
            //SqlCommand checkCommand = new SqlCommand(check, con);

            //ds.AddWithValue("userid", txtuserId.Text);


            //if (existingCount > 0)
            //{
            //    // User ID already exists, show alert
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Entered User id " + txtuserId.Text + " already exists!');", true);
            //}
            //DataTable dt = new DataTable(da);

            //if (rowCount > 0)
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Entered User id " + txtuserId.Text + " is alread Exists!');", true);
            //}
            //TextBox txtUserId =grid1.FooterRow.FindControl("userid") as TextBox;
            else { 
            string sql1 = "insert into DataEntry(userid,name,date) values('" + txtuserId.Text + "','" + txtuserName.Text + "',getdate())";
            int ds1 = SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql1);
            txtuserId.Text = "";
            txtuserName.Text = "";
            getData();
            }
        }

        protected void getData()
        {
            string sql = "select * from DataEntry";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grid1.DataSource = dt;
            grid1.DataBind();
            btnClear.Visible = true;
            grid1.Visible = true;
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            getData();
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

        protected void grid1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string userid = (grid1.Rows[e.RowIndex].FindControl("lbluserId") as Label).Text;
            string sql = "Delete from dataentry where userid = '" + userid + "'";
            SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Table row deleted successfully.');", true);
            getData();
        }

        protected void grid1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grid1.EditIndex = e.NewEditIndex;
            getData();
        }

        protected void grid1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string userid = (grid1.Rows[e.RowIndex].FindControl("txtuserid") as TextBox).Text;
            string username = (grid1.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string sql = "UPDATE DataEntry SET userid = '" + userid + "', name = '" + username + "' WHERE userid = '" + userid + "'";
            SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Updated Sucessfully!');", true);
            getData();
        }

        protected void grid1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            getData();
        }
    }
}