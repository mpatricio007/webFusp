using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;

namespace WebFusp.Controles
{
    public partial class Endereco : System.Web.UI.UserControl
    {
        public string Titulo
        {
            get { return lblTitulo.Text; }
            set { lblTitulo.Text = value; }
        }

        public WebFusp.DAL.Endereco Value
        {
            get 
            {
                WebFusp.DAL.Endereco ender = new DAL.Endereco();
                ender.logradouro = this.cTextoLogradouro.Text;
                ender.numero = this.cTextoNumero.Text;
                ender.complemento = this.cTextoComplemento.Text;
                ender.bairro = this.cTextoBairro.Text;
                ender.cidade = this.listaCidade.SelectedValue;
                ender.uf = this.listaUF.SelectedValue;                
                ender.cep = this.cTextoCep.Text;    
                return ender; 
            }
            set
            {
                value = value ?? new WebFusp.DAL.Endereco();

                this.cTextoLogradouro.Text = value.logradouro;
                this.cTextoNumero.Text = value.numero;
                this.cTextoComplemento.Text = value.complemento;
                this.cTextoBairro.Text = value.bairro;

                value.uf = value.uf ?? "SP";
                this.listaUF.SelectedValue = value.uf;
                if (!listaCidade.Items.Contains(new ListItem(value.cidade)))
                    SetCidades(value.uf);

                value.cidade = value.cidade ?? "São Paulo";
                this.listaCidade.SelectedValue = value.cidade;

                this.cTextoCep.Text = value.cep;
            }
        }

        public string ValidationGroup
        {
            get
            {
                return rfvLogradouro.ValidationGroup;
            }
            set
            {
                rfvLogradouro.ValidationGroup = value;
                rfvBairro.ValidationGroup = value;
                rfvNumero.ValidationGroup = value;
                rfvCep.ValidationGroup = value;
                cvCidade.ValidationGroup = value;
                cvUF.ValidationGroup = value;
            }
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            loadUF();
            loadCidade();
        }

        protected void loadUF()
        {
            if (!IsPostBack)
            {
                UFBLL u = new UFBLL();
                listaUF.DataSource = u.GetAll("uf");
                listaUF.Items.Insert(0, new ListItem("UF", "0"));
                listaUF.DataBind();
                listaUF.SelectedValue = "SP";
            }
        }

        protected void loadCidade()
        {
            if (!IsPostBack)
            {
                CidadeBLL c = new CidadeBLL();
                listaCidade.DataSource = c.GetAll("cidade");
                listaCidade.Items.Insert(0, new ListItem("CIdade", "0"));
                listaCidade.DataBind();
                listaCidade.SelectedValue = "São Paulo";
            }
        }

        protected void listaUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetCidades(listaUF.SelectedValue);
            listaCidade.Focus();
        }       

        public void SetCidades(string strUF)
        {
            CidadeBLL c = new CidadeBLL();
            listaCidade.Items.Clear();
            listaCidade.DataSource = c.GetCidadesPorUF(strUF);
            listaCidade.Items.Insert(0, new ListItem("selecione uma cidade...", "0"));
            listaCidade.DataBind();
        }
    }
}