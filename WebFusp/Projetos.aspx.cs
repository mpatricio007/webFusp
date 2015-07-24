using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class Projetos : PageCrud<vProjetoBLL>
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            // chave primária da tabela
            PRIMARY_KEY = "id_projeto";
            //valor da chave primária
            PkValue = Convert.ToInt32(this.txtCodigo.Text);
            // painel do grid
            pGrid = panelGrid;
            // painel do formulário de alteração
            pCadastro = panelCadastro;
            // gridview
            _grid = grid;
            lbMsg = new Label();
            _btAlterar = new Button();
            _btAlterar0 = new Button();
            _btInserir = new Button();
            _btInserir0 = new Button();
            _btExcluir = new Button();
            _btExcluir0 = new Button();
            _ddlSize = ddlSize;
            _ddlMode = ddlMode;
            _ddlOptions = ddlOptions;
            _txtProcura = txtProcura;
            _btProcurar = btSearch;
            _ckFilter = ckFilter;
            _dataListFiltros = DataListFiltros;

            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                ViewState["SortExpression"] = "codigo";
                ViewState["SortDirection"] = "ASC";
            }
        }

        protected override void Get()
        {
            ObjBLL.Get(PkValue);
            this.txtCodigo.Text = Convert.ToString(ObjBLL.ObjEF.id_projeto);
            lblProjeto.Text = Convert.ToString(ObjBLL.ObjEF.codigo);
            this.lblTitulo.Text = ObjBLL.ObjEF.titulo;
            this.lbUnidadeNucleo.Text = ObjBLL.ObjEF.unidade_nucleo;
            this.lbCoordenadores.Text = ObjBLL.ObjEF.coordenadores;
            this.lbFinanciadores.Text = ObjBLL.ObjEF.financiadores;
            this.lbObjetivo.Text = ObjBLL.ObjEF.objetivo;
            //this.lbInicio.Text = Util.DateToString(ObjBLL.ObjEF.data_inicio.GetValueOrDefault());
            //this.lbTermino.Text = Util.DateToString(ObjBLL.ObjEF.data_termino.GetValueOrDefault());
            //this.lbValor.Text = ObjBLL.ObjEF.valor.HasValue ? String.Format("{0} {1}",ObjBLL.ObjEF.moeda , Util.DecimalToString(ObjBLL.ObjEF.valor)) : String.Empty;
            this.lbInicio.Text = ObjBLL.ObjEF.data_inicio;
            this.lbTermino.Text = ObjBLL.ObjEF.data_termino;
            this.lbValor.Text = ObjBLL.ObjEF.valor;
        }

        protected override void Set()
        {
        }

        protected void btLimparFiltros_Click(object sender, EventArgs e)
        {
            filtros.Clear();
            DataListFiltros.DataBind();
            SetGrid();
        }

        protected override void SetGrid()
        {
            if (_ddlSize.SelectedValue == "0")
                _grid.PageSize = 50;
            else
                _grid.PageSize = Convert.ToInt32(_ddlSize.SelectedValue);

            int size = 10 * Convert.ToInt32(this._ddlSize.SelectedValue);
            _grid.DataKeyNames = new string[] { PRIMARY_KEY };
            _grid.DataSource = ObjBLL.Find(
                filtros,
                (string)ViewState["SortExpression"],
                (string)ViewState["SortDirection"], 0);
            _grid.DataBind();
        }

     }
}