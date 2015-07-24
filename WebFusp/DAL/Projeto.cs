using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebFusp.DAL
{
    public class Projeto
    {
        [Key]
        public int id_projeto { get; set; }

        public int codigo { get; set; }

        public string titulo { get; set; }

        public string unidade_nucleo { get; set; }

        public string coordenadores { get; set; }

        public string financiadores { get; set; }
    }

    public class ProjetoConfiguration : EntityTypeConfiguration<Projeto>
    {
        public ProjetoConfiguration()
        {
            ToTable("Projeto");
        }
    }
}