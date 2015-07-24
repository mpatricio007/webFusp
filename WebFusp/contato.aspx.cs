using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFusp.LIB;

namespace WebFusp
{
    public partial class contato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LimparCampos();
        }

        private void LimparCampos()
        {
            txtEmail.Value = txtNome.Value = String.Empty;
            txtBody.Value = txtAssunto.Value = String.Empty;
        }

        public bool validarEmail(string Email)
        {
            bool ValidEmail = false;
            int indexArr = Email.IndexOf("@");
            if (indexArr > 0)
            {
                int indexDot = Email.IndexOf(".", indexArr);
                if (indexDot - 1 > indexArr)
                {
                    if (indexDot + 1 < Email.Length)
                    {
                        string indexDot2 = Email.Substring(indexDot + 1, 1);
                        if (indexDot2 != ".")
                        {
                            ValidEmail = true;
                        }
                    }
                }
            }
            return ValidEmail;
        }

        protected void btEnviar_Click(object sender, EventArgs e)
        {
            if ((txtNome.Value == "") ||
               (!validarEmail(txtEmail.Value)) ||
               (txtAssunto.Value == "") ||
               (txtBody.Value == ""))
            {
                lbMsg.ForeColor = Color.Red;
                lbMsg.Text = "Todos os campos são obrigatórios!!!!";
            }
            else
            {
                SendEmail s = new SendEmail(ContaEmail.fusp);
                s.Destinatarios = new string[] { "fusp@fusp.org.br" };
                s.Subject = txtAssunto.Value;
                s.Body = String.Format("nome:{0}<br/>E-mail: e-mail: {1}<br/><br/>assunto: {2} Enviado Contato Site FUSP<br/><br/>Mensagem: {3}", txtNome.Value, txtEmail.Value, txtAssunto.Value, txtBody.Value);
                if (s.Send())
                {
                    lbMsg.ForeColor = Color.Green;
                    lbMsg.Text = "email enviado com sucesso!";
                    LimparCampos();
                }
                else
                {
                    lbMsg.ForeColor = Color.Red;
                    lbMsg.Text = "Erro ao enviar o email!";
                }

            }

        }
    }
}