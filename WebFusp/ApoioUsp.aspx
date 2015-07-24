<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ApoioUsp.aspx.cs" Inherits="ApoioUsp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">


                <h3>RECURSOS RECEBIDOS PELA FUSP PARA PROJETOS DA USP</h3>


                <asp:GridView ID="dgvUsers" runat="server"
                    CssClass="table-with-borderradius" GridLines="None"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="Username" HeaderText="Username" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>

                <table class="table-with-borderradius">


                    <tr>

                        <th>DESCRI&Ccedil;&Atilde;O </th>

                        <th class="text-center">2007 </th>
                        <th class="text-center">2008 </th>
                        <th class="text-center">2009 </th>
                        <th class="text-center">2010</th>
                        <th class="text-center">2011</th>
                        <th class="text-center">2012</th>
                        <th class="text-center">2013</th>
                        <th class="text-center">TOTAL</th>

                    </tr>

                    <tr>

                        <td>Petrobr&aacute;s </td>
                        <td class="text-right">10.163.606</td>
                        <td class="text-right">22.485.039</td>
                        <td class="text-right">15.200.547</td>
                        <td class="text-right">26.498.885</td>
                        <td class="text-right">20.314.135</td>
                        <td class="text-right">14.956.696</td>
                        
                        <td class="text-right">20.737.802</td>
                        <td class="text-right">130.356.710</td>

                    </tr>

                    <tr>

                        <td>Petrobr&aacute;s - Rede Tem&aacute;tica </td>

                        <td class="text-right">7.462.498</td>
                        <td class="text-right">7.219.117</td>
                        <td class="text-right">5.276.336</td>
                        <td class="text-right">3.919.171</td>
                        <td class="text-right">1.431.711</td>
                        <td class="text-right">770.682</td>

                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">26.079.515</td>

                    </tr>

                    <tr>

                        <td>FINEP </td>

                        <td class="text-right">5.866.377</td>
                        <td class="text-right">3.461.881</td>
                        <td class="text-right">8.102.616</td>
                        <td class="text-right">10.501.438</td>
                        <td class="text-right">14.152.958</td>
                        <td class="text-right">17.088.698</td>

                        <td class="text-right">14.059.800</td>
                        <td class="text-right">73.233.768</td>

                    </tr>

                    <tr>

                        <td>CNPq </td>

                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">539.074</td>
                        <td class="text-right">2.324.081</td>
                        <td class="text-right">1.132.566</td>
                        <td class="text-right">&nbsp;</td>

                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">3.995.720</td>
                    </tr>

                    <tr>

                        <td>Apoio e Patroc&iacute;nio </td>

                        <td class="text-right">3.390.953</td>
                        <td class="text-right">3.998.482</td>
                        <td class="text-right">4.268.111</td>
                        <td class="text-right">1.729.201</td>
                        <td class="text-right">4.088.498</td>
                        <td class="text-right">2.775.258</td>

                        <td class="text-right">3.059.541</td>
                        <td class="text-right">23.310.044</td>
                    </tr>

                    <tr>

                        <td>Empresas de Energia El&eacute;trica </td>

                        <td class="text-right">5.146.136</td>
                        <td class="text-right">4.393.236</td>
                        <td class="text-right">4.427.969</td>
                        <td class="text-right">3.538.986</td>
                        <td class="text-right">7.051.914</td>
                        <td class="text-right">6.025.563</td>

                        <td class="text-right">10.414.537</td>
                        <td class="text-right">40.998.341</td>
                    </tr>

                    <tr>

                        <td>&Oacute;rg&atilde;os de Governos Estaduais </td>

                        <td class="text-right">2.929.410</td>
                        <td class="text-right">3.921.875</td>
                        <td class="text-right">6.138.777</td>
                        <td class="text-right">11.545.851</td>
                        <td class="text-right">16.321.470</td>
                        <td class="text-right">14.660.680</td>

                        <td class="text-right">15.452.647</td>
                        <td class="text-right">70.970.710</td>
                    </tr>

                    <tr>

                        <td>Institui&ccedil;&otilde;es Estrangeiras </td>

                        <td class="text-right">5.246.887</td>
                        <td class="text-right">2.468.073</td>
                        <td class="text-right">2.213.871</td>
                        <td class="text-right">4.673.713</td>
                        <td class="text-right">2.905.114</td>
                        <td class="text-right">13.678.404</td>

                        <td class="text-right">4.340.380</td>
                        <td class="text-right">35.526.442</td>
                    </tr>

                    <tr>

                        <td>&Oacute;rg&atilde;os do Governo Federal </td>

                        <td class="text-right">2.225.234</td>
                        <td class="text-right">2.091.340</td>
                        <td class="text-right">2.615.333</td>
                        <td class="text-right">6.894.369</td>
                        <td class="text-right">1.287.025</td>
                        <td class="text-right">2.667.367</td>
                        <td class="text-right">3.841.354</td>
                        <td class="text-right">21.622.022</td>
                    </tr>

                    <tr>

                        <td>BNDES </td>

                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">1.780.000</td>
                        <td class="text-right">9.189.792</td>
                        <td class="text-right">17.181.497</td>

                        <td class="text-right">6.205.560</td>
                        <td class="text-right">34.356.849</td>
                    </tr>

                    <tr>

                        <td>&Oacute;rg&atilde;os de Governos Municipais </td>

                        <td class="text-right">944.121</td>
                        <td class="text-right">1.479.233</td>
                        <td class="text-right">702.059</td>
                        <td class="text-right">1.427.039</td>
                        <td class="text-right">4.225.672</td>
                        <td class="text-right">5.467.073</td>

                        <td class="text-right">1.982.063</td>
                        <td class="text-right">16.227.260</td>
                    </tr>

                    <tr>

                        <td>Projetos Culturais </td>

                        <td class="text-right">2.634.488</td>
                        <td class="text-right">8.114.350</td>
                        <td class="text-right">1.169.689</td>
                        <td class="text-right">2.550.000</td>
                        <td class="text-right">100.000</td>
                        <td class="text-right">4.772.000</td>

                        <td class="text-right">&nbsp;</td>
                        <td class="text-right">19.340.527</td>
                    </tr>

                    <tr>

                        <td>Diversas Empresas </td>

                        <td class="text-right">10.527.863</td>
                        <td class="text-right">13.354.544</td>
                        <td class="text-right">21.124.024</td>
                        <td class="text-right">22.934.492</td>
                        <td class="text-right">26.023.777</td>
                        <td class="text-right">25.666.744</td>

                        <td class="text-right">29.118.709</td>
                        <td class="text-right">148.750.153</td>
                    </tr>

                    <tr>

                        <td>Eventos e Treinamentos </td>

                        <td class="text-right">6.044.092</td>
                        <td class="text-right">10.179.460</td>
                        <td class="text-right">7.187.566</td>
                        <td class="text-right">14.224.983</td>
                        <td class="text-right">17.613.062</td>
                        <td class="text-right">21.661.314</td>

                        <td class="text-right">18.788.453</td>
                        <td class="text-right">95.698.930</td>
                    </tr>

                   

                    <tr>

                        <th>Total </th>

                        <th class="text-right">62.581.664</th>
                        <th class="text-right">83.166.629</th>
                        <th class="text-right">78.965.971</th>
                        <th class="text-right">114.542.209</th>
                        <th class="text-right">125.837.693</th>
                        <th class="text-right">147.371.976</th>
                        <th class="text-right">128.000.847</th>
                        <th class="text-right">740.466.993</th>
                    </tr>

                </table>

            </div>
        </div>
    </div>

</asp:Content>

