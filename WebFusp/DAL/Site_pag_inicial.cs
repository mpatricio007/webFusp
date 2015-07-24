using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebFusp.DAL
{
    public class Site_pag_inicial
    {
        [Key]
        public int id_site_pag_inicial { get; set; }

        [Required]
        [MaxLength(20)]
        public string titulo { get; set; }

        [Required]
        public string descricao { get; set; }

        [Required]
        public string link { get; set; }

        [Required]
        public int ordem { get; set; }

        public DateTime data { get; set; }

        public bool ativo { get; set; }
    }


    public class Site_pag_inicialConfiguration : EntityTypeConfiguration<Site_pag_inicial>
    {
        public Site_pag_inicialConfiguration()
        {
            HasKey(a => a.id_site_pag_inicial);
            Property(a => a.id_site_pag_inicial).HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);
            ToTable("Site_pag_inicial");
        }
    }
}