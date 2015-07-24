<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Texto.ascx.cs" Inherits="WebFusp.Controles.Texto" %>
<asp:TextBox ID="txt" runat="server" ontextchanged="txt_TextChanged"     ></asp:TextBox>
<asp:RequiredFieldValidator  ID="rfv" runat="server" ErrorMessage="obrigatório" ControlToValidate="txt" ForeColor="Red" > </asp:RequiredFieldValidator>