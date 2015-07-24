using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using WebFusp.DAL;

namespace WebFusp.BLL
{
    public class Site_bndesBLL : Abstract_Crud<Site_bndes>
    {
        public string HtmlPaginaBndes()
        {
            var html = new StringBuilder();
            html.Append("<table class=\"table-with-borderradius\" width=\"100%\">");

            foreach (var item in _dbSet.Where(it => it.ativo).OrderBy(it => it.ordem).ToList())
            {
                html.AppendFormat("<tr><th colspan=\"2\" class=\"text-center\">{0}</th></tr>", item.titulo);
                html.AppendFormat("<tr><td class=\"text-left\">Atividade</td><td class=\"text-left\">{0}</td></tr>",item.atividade);

                if(!String.IsNullOrEmpty(item.copatrocinador))
                    html.AppendFormat("<tr><td class=\"text-left\">Co-patrocinador</td><td class=\"text-left\">{0}</td></tr>", item.copatrocinador);
                html.AppendFormat("<tr><td class=\"text-left\">Coordenador(a)</td><td class=\"text-left\">{0}</td></tr>", item.coordenador);

            }
            html.Append("</table>");
            return html.ToString();
        }
    }
}