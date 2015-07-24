using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebFusp.DAL
{
    public class vProjeto
    {
        [Key]
        public Int64 id_projeto { get; set; }

        //public int id_projeto { get; set; }
        
        public int? codigo { get; set; }

        public string titulo { get; set; }

        public string unidade_nucleo { get; set; }

        public string coordenadores { get; set; }

        public string financiadores { get; set; }

        public string valor { get; set; }

        public string data_inicio { get; set; }

        public string data_termino { get; set; }

        public string objetivo { get; set; }

        public string moeda { get; set; }
    }

    public class vProjetoConfiguration : EntityTypeConfiguration<vProjeto>
    {
        public vProjetoConfiguration()
        {
            ToTable("vProjeto");
        }
    }
}