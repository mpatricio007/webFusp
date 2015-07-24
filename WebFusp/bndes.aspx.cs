using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;

namespace WebFusp
{
    public partial class bndes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var bBLL = new Site_bndesBLL();
                dContent.InnerHtml = bBLL.HtmlPaginaBndes();
                dContent.DataBind();

         
            }
        }
    }
}