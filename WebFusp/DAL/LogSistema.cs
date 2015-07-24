using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebFusp.DAL
{
    public class LogSistema
    {
        [Key]
        public int id_log { get; set; }
                
        [MaxLength(20)]
        public string acao { get; set; }        
        
        [MaxLength(50)]
        public string entidade { get; set; }

        [MaxLength(20)]
        public string ip { get; set; }

        public int id_inscricao_pregao { get; set; }

        [ForeignKey("id_inscricao_pregao")]
        public virtual InscricaoPregao InscricaoPregao { get; set; }

        public DateTime? data { get; set; }

        public int? id_entidade { get; set; }

        public string descricao { get; set; }

        public string alteracoes { get; set; }

    }

    public class LogSistemaConfiguration : EntityTypeConfiguration<LogSistema>
    {
        public LogSistemaConfiguration()
        {
            HasRequired(l => l.InscricaoPregao).WithMany(u => u.LogSistema).HasForeignKey(l => l.id_inscricao_pregao);
            ToTable("LogSistemas");
        }
    }
}
