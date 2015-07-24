using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFusp.DAL
{
    public enum TipoInscricao : byte
    {
        Pessoa_Fisica = 1,
        Pessoa_Juridica = 2
    }

    public class TipoInscricaoBLL 
    {
        public static string ToString(TipoInscricao tipo)
        {
            string rt = "";
            switch (tipo)
            {
                case TipoInscricao.Pessoa_Fisica:
                    rt = "pessoa fisica";
                    break;
                case TipoInscricao.Pessoa_Juridica:
                    rt = "pessoa juridica";
                    break;
                default:
                    rt = "erro";
                    break;
            }
            return rt;
        }
    }
}