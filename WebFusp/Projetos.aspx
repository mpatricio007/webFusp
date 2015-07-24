<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Projetos.aspx.cs" Inherits="WebFusp.Projetos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>PROJETOS</h3>
    <div class="navbar">
        <asp:CheckBox ID="ckFilter" runat="server" AutoPostBack="True" OnCheckedChanged="ckFilter_CheckedChanged"
            Text="habilitar múltiplos filtros" BorderStyle="None" EnableTheming="True" Visible="False" Checked="True" />

        <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" class="selectpicker" data-style="btn-default" data-width="60px"
            Visible="false" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged">
            <asp:ListItem Selected="True">10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
            <asp:ListItem Value="0">todos</asp:ListItem>
        </asp:DropDownList>
     
        <asp:DataList ID="DataListFiltros" runat="server" RepeatColumns="4" OnDataBinding="DataListFiltros_DataBinding"
            RepeatDirection="Horizontal" OnDeleteCommand="DataListFiltros_DeleteCommand">
            <ItemTemplate>
                <span class="span3">

                    <%# Eval("property_name") %>&nbsp
                            <%# Eval("mode_name")%>&nbsp
                            <%# Eval("value")%>
                            &nbsp
                            <asp:ImageButton ID="btExcluiFiltro" runat="server" ImageUrl="~/Styles/img/bt_delete.jpg"
                                Width="15px" Height="15px" CommandName="delete" />
                </span>
            </ItemTemplate>
        </asp:DataList>
        <div class="navbar">

            <div class="navbar-inner">
                <asp:Label ID="Label1" runat="server" Text="procurar: " CssClass="navbar-text"></asp:Label>
                <asp:DropDownList ID="ddlOptions" runat="server" CausesValidation="True" class="selectpicker" data-style="btn-default" data-width="100px"
                    AutoPostBack="True" OnSelectedIndexChanged="ddlOptions_SelectedIndexChanged">
                    <asp:ListItem Value="codigo">projeto</asp:ListItem>
                    <asp:ListItem Value="titulo">título</asp:ListItem>
                    <asp:ListItem Value="unidade_nucleo">unidade/núcleo</asp:ListItem>
                    <asp:ListItem Value="coordenadores">coordenador(es)</asp:ListItem>
                    <asp:ListItem Value="financiadores">financiador(es)</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                  <asp:DropDownList ID="ddlMode" class="selectpicker" data-style="btn-default" data-width="133px" runat="server" >
        </asp:DropDownList>
                &nbsp;<asp:TextBox ID="txtProcura" runat="server" CssClass="search-query" placeholder="Procurar" Width="137px" />
                            <%--<asp:ImageButton ID="btSearch_" runat="server" CausesValidation="false"  OnClick="btProcurar_Click" ToolTip="filtrar" ImageUrl="~/Styles/img/search-64.png" Height="34px"/>--%>
                &nbsp;<asp:Button ID="btSearch" runat="server" CausesValidation="False" CssClass="btnf" OnClick="btProcurar_Click" Text="procurar" />

                <asp:Button ID="btLimparFiltros" runat="server" Text="limpar filtros" CssClass="btnf" OnClick="btLimparFiltros_Click" />


            </div>
        </div>


        <asp:Panel ID="panelGrid" runat="server">

            <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False"
                CssClass="table-with-borderradius"
                OnPageIndexChanging="grid_PageIndexChanging" OnRowCreated="grid_RowCreated"
                OnRowEditing="grid_RowEditing" OnSorting="grid_Sorting" PageSize="50" BorderWidth="0px" Width="100%">
                <Columns>
                    <asp:BoundField DataField="codigo" HeaderText="projeto"
                        SortExpression="codigo">
                        <HeaderStyle CssClass="text-left-gv" />
                        <ItemStyle CssClass="text-right-gv" />
                    </asp:BoundField>
                    <asp:BoundField DataField="titulo" HeaderText="título"
                        SortExpression="titulo">
                        <HeaderStyle CssClass="text-left-gv" />
                        <ItemStyle CssClass="text-left-gv" />
                    </asp:BoundField>
                    <asp:BoundField DataField="unidade_nucleo" HeaderText="unidade/núcleo" SortExpression="unidade_nucleo">
                        <HeaderStyle CssClass="text-left-gv" />
                        <ItemStyle CssClass="text-left-gv" />
                    </asp:BoundField>
                    <asp:BoundField DataField="coordenadores" HeaderText="coordenador(es)" SortExpression="coordenadores">
                        <HeaderStyle CssClass="text-left-gv" />
                        <ItemStyle CssClass="text-left-gv" />
                    </asp:BoundField>
                    <asp:BoundField DataField="financiadores" HeaderText="financiador(es)" SortExpression="financiadores">
                        <HeaderStyle CssClass="text-left-gv" />
                        <ItemStyle CssClass="text-left-gv" />
                    </asp:BoundField>
                    <asp:CommandField EditText="detalhes" ShowEditButton="True">
                        <HeaderStyle CssClass="text-right-gv" />
                        <ItemStyle CssClass="text-right-gv" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel ID="panelCadastro" runat="server">
            <table class="table-with-borderradius" width="100%">
                <tr>
                    <th colspan="2" class="text-center">Detalhes do projeto
                    </th>
                </tr>
                <tr>
                    <td>projeto:
                    <asp:Label ID="txtCodigo" runat="server" Text="0" Visible="False"></asp:Label>
                    </td>
                    <td class="direito">
                        <asp:Label ID="lblProjeto" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>título:
                    </td>
                    <td class="direito">
                        <asp:Label ID="lblTitulo" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>objetivo:</td>
                    <td class="direito">
                        <asp:Label ID="lbObjetivo" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>unidade/núcleo:</td>
                    <td class="direito">
                        <asp:Label ID="lbUnidadeNucleo" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>coordenado(es):</td>
                    <td class="direito">
                        <asp:Label ID="lbCoordenadores" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>financiador(es):</td>
                    <td class="direito">
                        <asp:Label ID="lbFinanciadores" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>data de início:</td>
                    <td class="direito">
                        <asp:Label ID="lbInicio" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>data de término:</td>
                    <td class="direito">
                        <asp:Label ID="lbTermino" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>valor(es):</td>
                    <td class="direito">
                        <asp:Label ID="lbValor" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>

                    <th colspan="2" class="text-center">
                        <div id="dGravacao1" runat="server">
                            <asp:Button ID="btCancelar0" runat="server" class="btn btn-primary" CausesValidation="False" OnClick="btCancelar_Click"
                                Text="voltar" />
                        </div>
                    </th>
                </tr>
            </table>
        </asp:Panel>

    </div>
</asp:Content>
