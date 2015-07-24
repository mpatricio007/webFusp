using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Objects.DataClasses;
using System.Data.Common;
using System.Data.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Collections;

namespace WebFusp.DAL
{
    public class Contexto : DbContext
    {
        #region Site
        public DbSet<Site_pag_inicial> Site_pag_inicials { get; set; }
        public DbSet<Site_bndes> Sites_bndes { get; set; }
        #endregion

        public DbSet<vProjeto> vProjetos { get; set; }
        public DbSet<Cidade> Cidades { get; set; }
        public DbSet<InscricaoPregao> InscricaoPregoes { get; set; }
        public DbSet<InscricaoPregaoTelefone> InscricaoPregoesTelefones { get; set; }

        public DbSet<UF> UFS { get; set; }


        public DbSet<EditalLic> EditaisLics { get; set; }
        public DbSet<EditalLicAnexo> EditalLicAnexos { get; set; }
        public DbSet<StatusEditaisLic> StatusEditaisLics { get; set; }
        public DbSet<LogEdital> LogEditais { get; set; }


        public Contexto()
            : base("name=Contexto")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            #region Site
            modelBuilder.Configurations.Add(new Site_pag_inicialConfiguration());
            modelBuilder.Configurations.Add(new Site_bndesConfiguration());
            #endregion
            
            modelBuilder.Configurations.Add(new vProjetoConfiguration()); 

            modelBuilder.Configurations.Add(new CidadeConfiguration());

            modelBuilder.Configurations.Add(new InscricaoPregaoConfiguration());

            modelBuilder.Configurations.Add(new UFConfiguration());

            modelBuilder.Configurations.Add(new ArquivoConfiguration());
            modelBuilder.Configurations.Add(new ExtensaoConfiguration());
            modelBuilder.Configurations.Add(new EditalLicConfiguration());
            modelBuilder.Configurations.Add(new EditalLicAnexoConfiguration());
            modelBuilder.Configurations.Add(new StatusEditaisLicConfiguration());

            modelBuilder.Configurations.Add(new LogEditalConfiguration());

        }
    }
}


