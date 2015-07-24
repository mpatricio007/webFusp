using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using System.Security.Authentication;
using System.Text;

namespace WebFusp.LIB
{   
    public class BasePage : System.Web.UI.Page
    {
        private bool? seguranca;

        protected bool? Seguranca
        {
            get
            {
                if (!seguranca.HasValue)
                    seguranca = true;
                return seguranca;
            }
            set { seguranca = value; }
        }    


        protected virtual void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (!SecurityBLL.GetPermission(this.ToString()))
                //{
                //    Response.Redirect("~/Login.aspx");
                //}


            }
        }
    }
}