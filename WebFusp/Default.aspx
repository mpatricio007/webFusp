<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFusp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="hero-unit">
                    <div id="myCarousel" class="carousel slide">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="Conheca.aspx"><img src="Styles/img/fotobanner1.jpg" /></a>
                            </div>
                            <div class="item">
                                <a href="Conheca.aspx"><img src="Styles/img/fotobanner2.jpg" /></a>
                            </div>
                            <div class="item">
                                <a href="Conheca.aspx"><img src="Styles/img/fotobanner3.jpg" /></a>
                            </div>
                            <div class="item">
                                <a href="Conheca.aspx"><img src="Styles/img/fotobanner4.jpg" /></a>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                    </div>
                    
                </div>
            </div>
        </div>

       <div runat="server" id="divDestaques"></div>
            <%-- html --%>

        </div>
    </asp:Content>


