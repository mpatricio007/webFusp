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
    public partial class AlterarCadastro : PageCrud<InscricaoPregaoBLL>
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
            _btAlterar = btSalvar;
            _btAlterar0 = new Button();
            _btInserir = new Button();
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

            if (!IsPostBack)
            {
            
                //int id_usuario = SecurityBLL.GetCurrentUsuario().id_inscricao_pregao;

                //if (id_usuario == 0)                
                //    FormsAuthentication.RedirectToLoginPage();
                //else
                //{
                //    PkValue = id_usuario;
                //    Get();
                //}
            }
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            base.OnLoadComplete(e);
            if (!IsPostBack)
            {

                int id_usuario = SecurityBLL.GetCurrentUsuario().id_inscricao_pregao;

                if (id_usuario == 0)
                    FormsAuthentication.RedirectToLoginPage();
                else
                {
                    PkValue = id_usuario;
                    Get();
                }
            }
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

        protected override void Get()
        {
            ObjBLL.Get(PkValue);
            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.id_inscricao_pregao);
            rbTipo.SelectedValue = Convert.ToString(ObjBLL.ObjEF.tipo);
            rbTipo_SelectedIndexChanged(null, null);
            this.cTextoNome.Text = ObjBLL.ObjEF.nome;
            this.cTextoRazaoSocial.Text = ObjBLL.ObjEF.razao_social;
            this.txtCpf.Text = ObjBLL.ObjEF.cpf.Value;
            this.txtCnpj.Text = ObjBLL.ObjEF.cnpj.Value;
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
            ObjBLL.ObjEF.nome = this.cTextoNome.Text;
            ObjBLL.ObjEF.razao_social = this.cTextoRazaoSocial.Text; 
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

        protected void btSalvar_Click(object sender, EventArgs e)
        {
            ObjBLL.Get(PkValue);
            Set();
            ObjBLL.Update();
            if (ObjBLL.SaveChanges())
            {
                msg("alteração efetuada");
                PkValue = ObjBLL.ObjEF.id_inscricao_pregao;
                ObjBLL.Detach();
                Get();
                SetModify();
            }
            else
                msgError("erro alteração");
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