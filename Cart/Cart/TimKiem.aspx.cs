using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cart
{
    public partial class TimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["FIND"].ToString();
        }
        protected void TimKiemDienThoai(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "redirect")
            {
                Label2.Text = DataList1.DataKeys[e.Item.ItemIndex].ToString();
                Session["ID"] = Label2.Text;
                Session["LOAI"] = "DienThoai";
                Response.Redirect("ThongTinChiTiet.aspx");
            }
        }
        protected void TimKiemLapTops(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "redirect")
            {
                Label2.Text = DataList2.DataKeys[e.Item.ItemIndex].ToString();
                Session["ID"] = Label2.Text;
                Session["LOAI"] = "LapTops";
                Response.Redirect("ThongTinChiTiet.aspx");
            }
        }
        protected void TimKiemTiVi(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "redirect")
            {
                Label2.Text = DataList3.DataKeys[e.Item.ItemIndex].ToString();
                Session["ID"] = Label2.Text;
                Session["LOAI"] = "TiVi";
                Response.Redirect("ThongTinChiTiet.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["FIND"] = txtSearch.Text;
            Response.Redirect("TimKiem.aspx");
        }
    }
}