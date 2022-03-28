using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cart
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void del_pro(object source, DataListCommandEventArgs e)//ham xoa dư lieu khoi bang
        {
            if (e.CommandName == "Delete_command")
            {

                string ID_delete = DataList2.DataKeys[e.Item.ItemIndex].ToString();
                // Kết nối dữ liệu
                String url = Server.MapPath("App_Data/CART_IS385L.mdf");
                String strconn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + url + ";Integrated Security=True";
                //C:\Users\LENOVO\Documents\WebApplicationProjects\Doannhom\Cart_IS385L\Cart\Cart\;Integrated Security=True

                // Sử dụng đối tượng kết nối SQL
                SqlConnection con = new SqlConnection();
                con.ConnectionString = strconn;
                con.Open();

                string sql_command_delete =
                    "DELETE FROM CART WHERE MADONHANG=N'" + ID_delete + "';";
                SqlCommand lenhthem = new SqlCommand();
                lenhthem.Connection = con;
                lenhthem.CommandType = System.Data.CommandType.Text;
                lenhthem.CommandText = sql_command_delete;
                lenhthem.ExecuteNonQuery();
                Response.Redirect("GioHang.aspx");
            }
        }
        protected void DataList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}