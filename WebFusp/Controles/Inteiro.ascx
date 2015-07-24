<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inteiro.ascx.cs" Inherits="WebFusp.Controles.Inteiro" %>
<asp:PlaceHolder ID="StyleSheet" runat="server" Visible="False">
</asp:PlaceHolder>
<asp:TextBox ID="txtInteiro" runat="server" onkeyup="formataInteiro(this,event);" ></asp:TextBox>

<asp:RequiredFieldValidator ID="rfvInteiro" runat="server" ForeColor="Red"
    ControlToValidate="txtInteiro" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>


