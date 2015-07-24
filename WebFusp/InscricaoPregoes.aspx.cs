using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using WebFusp.DAL;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class InscricaoPregoes : PageCrud<InscricaoPregaoBLL>
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            // chave primária da tabela
            PRIMARY_KEY = "id_inscricao_pregao";
            //valor da chave primária
            PkValue = Convert.ToInt32(this.txtCodigo.Text);
            // painel do grid
            pGrid = new Panel();
            // painel do formulário de alteração
            pCadastro = panelCadastro;
            // gridview
            _grid = new GridView();
            lbMsg = lblMsg;
            _btAlterar = new Button();
            _btAlterar0 = new Button();
            _btInserir = btSalvar;
            _btInserir0 = new Button();
            _btExcluir = new Button();
            _btExcluir0 = new Button();
            _ddlSize = new DropDownList();
            _ddlMode = new DropDownList();
            _ddlOptions = new DropDownList();
            _txtProcura = new TextBox();
            _btProcurar = new Button();
            _ckFilter = new CheckBox();
            _dataListFiltros = new DataList();
        }

        protected override void GetQueryString()
        {


            Get();
        }

        protected override void Get()
        {
            ObjBLL.Get(PkValue);
            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.id_inscricao_pregao);
            rbTipo.SelectedValue = Convert.ToString(ObjBLL.ObjEF.tipo);
            rbTipo_SelectedIndexChanged(null, null);
            this.cTextoNome.Text = ObjBLL.ObjEF.nome;
            this.cTextoRazaoSocial.Text = ObjBLL.ObjEF.razao_social;
            this.cCPF.Value = ObjBLL.ObjEF.cpf;
            this.cCNPJ2.Value = ObjBLL.ObjEF.cnpj;
            this.cEnder1.Value = ObjBLL.ObjEF.ender;
            cEnder1.DataBind();
            this.txtConfirmaEmail.Text = ObjBLL.ObjEF.email_value;
            this.txtEmail.Text = ObjBLL.ObjEF.email_value;
            this.cTelCelular.Text = ObjBLL.ObjEF.tel_celular_value;
            this.cTelComercial.Text = ObjBLL.ObjEF.tel_comercial_value;
            this.cTelResidencial.Text = ObjBLL.ObjEF.tel_residencial_value;
            this.cTextoNomeFantasia.Text = ObjBLL.ObjEF.nome_fantasia;
        }

        protected override void Set()
        {
            ObjBLL.ObjEF.id_inscricao_pregao = Convert.ToInt32(this.txtCodigo.Text);
            ObjBLL.ObjEF.tipo = (TipoInscricao)Enum.Parse(typeof(TipoInscricao), rbTipo.SelectedValue);
            ObjBLL.ObjEF.nome = this.cTextoNome.Text;
            ObjBLL.ObjEF.razao_social = this.cTextoRazaoSocial.Text;
            ObjBLL.ObjEF.cpf = this.cCPF.Value;
            ObjBLL.ObjEF.cnpj = this.cCNPJ2.Value;
            ObjBLL.ObjEF.ender = this.cEnder1.Value;
            ObjBLL.ObjEF.email_value = this.txtEmail.Text;
            ObjBLL.ObjEF.tel_celular_value = this.cTelCelular.Text;
            ObjBLL.ObjEF.tel_comercial_value = this.cTelComercial.Text;
            ObjBLL.ObjEF.tel_residencial_value = this.cTelResidencial.Text;
            ObjBLL.ObjEF.nome_fantasia = this.cTextoNomeFantasia.Text;

            if (ObjBLL.ObjEF.tipo == TipoInscricao.Pessoa_Fisica)
            {
                ObjBLL.ObjEF.razao_social = String.Empty;
                ObjBLL.ObjEF.nome_fantasia = String.Empty;
                ObjBLL.ObjEF.cnpj = new CNPJ();
                divPessoaJuridica.Visible = false;
                divPessoaFisica.Visible = true;
            }
            else
            {
                ObjBLL.ObjEF.nome = String.Empty;
                ObjBLL.ObjEF.cpf = new CPF();
                divPessoaJuridica.Visible = true;
                divPessoaFisica.Visible = false;
            }
        }

        protected override void SetGrid()
        {
        }

        protected override void SetAdd()
        {
        }

        protected override void SetModify()
        {
        }

        protected override void SetView()
        {
        }

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            if ((TipoInscricao)Enum.Parse(typeof(TipoInscricao), rbTipo.SelectedValue) == TipoInscricao.Pessoa_Fisica)
                ObjBLL.GetCpf(this.cCPF.Value);
            else
                ObjBLL.GetCnpj(this.cCNPJ2.Value);
            
            if (ObjBLL.DataIsValid())
            {
                Set();
                ObjBLL.ObjEF.senha = SecurityBLL.GetSha1Hash(this.txtSenha.Text);
                ObjBLL.Add();

                if (ObjBLL.SaveChanges())
                {
                    EnviarEmail();
                    PkValue = 0;
                    ObjBLL.Detach();
                    Get();
                    msg("cadastro efetuado com sucesso!");
                }
                else
                    msgError("erro ao cadastrar!");
            }
            else
                msgError("cpf/cnpj já cadastrado!");
        }

        private string smtp;
        private string from;

        protected void EnviarEmail()
        {
            smtp = String.Empty;
            from = String.Empty;
            from = ConfigurationManager.AppSettings[String.Format("from{0}", Enum.GetName(typeof(ContaEmail), ContaEmail.fusp))];
            smtp = ConfigurationManager.AppSettings["smtp"];

            string erro;
            try
            {
                MailMessage message = new MailMessage();
                message.IsBodyHtml = true;
                string body;
                MailAddress rem = new MailAddress(from, "FUSP - Fundação de Apoio à USP");
                message.From = rem;
                message.To.Add(ObjBLL.ObjEF.email_value);
                message.Subject = "Confirmação de cadastro";
               body = String.Format(@"<table  width='60%'><tr><td><table bgcolor='#1E90FF'  width='100%' BORDERCOLOR='#1E90FF' >
                        <tr><td><img src='cid:image1' /></td><td><font size='3' color='white'>
                        <strong>FUNDAÇÃO DE APOIO À UNIVERSIDADE DE SÃO PAULO</strong></font></td></tr></table></td></tr>
                <tr><td><table width='100%' bgcolor='#F8F8FF'><tr><td><br />
                <p>Prezado(a) {0}{1}, </p>
                <p>Bem-vindo ao sistema de editais licitatórios da FUSP!</p>
                <p>Venho informar que seu cadastro foi realizado com sucesso!</p>
                <p>A partir de agora você terá acesso aos editais publicados no site da FUSP pelo setor de Licitação e Contratos.</p>
                <p>Para visualizar os editais <a href='http://www.fusp.org.br/'>Acesse o nosso site!</a></p>
                <p>Att.</p><p>Equipe FUSP.</p>
                <br /><p>*Este é um e-mail automático do sistema, portanto não precisa ser respondido!</p><br /></td></table></td></tr>
                <tr><td><table width='100%' bgcolor='#D3D3D3'><tr><td><font size='2'>
                <p>FUNDAÇÃO DE APOIO À UNIVERSIDADE DE SÃO PAULO - FUSP<br />Com sede na Avenida Afrânio Peixoto, nº 14<br />Butantã, São Paulo/SP - CEP 05507-000<br />
                Inscrita no CNPJ/MF sob o nº 68.314.830/0001-27<br />Atendimento: (11)3035-0550<br />De Segunda a Sexta das 8h às 11h30min e das 13h às 16h30min</p>
                </font></td></tr></table></td></tr></table>", ObjBLL.ObjEF.nome, ObjBLL.ObjEF.nome_fantasia);
                message.Body = body;
                AlternateView a = default(AlternateView);
                a = AlternateView.CreateAlternateViewFromString(body, null, "text/html");
                LinkedResource imageResourceEs = new LinkedResource(@"C:/webFusp/WebFusp/WebFusp/Styles/img/fusp_topo.png");
                imageResourceEs.ContentId = "image1";
                imageResourceEs.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;
                a.LinkedResources.Add(imageResourceEs);
                message.AlternateViews.Add(a);
                SmtpClient smtpClient = new SmtpClient(smtp);
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["usuarioSmtp"], ConfigurationManager.AppSettings["senhaSmtp"]);
                smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["porta"]);
                smtpClient.Send(message);
            }
            catch (Exception e)
            {
                erro = "Erro:" + e;
            }
        }
        protected void rbTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tipo = (TipoInscricao)Enum.Parse(typeof(TipoInscricao), rbTipo.SelectedValue);
            divPessoaJuridica.Visible = tipo == TipoInscricao.Pessoa_Juridica;
            divPessoaJuridica.DataBind();
            divPessoaFisica.Visible = !divPessoaJuridica.Visible;
            divPessoaFisica.DataBind();
        }
    }
}