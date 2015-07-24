﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Linq.Expressions;
using WebFusp.DAL;
using WebFusp.BLL;
using System.Web.UI;

namespace WebFusp.LIB
{
    public abstract class PageCrud<T> : BasePage, IPageCrud where T : IBaseCrud, new()
    {
        public string PRIMARY_KEY { get; set; }

        private object pkValue;

        public object PkValue
        {
            get { return pkValue; }
            set { pkValue = value; }
        }

        public Panel pGrid { get; set; }
        public Panel pCadastro { get; set; }
        public Label lbMsg { get; set; }
        public Button _btInserir { get; set; }
        public Button _btInserir0 { get; set; }
        public Button _btAlterar { get; set; }
        public Button _btAlterar0 { get; set; }
        public Button _btExcluir { get; set; }
        public Button _btExcluir0 { get; set; }
        public Button _btProcurar { get; set; }
        public ImageButton _btExcluiFiltro { get; set; }
        public GridView _grid { get; set; }
        public DropDownList _ddlSize { get; set; }
        public DropDownList _ddlOptions { get; set; }
        public DropDownList _ddlMode { get; set; }
        public TextBox _txtProcura { get; set; }
        public Dictionary<string,string> dicProperties { get; set; }
        private CheckBox ck;
        public CheckBox _ckFilter
        {
            get 
            {
                if (ck == null)
                    ck = new CheckBox();
                return ck; 
            }
            set { ck = value; }
        }
        
        public DataList _dataListFiltros { get; set; }

        protected List<Filter> filtros
        {
            get
            {
                if (ViewState["filtros"] == null)
                    filtros = new List<Filter>();
                return (List<Filter>)ViewState["filtros"];
            }
            set
            {
                ViewState["filtros"] = value;
            }
        }

        private T objBLL;

        public T ObjBLL
        {
            get
            {
                if (objBLL == null)
                    objBLL = new T();
                return objBLL;
            }
            set { objBLL = value; }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                
                base.Page_Load(sender, e);
                _ddlSize.SelectedValue = "20";
                ViewState["SortExpression"] = PRIMARY_KEY;
                ViewState["SortDirection"] = "DESC";

                GetQueryString();
                this.ddlOptions_SelectedIndexChanged(null, null);
                _btExcluir.OnClientClick = "return confirm('confirma exclusão?')";
                _btExcluir0.OnClientClick = "return confirm('confirma exclusão?')";
            }
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            if (!IsPostBack)
                GetQueryString();
            base.OnLoadComplete(e);
        }

        protected virtual void GetQueryString()
        {            
            pkValue = Convert.ToInt64(HttpContext.Current.Request.QueryString["pk"].DesCriptografar());
            if ((long)pkValue == 0)
            {
                SetView();
                SetGrid();
            }
            else
            {
                Get();
                SetModify();
            }
        }

        protected virtual void SetView()
        {
            pGrid.Visible = true;
            pCadastro.Visible = false;
        }

        protected virtual void SetAdd()
        {
            lbMsg.Text = String.Empty;
            pGrid.Visible = false;
            pCadastro.Visible = true;
            _btInserir.Visible = true;
            _btInserir0.Visible = true;
            _btAlterar.Visible = false;
            _btAlterar0.Visible = false;
            _btExcluir.Visible = false;
            _btExcluir0.Visible = false;
        }

        protected virtual void SetModify()
        {
            lbMsg.Text = String.Empty;
            pCadastro.Visible = true;
            pGrid.Visible = false;
            _btInserir.Visible = false;
            _btInserir0.Visible = false;
            _btAlterar.Visible = true;
            _btAlterar0.Visible = true;
            _btExcluir.Visible = true;
            _btExcluir0.Visible = true;
        }

        protected abstract void Get();

        protected abstract void Set();

        protected virtual void msg(string msg)
        {
            lbMsg.BackColor = System.Drawing.Color.Green;
            lbMsg.ForeColor = System.Drawing.Color.White;
            lbMsg.Text = string.Format("* {0} !", msg);
            
        }

        protected virtual void msgError(string msg)
        {
            lbMsg.BackColor = System.Drawing.Color.Red;
            lbMsg.ForeColor = System.Drawing.Color.White;
            lbMsg.Text = string.Format("* {0} !?", msg);
        }

        protected virtual void btInserir_Click(object sender, EventArgs e)
        {
            Set();
            if (ObjBLL.DataIsValid())
            {
                ObjBLL.Add();
                if (ObjBLL.SaveChanges())
                {
                    msg("inclusão efetuada");
                    PkValue = 0;
                    ObjBLL.Detach();
                    Get();

                }
                else
                    msgError("erro alteração");
            }
            else
                msgError("erro inclusão");
        }

        protected virtual void btAlterar_Click(object sender, EventArgs e)
        {
            ObjBLL.Get(PkValue);
            Set();
            if (ObjBLL.DataIsValid())
            {
                ObjBLL.Update();
                if (ObjBLL.SaveChanges())
                    msg("alteração efetuada");
                else
                    msgError("erro alteração");
            }
            else
                msgError("erro alteração");
        }

        protected virtual void btExcluir_Click(object sender, EventArgs e)
        {
            ObjBLL.Get(PkValue);
            if (ObjBLL.DataIsValid())
            {
                ObjBLL.Delete();
                if (ObjBLL.SaveChanges())
                {
                    msg("exclusão efetuada");
                    Get();
                    SetAdd();
                }
                else
                    msgError("erro alteração");
            }
            else
                msgError("erro exclusão");
        }

        protected virtual void btCancelar_Click(object sender, EventArgs e)
        {
            SetGrid();
            SetView();
        }

        protected virtual void btCriar_Click(object sender, EventArgs e)
        {
            PkValue = 0;
            Get();
            SetAdd();
        }

        protected virtual void btProcurar_Click(object sender, EventArgs e)
        {

            if (!_ckFilter.Checked)
                filtros.Clear();

            if(!String.IsNullOrEmpty(this._txtProcura.Text))
                filtros.Add(setFilter());

            if (_ckFilter.Checked)
            {
                _dataListFiltros.DataBind(); 
                this._txtProcura.Text = String.Empty;
            }

            SetGrid();
            SetView();

        }

        protected virtual void grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PkValue = _grid.DataKeys[e.NewEditIndex][PRIMARY_KEY];
            Get();
            _grid.DataBind();
            SetModify();
            e.Cancel = true;
        }

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            _grid.PageIndex = e.NewPageIndex;
            SetGrid();
        }

        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {

            if (ViewState["SortExpression"].Equals(e.SortExpression))
            {
                if (ViewState["SortDirection"].Equals("ASC"))
                    ViewState["SortDirection"] = "DESC";
                else
                    ViewState["SortDirection"] = "ASC";
            }
            else
            {
                ViewState["SortDirection"] = "ASC";
                ViewState["SortExpression"] = e.SortExpression;
            }
            SetGrid();
        }

        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {

            SetGrid();
        }

        protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (!e.Row.Equals(null) & e.Row.RowType.Equals(DataControlRowType.Header))
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        LinkButton button = (LinkButton)cell.Controls[0];

                        if (!button.Equals(null))
                        {
                            Image image = new Image();
                            if (ViewState["SortExpression"].Equals(button.CommandArgument))
                            {
                                if (ViewState["SortDirection"].Equals("ASC"))
                                    image.ImageUrl = @"~/Styles/img/SortAsc.png";
                                else
                                    image.ImageUrl = @"~/Styles/img/SortDesc.png";

                                cell.Controls.Add(image);
                            }
                        }
                    }
                }
            }

        }

        protected virtual void SetGrid()
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
                (string)ViewState["SortDirection"], size);
            _grid.DataBind();
        }

        protected void GetModes(Type tipo)
        {
            if (tipo != null)
            {
                _ddlMode.DataTextField = "Value";
                _ddlMode.DataValueField = "Key";
                _ddlMode.DataSource = Filter.SearchModes[tipo];
                _ddlMode.DataBind();
            }
        }

        protected virtual void ddlOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetModes(ObjBLL.GetPropertyType(this._ddlOptions.SelectedValue));
        }

        protected virtual void DataListFiltros_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            filtros.RemoveAt(e.Item.ItemIndex);
            _dataListFiltros.DataBind();
            SetGrid();
        }

        protected void DataListFiltros_DataBinding(object sender, EventArgs e)
        {
            _dataListFiltros.DataSource = filtros;
        }

        protected virtual Filter setFilter()
        {
            try
            {
                Filter f = new Filter();
                f.property = dicProperties == null ? _ddlOptions.SelectedValue : dicProperties[_ddlOptions.SelectedValue];
                f.property_name = _ddlOptions.SelectedItem.Text;
                f.displayValue = f.value = this._txtProcura.Text.ToUpper();
                f.mode = this._ddlMode.SelectedValue;
                f.mode_name = this._ddlMode.SelectedItem.Text;
                return f;
            }

            catch (Exception)
            {
                return new Filter();
            }
        }

        protected virtual void ckFilter_CheckedChanged(object sender, EventArgs e)
        {          
            filtros.Clear();
            _dataListFiltros.DataBind();
            _btProcurar.Text = _ckFilter.Checked ? "adicionar filtro" : "procurar";
            _btProcurar.DataBind();
        }

        public void GetExternal()
        {
            Get();
        }
    }
}
