using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebFusp.DAL;
using System.Web.UI.WebControls;
using WebFusp.LIB;
using System.Web.Security;
using System.Security;

namespace WebFusp.BLL
{
    public class SecurityBLL000
    {
        public static string GetSha1Hash(string input)
        {
            System.Security.Cryptography.SHA1 sha1 = System.Security.Cryptography.SHA1.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = sha1.ComputeHash(inputBytes);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public static string GeraSenha()
        {
            Random rd = new Random(System.DateTime.Now.Millisecond);
            StringBuilder senha = new StringBuilder();

            for (int i = 0; i < 10; i++)
            {
                char ch = Convert.ToChar(rd.Next('A', 'Z' + 1));
                if (i % 2 == 0)
                    ch = Convert.ToChar(ch.ToString().ToLower());
                senha.Append(ch);
            }
            return senha.ToString();
        }

        //public static bool GetPermission(string strUrl, out bool bGravacao)
        //{
        //    var usu = SecurityBLL.GetCurrentUsuario();
        //    bGravacao = false;
        //    if (usu == null)
        //        return false;
        //    else if (usu.nivel == 1)
        //    {
        //        bGravacao = true;
        //        return true;
        //    }
        //    else
        //    {
        //        strUrl = strUrl.ToUpper().Replace("ASP.", "");
        //        strUrl = strUrl.Contains("_ASPX") ? strUrl.Replace("_ASPX", ".ASPX") : strUrl.Replace("_ASCX", ".ASCX");
        //        strUrl = strUrl.Replace("_", "/");

        //        var ds = from us in usu.nome
        //                 select us;

        //        }
        //}

        public static int LoginLic(string strLoginCNPJ,string strLoginCPF, string strSenha, out string saida, out string url)
        {
            var ctx = new Contexto();
            strSenha = SecurityBLL000.GetSha1Hash(strSenha);
            var user = ctx.InscricaoPregoes.Where(it => (it.cnpj.Value == strLoginCNPJ || it.cpf.Value == strLoginCPF) & it.senha == strSenha & it.status).FirstOrDefault();

            url = "licitacao.aspx";

            saida = user == null ? "Senha e/ou Login inválidos!" : String.Empty;
            return user != null ? user.id_inscricao_pregao : 0;
        }

        public static string AlterarSenha(string strOldSenha, string strNewSenha)
        {
            string saida = String.Empty;
            try
            {
                int intId_inscricao_pregao = SecurityBLL000.GetCurrentUsuario().id_inscricao_pregao;
                Contexto ctx = new Contexto();
                InscricaoPregao ip = ctx.InscricaoPregoes.Where(it => it.id_inscricao_pregao == intId_inscricao_pregao).FirstOrDefault();
                if (ip != null)
                {
                    if (ip.senha == SecurityBLL000.GetSha1Hash(strOldSenha))
                    {
                        ip.primeiro_acesso = false;
                        ip.senha = SecurityBLL000.GetSha1Hash(strNewSenha);
                        if (ctx.SaveChanges() > 0)
                        {
                            saida = "Senha alterada com sucesso!";
                            WebFusp.LIB.Util.ResponseToLogin(saida);
                            System.Web.HttpContext.Current.Session.Clear();
                            FormsAuthentication.SignOut();
                        }
                    }
                    else
                    {
                        saida = "Senha atual incorreta!";
                    }
                }
                else
                    saida = "Usuário não logado!";
            }
            catch (Exception ex)
            {
                saida = ex.Message;
            }
            return saida;
        }

        public static InscricaoPregao GetCurrentUsuario()
        {
            InscricaoPregaoBLL ipBLL = new InscricaoPregaoBLL();
            ipBLL.Get(Convert.ToInt32(System.Web.HttpContext.Current.Session["id_inscricao_pregao"]));
            if (ipBLL.ObjEF.id_inscricao_pregao == 0)
                WebFusp.LIB.Util.ResponseToLogin("Sua sessão acabou!");
            return ipBLL.ObjEF;
        }


        public static string SendPasswordEmail(InscricaoPregao ip)
        {
            string rt = String.Empty;

            try
            {
                if (ip.id_inscricao_pregao != 0)
                {
                    if (ip.status)
                    {
                        var email = ip.email_value;
                        if (email != null)
                        {
                            string pass = SecurityBLL000.GeraSenha();
                            SendEmail sendmail = new SendEmail(ContaEmail.fusp);
                            sendmail.Destinatarios = new string[] {email};
                            sendmail.Subject = "Recuperação de acesso ao Site da FUSP";

                            StringBuilder body = new StringBuilder();
                            body.Append("Esta é uma mensagem automática do sistema. Não responda este e-mail.<br />");
                            body.AppendLine();
                            //body.AppendFormat("Sua senha para acesso ao <a href='http://www.fusp.org.br'>Site da FUSP</a>é: {0}.<br />", pass);
                            body.Append("Seus dados para acesso ao sistema da FUSP são:<br />");
                            body.AppendFormat("<b>Usuário:</b> {0}<br />", ip.tipo == TipoInscricao.Pessoa_Física ? ip.cpf.ToString() : ip.cnpj.ToString());
                            body.AppendFormat("<b>Senha:</b> {0}<br />", pass);
                            body.AppendLine();
                            body.Append("Para acessar o site digite o seu login e em seguida informe a senha.");

                            sendmail.Body = body.ToString();

                            if (sendmail.Send())
                            {
                                var ipBLL = new InscricaoPregaoBLL();
                                ipBLL.Get(ip.id_inscricao_pregao);
                                System.Web.HttpContext.Current.Session["id_inscricao_pregao"] = ipBLL.ObjEF.id_inscricao_pregao;
                                ipBLL.ObjEF.senha = SecurityBLL000.GetSha1Hash(pass);
                                ipBLL.ObjEF.primeiro_acesso = true;
                                ipBLL.Update();
                                ipBLL.SaveChanges();
                                rt = String.Format("Uma nova senha foi enviada para seu e-mail {0}.", email);
                                System.Web.HttpContext.Current.Session.Clear();
                                FormsAuthentication.SignOut();
                            }
                        }
                        else
                            rt = "E-mail não cadastrado!";
                    }
                    else
                        rt = "Usuário inativo!";
                }


                else
                {
                    rt = "Usuário inexistente!";
                }
            }
            catch (Exception ex)
            {
                rt = "Erro! " + ex.Message;
            }
            return rt;
        }

    }
}