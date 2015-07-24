<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Telefone.ascx.cs" Inherits="WebFusp.Controles.Telefone" %>


<asp:TextBox ID="txt" runat="server" MaxLength="11" Width="150px" CssClass="telefone"></asp:TextBox>
&nbsp;<asp:TextBox ID="txtRamal" runat="server" MaxLength="4" Width="100px" Enabled="False" Visible="False"></asp:TextBox>
&nbsp;<asp:DropDownList ID="ddlTipo" runat="server" Width="120px" Enabled="False" Visible="False">
</asp:DropDownList>
&nbsp;Formato: (99) 9-9999-9999
<asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txt" 
    ErrorMessage="telefone obrigatório" EnableTheming="False" ForeColor="Red"></asp:RequiredFieldValidator>






