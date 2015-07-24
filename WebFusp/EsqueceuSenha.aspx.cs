using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using WebFusp.DAL;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class EsqueceuSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipo.Items.AddRange(Enum.GetValues(typeof(TipoInscricao)).OfType<TipoInscricao>().Select(it => new ListItem(TipoInscricaoBLL.ToString(it), Util.InteiroToString((int)it))).ToArray());
                ddlTipo.DataBind();
            }
        }

        protected void btSendSenhaCNPJ_Click(object sender, EventArgs e)
        {
            var inscCNPJBLL = new InscricaoPregaoBLL();
            inscCNPJBLL.GetUsuarioPorCnpj(cCNPJ.Value.Value);
            this.lbLogCNPJ.Text = SecurityBLL.SendPasswordEmail(inscCNPJBLL.ObjEF);
        }

        protected void btSendSenhaCPF_Click(object sender, EventArgs e)
        {
            var inscCPFBLL = new InscricaoPregaoBLL();
            inscCPFBLL.GetUsuarioPorCpf(cCPF1.Value.Value);
            this.lbLogCPF.Text = SecurityBLL.SendPasswordEmail(inscCPFBLL.ObjEF);
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tipo = (TipoInscricao)Enum.Parse(typeof(TipoInscricao), ddlTipo.SelectedValue);
            divPessoaJuridica.Visible = tipo == TipoInscricao.Pessoa_Juridica;
            divPessoaJuridica.DataBind();
            divPessoaFisica.Visible = !divPessoaJuridica.Visible;
            divPessoaFisica.DataBind();
        }
    }
}