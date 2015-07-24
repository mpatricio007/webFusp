using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.DAL;
using WebFusp.LIB;
using WebFusp.BLL;

namespace WebFusp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // dlDestaques.DataBind();
                Site_pag_inicialBLL spi = new Site_pag_inicialBLL();
                divDestaques.InnerHtml = spi.GetAllDestaques();

            }
        }

        protected void dlDestaques_DataBinding(object sender, EventArgs e)
        {
            //Site_pag_inicialBLL spi = new Site_pag_inicialBLL();
            //dlDestaques.DataSource = spi.GetAll();
        }
    }
}