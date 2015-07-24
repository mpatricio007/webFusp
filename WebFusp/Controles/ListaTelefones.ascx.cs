using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.DAL;

namespace WebFusp.Controles
{
    public partial class ListaTelefones : System.Web.UI.UserControl
    {
        public List<DAL.Telefone> Value
        {
            get
            {
                if (ViewState[ID] == null)
                    Value = new List<DAL.Telefone>();
                return (List<DAL.Telefone>)ViewState[ID];
            }
            set
            {
                ViewState[ID] = value;
            }
        }

        private int index
        {
            get
            {
                return Convert.ToInt32(txtId.Text);
            }
            set
            {
                txtId.Text = Convert.ToString(value);

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setAdd();
                cTel1.Focus();
            }
        }

        protected void setAdd()
        {
            btAdd.Visible = true;
            btCancel.Visible = true;
            btExcluir.Visible = false;
            cTel1.Focus();
            limparCampos();
        }

        protected void setUpdate()
        {
            btAdd.Visible = true;
            btCancel.Visible = true;
            btExcluir.Visible = true;
            cTel1.Focus();
            this.cTel1.Focus();
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            set();
            limparCampos();
            gridTelefone.DataBind();
            index = -1;
            setAdd();

        }

        protected void gridTelefone_DataBinding(object sender, EventArgs e)
        {
            gridTelefone.DataSource = Value;
        }

        protected void gridTelefone_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            index = e.RowIndex;
            get();
            gridTelefone.DataBind();

        }

        public override void DataBind()
        {
            gridTelefone.DataBind();
            base.DataBind();
        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            index = -1;
            limparCampos();
            gridTelefone.DataBind();
            setAdd();
        }

        private void get()
        {
            DAL.Telefone tel = Value[index];
            this.cTel1.Value = tel;         
            setUpdate();
        }

        private void set()
        {
            var tel = index < 0 ? new DAL.Telefone() : Value[index];

            tel = this.cTel1.Value;

            if (index < 0)
                Value.Add(tel);
            else
                Value[index] = tel;
        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            Value.RemoveAt(index);
            limparCampos();
            index = -1;
            setAdd();
            gridTelefone.DataBind();
        }

        protected void limparCampos()
        {
            this.cTel1.Value = new DAL.Telefone();            
            this.cTel1.Focus();
        }
    }
}