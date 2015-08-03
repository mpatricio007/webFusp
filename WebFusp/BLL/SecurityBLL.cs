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
    public class SecurityBLL
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

        public static int Login(string strLoginCNPJ, string strLoginCPF, string strSenha, out string saida, out string url, TipoInscricao tipo)
        {
            var ctx = new Contexto();
            strSenha = SecurityBLL.GetSha1Hash(strSenha);
            InscricaoPregao user = new InscricaoPregao();

            url = String.Empty;

            if (tipo == TipoInscricao.Pessoa_Juridica)
            {
                 user = ctx.InscricaoPregoes.Where(it => it.cnpj.Value == strLoginCNPJ & it.senha == strSenha & it.status).FirstOrDefault();
            }
            else
            {
                 user = ctx.InscricaoPregoes.Where(it => it.cpf.Value == strLoginCPF & it.senha == strSenha & it.status).FirstOrDefault();
            }

            if (user != null)
                url = "Licitacao.aspx";

            saida = user == null ? "Senha e/ou Login inválidos!" : String.Empty;
            return user != null ? user.id_inscricao_pregao : 0;
        }

        private static int Login(string strLogin, string strSenha)
        {
            var ctx = new Contexto();
            strSenha = SecurityBLL.GetSha1Hash(strSenha);
            var user = ctx.InscricaoPregoes.Where(it => it.cnpj.Value == strLogin || it.cpf.Value == strLogin & it.senha == strSenha & it.status == true).FirstOrDefault();
            return user != null ? user.id_inscricao_pregao : 0;
        }

        public static string AlterarSenha(string strOldSenha, string strNewSenha)
        {
            string saida = String.Empty;
            try
            {
                int intId_inscricao_pregao = SecurityBLL.GetCurrentUsuario().id_inscricao_pregao;
                Contexto ctx = new Contexto();
                InscricaoPregao insc = ctx.InscricaoPregoes.Where(it => it.id_inscricao_pregao == intId_inscricao_pregao).FirstOrDefault();
                if (insc != null)
                {
                    if (insc.senha == SecurityBLL.GetSha1Hash(strOldSenha))
                    {
                        insc.primeiro_acesso = false;
                        insc.senha = SecurityBLL.GetSha1Hash(strNewSenha);
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
            InscricaoPregaoBLL insBLL = new InscricaoPregaoBLL();
            insBLL.Get(Convert.ToInt32(System.Web.HttpContext.Current.Session["id_inscricao_pregao"]));
            if (insBLL.ObjEF.id_inscricao_pregao == 0)
                WebFusp.LIB.Util.ResponseToLogin("Sua sessão acabou!");
            return insBLL.ObjEF;
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
                            string pass = SecurityBLL.GeraSenha();
                            SendEmail sendmail = new SendEmail(ContaEmail.fusp);
                            sendmail.Destinatarios = new string[] { email };
                            sendmail.Subject = "Recuperação de acesso ao Sistema da FUSP";

                            StringBuilder body = new StringBuilder();
                            body.Append("Esta é uma mensagem automática do sistema. Não responda este e-mail.<br />");
                            body.AppendLine();
                            //body.AppendFormat("Sua senha para acesso ao <a href='http://www.fusp.org.br'>Sit da FUSP</a> Site da FUSP é: {0}.<br />", pass);
                            body.Append("Seus dados para acesso ao sistema da FUSP são:<br />");
                            body.AppendFormat("<b>Usuário:</b> {0}<br />", ip.tipo == TipoInscricao.Pessoa_Fisica ? ip.cpf.ToString() : ip.cnpj.ToString());
                            body.AppendFormat("<b>Senha:</b> {0}<br />", pass);
                            body.AppendLine();
                            body.Append("Para acessar o sistema digite o seu login e em seguida informe a senha.");

                            sendmail.Body = body.ToString();

                            if (sendmail.Send())
                            {
                                var ipBLL = new InscricaoPregaoBLL();
                                ipBLL.Get(ip.id_inscricao_pregao);
                                System.Web.HttpContext.Current.Session["id_inscricao_pregao"] = ipBLL.ObjEF.id_inscricao_pregao;
                                ipBLL.ObjEF.senha = SecurityBLL.GetSha1Hash(pass);
                                ipBLL.ObjEF.primeiro_acesso = true;
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

        public static int GetIdUsuarioAutomatic()
        {
            try
            {
                return Login("automatic", "pankada");
            }
            catch (Exception)
            {

                return 0;
            }
        }

        
    }
}