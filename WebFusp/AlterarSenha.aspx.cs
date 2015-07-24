using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;

namespace WebFusp
{
    public partial class AlterarSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SecurityBLL.GetCurrentUsuario().id_inscricao_pregao == 0)
                    FormsAuthentication.RedirectToLoginPage();

            }
        }

        protected void btAlterarSenha_Click(object sender, EventArgs e)
        {
            var inscBLL = new InscricaoPregaoBLL();
            this.lbLog.Text = SecurityBLL.AlterarSenha(this.txtSenha.Text, this.txtNewSenha.Text);
        }
    }
}