<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLic.master" AutoEventWireup="true" CodeBehind="licitacao.aspx.cs" Inherits="WebFusp.licitacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show', function (e) {
                $("#<%= txtTabIndex.ClientID %>").val(String($(e.target).attr("id")));
                $("#<%= btTabSelect.ClientID %>").click();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <%--<asp:UpdatePanel ID="upAbas" runat="server">
        <ContentTemplate>--%>
          <input type="text" id="hfSelectedTAB" value="0" style="display:none;" />
       
      <div id="dAbaConfig" style="display: none">
                <asp:TextBox ID="txtTabIndex" runat="server"></asp:TextBox>
                <asp:Button ID="btTabSelect" runat="server" CausesValidation="false" OnClick="btTabSelect_Click" />
            </div>
    <h3>EDITAIS</h3>

    <div class="tabbable tabs-left" id="abas" runat="server">
        <ul class="nav nav-tabs" id="ulAbas" runat="server">
        </ul>
        <div class="tab-content">
        <div class="tab-pane active" id="aba">
            <asp:DataList ID="dlEditais" runat="server" Width="60%" DataKeyField="id_edital_lic">
                <ItemTemplate>
                    <table cellspacing="0">
                        <tr>
                            <td>
                                <center>
                                    <h4>
                                        <asp:Label ID="lbTitulo" runat="server" Text='<%# Bind("titulo") %>'></asp:Label></h4>

                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <p align="justify">
                                    <asp:Label ID="lbDescricao" runat="server" Text='<%# Bind("descricao") %>'></asp:Label>
                                </p>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>
                                    <asp:Label ID="lbData" runat="server" Text='<%# Bind("data","São Paulo, {0:dd} de {0:MMMM} de {0:yyyy}")%>'></asp:Label></center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <center>Comissão de Licitação</center>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:DataList ID="dlAnexos" runat="server" Width="100%" ShowHeader="true">
                                    <HeaderTemplate>
                                        <asp:Label ID="lbTituloAnexo" runat="server" Text="OUTRAS INFORMAÇÕES"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>                                        
                                        <asp:LinkButton ID="lkAnexo" runat="server" OnClick="lkAnexo_Click" Text='<%# Bind("descricao") %>' CommandArgument='<%# Bind("id_edital_lic_anexo") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
            </div>
    </div>
<%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
