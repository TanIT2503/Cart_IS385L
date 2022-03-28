using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;

namespace Cart
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            //ket noi dl
            String url = Server.MapPath("App_Data/CART_IS385L.mdf");
            String strconn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + url + ";Integrated Security = True";
            /*
            string path = Server.MapPath("App_Data/CART_IS385L.mdf");
            SqlConnection connect = new SqlConnection();
            connect.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename = " + path + ";Integrated Security=True ";
            connect.Open();*/

            // Sử dụng đối tượng kết nối SQL
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strconn;
            con.Open();
            //SQLcommand
            string sql_command = "select * from ACCOUNTS where EMAIL=N'" + txtEmail.Text + "'";
            SqlCommand lenhxem = new SqlCommand();
            lenhxem.Connection = con;
            lenhxem.CommandType = System.Data.CommandType.Text;
            lenhxem.CommandText = sql_command;
            var dong = lenhxem.ExecuteReader();
            if (dong.HasRows)
            {
                lbNotify.Text = "Username available";
            }
            else
            {
                if (CheckBox1.Checked)
                {
                    dong.Close();
                    string sql_command_update = 
                        "INSERT INTO ACCOUNTS (EMAIL,PASSWORD,FULLNAME,BIRTHDAY,GENDER,ADDRESS,PHONENUMBER) VALUES(N'" +
                        txtEmail.Text + "',N'" + txtPassword.Text + "',N'" + txtFullName.Text + "',N'" + txtBirthday.Text + "',N'"
                        + txtGender.Text + "',N'" + txtAddress.Text + "',N'" + txtNumberPhone.Text + "')";
                    SqlCommand lenhthem = new SqlCommand();
                    lenhthem.Connection = con;
                    lenhthem.CommandType = System.Data.CommandType.Text;
                    lenhthem.CommandText = sql_command_update;
                    lenhthem.ExecuteNonQuery();
                    lbNotify.Text = "Đăng kí thành công";
                    
                    Response.Redirect("Login.aspx");
                    Thread.Sleep(30000);
                }
                lbNotify.Text = "Chưa đồng ý các điều khoản";
            }
        }
    }
}