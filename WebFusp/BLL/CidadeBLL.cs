using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebFusp.DAL;

namespace WebFusp.BLL
{
    public class CidadeBLL : Abstract_Crud<Cidade>
    {
        public IEnumerable<Cidade> GetCidadesPorUF(string strUF)
        {
            return (from c in _dbContext.Cidades
                    where c.uf == strUF
                    orderby c.cidade
                    select c).ToList();
        }
    }
}
