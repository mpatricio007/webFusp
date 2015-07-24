using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using WebFusp.DAL;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormsAuthentication.SignOut();             
                Session.Remove("id_inscricao_pregao");
                

                this.cCNPJ2.Focus();
                this.cCPF.Focus();
                InscricaoPregaoBLL u = new InscricaoPregaoBLL();

                ddlTipo.Items.AddRange(Enum.GetValues(typeof(TipoInscricao)).OfType<TipoInscricao>().Select(it => new ListItem(TipoInscricaoBLL.ToString(it), Util.InteiroToString((int)it))).ToArray());
                ddlTipo.DataBind();
            }
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tipo = (TipoInscricao)Enum.Parse(typeof(TipoInscricao), ddlTipo.SelectedValue);
            divPessoaJuridica.Visible = tipo == TipoInscricao.Pessoa_Juridica;
            divPessoaJuridica.DataBind();
            divPessoaFisica.Visible = !divPessoaJuridica.Visible;
            divPessoaFisica.DataBind();
        }

        protected void btEntrar_Click(object sender, EventArgs e)
        {
            string saida = String.Empty;
            string url = String.Empty;
            Session["id_inscricao_pregao"] = SecurityBLL.Login(this.cCNPJ2.Value.Value, this.cCPF.Value.Value, this.txtSenha.Text, out saida, out url, (TipoInscricao)Enum.Parse(typeof(TipoInscricao), ddlTipo.SelectedValue));
            Session.Timeout = 60;
            this.lbMsg.Text = saida;

            if ((int)Session["id_inscricao_pregao"] != 0)
            {
                var usu = SecurityBLL.GetCurrentUsuario();
                FormsAuthentication.RedirectFromLoginPage(usu.tipo == TipoInscricao.Pessoa_Fisica ? usu.nome : usu.nome_fantasia, false);
                if (usu.primeiro_acesso)
                    Response.Redirect("AlterarSenha.aspx");
                else
                    Response.Redirect(url);
            }
        }

    }
}