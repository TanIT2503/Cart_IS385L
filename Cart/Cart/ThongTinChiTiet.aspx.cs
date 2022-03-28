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
            
            int soluong = Convert.ToInt32(txtSoLuong.Text);

            // Kết nối dữ liệu
            String url = Server.MapPath("App_Data/CART_IS385L.mdf");
            String strconn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + url + "; Integrated Security=True";

            // Sử dụng đối tượng kết nối SQL
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strconn;
            con.Open();

            // phân loai san pham dua vao table
            if (Session["LOAI"].ToString() == "TiVi")
            {
                string madon = "SELECT Masp FROM TiVi WHERE Masp = N'"+ Session["ID"].ToString()+ "'";
                string sql_command_update =
                "INSERT TOP(1) INTO CART (ANHSP,TENSP,SOLUONG,DONGIA,TONGTIEN)" +
               "SELECT HinhAnh, Tensp, " + soluong + ", Dongia, Dongia*" + soluong + "" +
               " FROM TiVi WHERE Masp=" + Session["ID"].ToString() + ";";//lệnh thêm thông tin vào bảng tempo_cart

                SqlCommand lenhthem = new SqlCommand();
                lenhthem.Connection = con;
                lenhthem.CommandType = System.Data.CommandType.Text;
                lenhthem.CommandText = sql_command_update;
                lenhthem.ExecuteNonQuery();
            }
        }
    }
}