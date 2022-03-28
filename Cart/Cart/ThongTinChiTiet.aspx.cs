using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cart
{
    public partial class ThongTinChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["ID"].ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["FIND"] = txtSearch.Text;
            Response.Redirect("TimKiem.aspx");
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ID = Session["ID"].ToString();
            int soluong = Convert.ToInt32(txtSoLuong.Text);

            // Kết nối dữ liệu
            String url = Server.MapPath("App_Data/CART_IS385L.mdf");
            String strconn =
                @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = " + url + ";Integrated Security=True";
            
            // Sử dụng đối tượng kết nối SQL
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strconn;
            con.Open();
            if (Session["LOAI"].ToString() == "TiVi")
            {
                string sql_command_update =
                "INSERT TOP(1) INTO CART (MADONHANG,ANHSP,TENSP,SOLUONG,DONGIA,TONGTIEN)" +
                "SELECT Masp,HinhAnh,Tensp, " + soluong + ", Dongia, Dongia*" + soluong + "" +
                " FROM TiVi WHERE Masp=N'" + Session["ID"].ToString() + "';";

                SqlCommand lenhthem = new SqlCommand();
                lenhthem.Connection = con;
                lenhthem.CommandType = System.Data.CommandType.Text;
                lenhthem.CommandText = sql_command_update;
                lenhthem.ExecuteNonQuery();
            }
            else if (Session["LOAI"].ToString() == "LapTops")
            {
                string sql_command_update =
                "INSERT TOP(1) INTO CART (MADONHANG,ANHSP,TENSP,SOLUONG,DONGIA,TONGTIEN)" +
                "SELECT MASP,ANHSP,TENSP, " + soluong + ", DONGIA, DONGIA*" + soluong + "" +
                " FROM LapTops WHERE MASP=N'" + Session["ID"].ToString() + "';";

                SqlCommand lenhthem = new SqlCommand();
                lenhthem.Connection = con;
                lenhthem.CommandType = System.Data.CommandType.Text;
                lenhthem.CommandText = sql_command_update;
                lenhthem.ExecuteNonQuery();
            }
            else if (Session["LOAI"].ToString() == "DienThoai")
            {
                string sql_command_update =
                "INSERT TOP(1) INTO CART (MADONHANG,ANHSP,TENSP,SOLUONG,DONGIA,TONGTIEN)" +
                "SELECT Masp,HinhAnh,Tensp, " + soluong + ", Dongia, Dongia*" + soluong + "" +
                " FROM DienThoai WHERE Masp=N'" + Session["ID"].ToString() + "';";

                SqlCommand lenhthem = new SqlCommand();
                lenhthem.Connection = con;
                lenhthem.CommandType = System.Data.CommandType.Text;
                lenhthem.CommandText = sql_command_update;
                lenhthem.ExecuteNonQuery();
            }
        }
    }
}