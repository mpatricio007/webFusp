using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e); 
        Page.Header.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
