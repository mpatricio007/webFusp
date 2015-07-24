using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebFusp.DAL
{
    public class LogEdital
    {
        [Key]
        public int id_log_edital { get; set; }

        [MaxLength(20)]
        public string acao { get; set; }

        [MaxLength(20)]
        public string ip { get; set; }

        public int? id_inscricao_pregao { get; set; }

        [ForeignKey("id_inscricao_pregao")]
        public virtual InscricaoPregao InscricaoPregao { get; set; }

        public int? id_edital_lic_anexo { get; set; }

        [ForeignKey("id_edital_lic_anexo")]
        public virtual EditalLicAnexo EditalLicAnexo { get; set; }

        public DateTime? data { get; set; }
    }


    public class LogEditalConfiguration : EntityTypeConfiguration<LogEdital>
    {
        public LogEditalConfiguration()
        {
            ToTable("LogEdital");
        }
    }
}