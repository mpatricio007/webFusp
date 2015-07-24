using System;
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
    public interface IPageCrud
    {   
        void GetExternal();
    }
}
