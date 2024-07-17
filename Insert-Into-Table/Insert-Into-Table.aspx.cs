using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBlock;

namespace Insert_Into_Table
{
    public partial class Insert_Into_Table : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["myDbs"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "insert into Friends(userid,name) values('" + txtuserId.Text + "','" + txtuserName.Text + "')";
            int ds = SqlHelper.ExecuteNonQuery(con, CommandType.Text, sql);
        }
    }
}