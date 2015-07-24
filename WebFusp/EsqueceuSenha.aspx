<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLic.master" AutoEventWireup="true" CodeBehind="EsqueceuSenha.aspx.cs" Inherits="WebFusp.EsqueceuSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">  
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2 class="auto-style1">ESQUECEU SUA SENHA</h2>
        <p>
            Entre com o seu cpf / cnpj e clique em enviar. Uma nova senha será gerada e 
            enviada para o email cadastrado.</p>
        <div>
            <fieldset>
                <legend>Recuperar Senha</legend>
                <%-- <div class="editor-field">
                    <cCpf:cCPF ID="cCPF1" runat="server" />
                </div>--%>tipo:
                
                <asp:DropDownList ID="ddlTipo" runat="server" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTipo" ErrorMessage="campo obrigatório!" ForeColor="Red"></asp:RequiredFieldValidator>
               
           
                <asp:Panel ID="divPessoaJuridica" runat="server" Visible="False">
                 <div class="editor-field">
                     cnpj:
                    <cCnpj:cCNPJ ID="cCNPJ" runat="server"/>
                </div>
                    <br />
                <div class="editor-label">
                    <asp:Button ID="btSendSenhaCNPJ" runat="server" onclick="btSendSenhaCNPJ_Click" 
                        Text="enviar" />
                    <asp:Label ID="lbLogCNPJ" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </asp:Panel>
            <asp:Panel ID="divPessoaFisica" runat="server" Visible="true">
                 <div class="editor-field">
                     cpf:
                    <cCpf:cCPF ID="cCPF1" runat="server" />
                </div>
                <br />
                <div class="editor-label">
                    <asp:Button ID="btSendSenhaCPF" runat="server" onclick="btSendSenhaCPF_Click" 
                        Text="enviar" />
                    <asp:Label ID="lbLogCPF" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </asp:Panel>
               <%-- <div class="editor-field">
                    <cCpf:cCPF ID="cCPF1" runat="server" />
                </div>--%>
                
            </fieldset>
        </div>
    </div>
</asp:Content>

