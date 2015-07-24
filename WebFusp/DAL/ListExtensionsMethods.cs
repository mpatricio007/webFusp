using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFusp.DAL
{
    public static class ListExtensionsMethods
    {
        //public static List<Email> ConvertToListEmail(this List<PessoaEmail> pessoaEmails)
        //{
        //    return (from pemail in pessoaEmails
        //           select pemail.email).ToList();
        //}

        //public static List<PessoaEmail> ConvertToListPessoaEmail(this List<Email> emails)
        //{
        //    return (from em in emails
        //            select new PessoaEmail(em)).ToList();
        //}

        //public static List<Telefone> ConvertToListTelefone(this List<PessoaTelefone> pessoaTelefones)
        //{
        //    return (from ptel in pessoaTelefones
        //            select ptel.telefone).ToList();
        //}

        //public static List<PessoaTelefone> ConvertToListPessoaTelefone(this List<Telefone> telefones)
        //{
        //    return (from tel in telefones
        //            select new PessoaTelefone(tel)).ToList();
        //}

        //public static List<Endereco> ConvertToListEndereco(this List<PessoaEndereco> pessoaEnderecos)
        //{
        //    return (from pender in pessoaEnderecos
        //            select pender.endereco).ToList();
        //}

        //public static List<PessoaEndereco> ConvertToListPessoaEndereco(this List<Endereco> enderecos)
        //{
        //    return (from ender in enderecos
        //            select new PessoaEndereco(ender)).ToList();
        //}


        //public static List<Email> ConvertToListEmail(this List<FinanciadorEmail> fEmails)
        //{
        //    return (from femail in fEmails
        //            select femail.email).ToList();
        //}

        //public static List<FinanciadorEmail> ConvertToListFinanciadorEmail(this List<Email> emails)
        //{
        //    return (from em in emails
        //            select new FinanciadorEmail(em)).ToList();
        //}

        public static List<Telefone> ConvertToListTelefone(this List<InscricaoPregaoTelefone> ipTelefones)
        {
            return (from iptel in ipTelefones
                    select iptel.telefone).ToList();
        }

        public static List<InscricaoPregaoTelefone> ConvertToListInscricaoPregaoTelefone(this List<Telefone> telefones)
        {
            return (from tel in telefones
                    select new InscricaoPregaoTelefone(tel)).ToList();
        }

        //public static List<Endereco> ConvertToListEndereco(this List<InscricaoPregaoEndereco> inscricaoPregaoEnderecos)
        //{
        //    return (from pender in inscricaoPregaoEnderecos
        //            select pender.endereco).ToList();
        //}

        //public static List<InscricaoPregaoEndereco> ConvertToListInscricaoPregaoEndereco(this List<Endereco> enderecos)
        //{
        //    return (from ender in enderecos
        //            select new InscricaoPregaoEndereco(ender)).ToList();
        //}
    }
}