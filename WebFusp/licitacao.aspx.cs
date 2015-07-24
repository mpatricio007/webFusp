using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebFusp.BLL;
using WebFusp.DAL;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class licitacao : BasePage
    {
        public int filterByTab 
        {
            get
            {
                if (ViewState[ID] == null)
                    filterByTab = 0;
                return Convert.ToInt32(ViewState[ID]);
            }
            set
            {
                ViewState[ID] = value;
            }
        }

        Contexto ctx = new Contexto();

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                base.Page_Load(sender, e);
                SetTabs();
            }
        }

        public void SetTabs()
        {
            StringBuilder str = new StringBuilder();
            int cont = 0;
            foreach (var item in ctx.StatusEditaisLics.OrderBy(it => it.ordem).ToList())
            {
                if (cont == 0 & filterByTab == 0)
                    filterByTab = item.id_status_edital_lic;
                str.AppendFormat("<li class='{0}'><a id='{1}' href='#aba' data-toggle='tab'>{2}</a></li>", filterByTab == item.id_status_edital_lic ? "active" : String.Empty, item.id_status_edital_lic, item.nome);
                cont++;
            }

            ulAbas.InnerHtml = str.ToString();
            SetDataList();
        }

        protected void SetDataList()
        {
            dlEditais.DataSource = ctx.EditaisLics.Where(it=>it.id_status_edital_lic == filterByTab).OrderByDescending(it => it.id_edital_lic).ToList();
            dlEditais.DataBind();
            for (int i = 0; i < dlEditais.Items.Count; i++)
            {
                DataList dAnexos = (DataList)dlEditais.Items[i].FindControl("dlAnexos");
                EditalLicBLL el = new EditalLicBLL();
                el.Get((int)dlEditais.DataKeys[i]);
                dAnexos.DataSource = el.ObjEF.EditalLicAnexos.OrderBy(it => it.ordem);
                dAnexos.DataBind();
            }
        }

        protected void btTabSelect_Click(object sender, EventArgs e)
        {
            filterByTab = Util.StringToInteiro(txtTabIndex.Text).GetValueOrDefault();
            SetTabs();
        }

  

        protected void lkAnexo_Click(object sender, EventArgs e)
        {            
            var lk = (LinkButton)sender;
            int id_edital_lic_anexo = Util.StringToInteiro(lk.CommandArgument).GetValueOrDefault();
            var eBLL = new EditalLicAnexoBLL();
            eBLL.Get(id_edital_lic_anexo);

            if (eBLL.ObjEF.login_obrigatorio ? SecurityBLL.GetCurrentUsuario().id_inscricao_pregao != 0 : true)
            {
                eBLL.AddInscrito();
                eBLL.arqBLL.GetFile(eBLL.ObjEF.id_arquivo);
            }
            else
                Response.Redirect("~/Login.aspx");
        }

    }
}