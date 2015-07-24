<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLic.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFusp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .auto-style1 {
            width: 57px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="loginDisplay">
            </div>
    <span>LOGIN</span><asp:Panel ID="panelCadastro" runat="server">
        <table class="cadastro" width="100%">
            <tr>
                <td class="auto-style1"><span class="error">*</span> tipo:<asp:Label ID="txtCodigo" runat="server" Text="0" Visible="False"></asp:Label>
                </td>
                <td class="direito">
                    <asp:DropDownList ID="ddlTipo" runat="server" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTipo" ErrorMessage="campo obrigatório!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <asp:Panel ID="divPessoaJuridica" runat="server" Visible="false">
                      <tr>
                        <td class="esquerdo">cnpj:</td>
                        <td class="direito">
                            <cCnpj:cCNPJ ID="cCNPJ2" runat="server"/>
                          </td>
                      </tr>
                      </asp:Panel>
                      <asp:Panel ID="divPessoaFisica" runat="server" Visible="true">
                      <tr>
                        <td class="esquerdo">cpf:</td>
                        
                        <td class="direito">
                            <cCpf:cCPF ID="cCPF" runat="server"/>
                          </td>
                      </tr>
                          
                      </asp:Panel>
            
            <tr>
                <td class="auto-style1">senha:</td>
                <td class="direito" width="50px">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lbMsg" runat="server" style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <div id="dGravacao1" runat="server">
                        <asp:Button class="btn btn-large btn-primary" ID="btEntrar" runat="server" OnClick="btEntrar_Click" Text="entrar" />
                        &nbsp;<asp:HyperLink ID="hlSenha" runat="server" Font-Underline="True" ForeColor="Gray" NavigateUrl="EsqueceuSenha.aspx">esqueceu sua senha?</asp:HyperLink>
                        &nbsp;<asp:LinkButton ID="lkNew" runat="server" 
                            PostBackUrl="~/InscricaoPregoes.aspx" 
                            CausesValidation="False" ForeColor="Gray">Não possui cadastro? Cadastre-se!</asp:LinkButton>
                    </div>
                </th>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
