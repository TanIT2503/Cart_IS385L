using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Threading;

namespace Cart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Kết nối dữ liệu 
            string path = Server.MapPath("App_Data/CART_IS385L.mdf");
            SqlConnection connect = new SqlConnection();
            connect.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True ";
            connect.Open();

            //Khai thác dữ liệu
            SqlCommand chon1 = new SqlCommand();
            chon1.Connection = connect;
            chon1.CommandType = System.Data.CommandType.Text;
            chon1.CommandText = "SELECT * from ACCOUNTS where EMAIL=N'" + txtEmail.Text + "'";
            var user = chon1.ExecuteReader();
            if (user.HasRows)
            {
                user.Close();
                //Khai thác dữ liệu
                SqlCommand chon2 = new SqlCommand();
                chon2.Connection = connect;
                chon2.CommandType = System.Data.CommandType.Text;
                chon2.CommandText = "SELECT * from ACCOUNTS where PASSWORD=N'" + txtPassword.Text + "'";
                var matkhau = chon2.ExecuteReader();
                if (matkhau.HasRows)
                {
                    matkhau.Close();
                    var test = chon1.ExecuteReader();
                    string sess = "";
                    string mail = "";
                    if (test.HasRows)
                    {
                        user.Close(); test.Close();
                        // Tạo đối tượng SqlCommand
                        SqlCommand command = new SqlCommand();
                        command.Connection = connect;

                        // Câu truy vấn lấy danh mục
                        string queryString = @"SELECT * FROM ACCOUNTS WHERE EMAIL =N'" + txtEmail.Text + "'";
                        command.CommandText = queryString;

                        // Thi hành truy vấn trả về SqlReader
                        SqlDataReader reader = command.ExecuteReader();

                        // Kiểm tra có kết quả trả về
                        if (reader.HasRows)
                        {
                            // Đọc từng dòng tập kết quả
                            while (reader.Read())
                            {
                                string mota = reader.GetString(2);
                                string em = reader.GetString(0);
                                sess = mota;
                                mail = em;
                            }
                        }
                        reader.Close();
                    }
                    Session["FULLNAME"] = sess;
                    Session["EMAIL"] = mail;
                    Response.Redirect("Home.aspx");
                    Thread.Sleep(3000);
                }
                else
                {
                    matkhau.Close();
                }
            }
            else
            {
                user.Close();
            }
        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

    }
}