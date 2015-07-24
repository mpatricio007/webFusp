<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="bndes.aspx.cs" Inherits="WebFusp.bndes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row-fluid">
        <div class="span12">

            <h2>BNDES NA FUSP</h2>

            <p>
                O BNDES está apoiando os seguintes projetos em execução pela USP, através da FUSP como gerenciadora dos recursos:
            </p>
            <div id="dContent" runat="server"></div>


       

        </div>
    </div>



</asp:Content>
