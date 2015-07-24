using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebFusp.DAL;

namespace WebFusp.BLL
{
    public class Site_pag_inicialBLL : Abstract_Crud<DAL.Site_pag_inicial>
    {
        public string GetAllDestaques()
        {
            var ds = _dbContext.Site_pag_inicials.Where(x => x.ativo).OrderBy(o=>o.ordem).ToList(); 
            var rt = new StringBuilder();
            int i = 0;
            rt.Append("<div class=\"row-fluid\">");
            foreach (var item in ds)
	        {
                if (i > 0 && i % 3 == 0)
                {
                    rt.Append("</div><div class=\"row-fluid\">");
                }

                rt.AppendFormat("<span class=\"span4\"> <h4>{0}</h4><p>{1}</p><p><a class=\"btn\" href=\"{2}\">Detalhes »</a></p></span>",
                    item.titulo,item.descricao,item.link);
                i++;
                
	        }
            rt.Append("</div>");
            return rt.ToString();                     
        }
    }
}
