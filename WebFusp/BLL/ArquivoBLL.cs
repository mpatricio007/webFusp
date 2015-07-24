using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebFusp.DAL;
using System.Web;
using System.IO;
using WebFusp.LIB;

namespace WebFusp.BLL
{
    public class ArquivoBLL : Abstract_Crud<Arquivo>
    {
        public string contentType { get; set; }

        public byte[] bytes { get; set; }

        public ArquivoBLL(Contexto ctx)
            : base(ctx)
        {
            // TODO: Complete member initialization
            //this._dbContext = ctx;
        }

        public ArquivoBLL()
        {
        }

        public void GetFile(int id_arquivo)
        {
            Get(id_arquivo);
            Util.Bytes2File(ObjEF.data, ObjEF.file_name, ObjEF.Extensao.nome,ObjEF.Extensao.extensao);
        }

        public bool SendFile(string fileName)
        {
            ObjEF.data = bytes;
            ObjEF.file_name = Path.GetFileName(fileName); ;
            ObjEF.id_extensao = ExtensaoBLL.openWith[contentType];
            Add();
            return SaveChanges(); 
        }

        public void Delete(int id_arquivo)
        {
            Get(id_arquivo);
            base.Delete();            
            SaveChanges();
        }
    }
}
