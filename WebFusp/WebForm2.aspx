<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebFusp.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(function () {            
            $("#datepicker").datepicker();
        });
    </script>
    <input type="text" id="datepicker" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

</asp:Content>
