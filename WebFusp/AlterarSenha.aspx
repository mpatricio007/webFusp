<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLic.master" AutoEventWireup="true" CodeBehind="AlterarSenha.aspx.cs" Inherits="WebFusp.AlterarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div >
    <h2 class="auto-style1">ALTERAR SENHA</h2>
    <p>
        Entre com sua senha atual e&nbsp;cadastre uma nova senha.</p>

         <div>
            <fieldset>
                <legend class="auto-style2">Alteração de senha</legend>
                
                <div class="editor-field">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha "></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvSenha" runat="server" 
                    ControlToValidate="txtSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                <br/>

                <div class="editor-field">
                    <asp:Label ID="Label1" runat="server" Text="Nova Senha "></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtNewSenha" runat="server" TextMode="Password" Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNewSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                </div>
                <br/>

                <div class="editor-field">
                    <asp:Label ID="Label2" runat="server" Text="Confirmar nova senha"></asp:Label>
                </div>
                
                <div class="editor-label">
                    <asp:TextBox ID="txtConfirmNewSenha" runat="server" TextMode="Password" 
                        Width="175px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtConfirmNewSenha" ErrorMessage="obrigatório"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvSenha" runat="server" 
                        ControlToCompare="txtNewSenha" ControlToValidate="txtConfirmNewSenha" 
                        EnableTheming="False" ErrorMessage="as senhas não coincidem" ForeColor="Red"></asp:CompareValidator>
                </div>
                <br/>
               
                <div class="editor-label">
                    <asp:Button class="btn btn-large btn-primary" ID="btAlterarSenha" runat="server" Text="salvar" 
                        onclick="btAlterarSenha_Click" />
                    <asp:LinkButton class="btn btn-large btn-primary" ID="Button1" runat="server" CausesValidation="False" 
                        PostBackUrl="~/Login.aspx" Text="cancelar" />
                    <asp:Label ID="lbLog" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

