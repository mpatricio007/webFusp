<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="bolsas.aspx.cs" Inherits="WebFusp.bolsas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <h3>PROGRAMA DE BOLSA FUSP</h3>

            <div class="tabbable tabs-left">

                <ul class="nav nav-tabs">
                    <li class="active"><a href="#Pg" data-toggle="tab">Programa de Bolsa FUSP</a></li>
                    <li><a href="#Tb" data-toggle="tab">Tabela</a></li>
                    <li><a href="#In" data-toggle="tab">Informativo</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="Pg">
                        <h4>PROGRAMA DE BOLSA FUSP </h4>

                       

                        <p>
                            O programa de bolsas instituído pela FUSP destina-se a estudantes e pesquisadores
         de ensino médio/técnico, de graduação, de pós-graduação e de pós-doutoramento, para
         desenvolverem atividades de pesquisa ou apoio técnico em projetos executados pela 
        Universidade de São Paulo e gerenciados pela FUSP, no âmbito do Convênio de Colaboração USP e FUSP.
                        </p>
                        <p>
                            As atividades desenvolvidas têm como objetivo oferecer ao aluno-bolsista uma relevante contribuição 
        à sua formação e/ou aperfeiçoamento técnico, científico e tecnológico.
                        </p>
                        <p>
                            A política adotada para o PROGRAMA DE BOLSAS DA FUSP tem como parâmetro as modalidades, níveis e valores 
        definidos pela Fundação de Amparo à Pesquisa do Estado de São Paulo – FAPESP e CNPq.
                        </p>
                        <p>As modalidade de bolsas oferecidas atualmente são:</p>

                        <p><strong>Modalidade 1</strong> - Iniciação científica - IC</p>
                        <p><strong>Modalidade 2</strong> – Mestrado - ME </p>
                        <p><strong>Modalidade 3</strong> – Doutorado - DO </p>
                        <p><strong>Modalidade 4</strong> – Pós-Doutorado - PD</p>
                        <p><strong>Modalidade 5</strong> – Treinamento Técnico - TT</p>
                        <p><strong>Modalidade 6</strong> – Desenvolvimento Tecnológico e Industrial - DTI</p>
                        <p><strong>Modalidade 7</strong> – Complementação de Bolsas FAPESP – CBF </p>
                        <p><strong>Modalidade 8</strong> – Complementação de Bolsas CAPES e CNPq - CBC</p>

                        <p><strong>Bolsas de Caráter Especial, cuja concessão está condicionada à aprovação da Diretoria Executiva:</strong></p>
                        <p><strong>Modalidade 9</strong> – Apoio Técnico Administrativo - TADM</p>
                        <p><strong>Modalidade 10</strong> – Auxílio Educacional – AE (destinada somente a funcionários contratados em Regime CLT com salário mensal de até R$ 4.000,00.)</p>

                        <p>
                            Para a concessão de bolsas, o pleito deverá ser enviado à Diretoria Executiva da FUSP pelo Coordenador do Projeto, 
        uma vez que as bolsas oferecidas por esta Fundação são custeadas por recursos financeiros do próprio projeto em que
         o bolsista estiver vinculado para desenvolver suas atividades.
                        </p>

                    </div>
                    <div class="tab-pane" id="Tb">
                        <h4>TABELA DE MODALIDADES E VALORES DE BOLSAS FUSP</h4>
                        
                        <p>
                            <iframe src="http://demonstrativo.fusp.org.br/doctos/NP08_BOL01_Tabela de Valores.pdf" width="100%" height="600" class="su-document"></iframe>
                            <em><a title="Download do regulamento" href="http://demonstrativo.fusp.org.br/doctos/NP08_BOL01_Tabela de Valores.pdf" target="_blank">Fazer download em formato PDF</a></em>
                        </p>
                    </div>

                    <div class="tab-pane" id="In">
                        <h4>INFORMATIVO</h4>
                        <p>No ano de 2012 as bolsas concedidas pela FUSP foram as seguintes:</p>
                        <table class="table table-bordered table-striped">



                            <tr>



                                <th class="text-center">Modalidade de Bolsa</th>



                                <th class="text-center">Qtde.</th>



                            </tr>



                            <tr>



                                <td>Iniciação Científica</td>

                                <td class="text-right">163</td>



                            </tr>



                            <tr>



                                <td>Mestrado</td>

                                <td class="text-right">26</td>



                            </tr>

                            <tr>



                                <td>Doutorado</td>

                                <td class="text-right">26</td>



                            </tr>


                            <tr>

                                <td>P&oacute;s-Doutorado</td>

                                <td class="text-right">19</td>

                            </tr>

                            <tr>



                                <td height="23">Treinamento Técnico</td>

                                <td class="text-right">554</td>



                            </tr>

                            <tr>



                                <td>Desenvolvimento Tecnológico e Industrial</td>

                                <td class="text-right">12</td>



                            </tr>
                            <tr>
                                <td>Complementação de Bolsas</td>
                                <td class="text-right">18</td>
                            </tr>
                            <tr>
                                <td>Apoio Técnico Administrativo</td>
                                <td class="text-right">61</td>
                            </tr>
                            <tr>
                                <td>Auxilio Educacional</td>
                                <td class="text-right">20</td>
                            </tr>
                            <tr>
                                <td>Programa de Jovens Meio Ambiente e Integração Social</td>
                                <td class="text-right">34</td>
                            </tr>
                            <tr>
                                <td>Pré;-Iniciação Científica</td>
                                <td class="text-right">245</td>
                            </tr>
                            <tr>
                                <td>Pr&eacute;-Iniciação Cientifica - monitores</td>
                                <td class="text-right">76</td>
                            </tr>
                            <tr>
                                <td>Especí­fica Petrobras</td>
                                <td class="text-right">22</td>
                            </tr>

                            <tr>



                                <th class="text-center">Total</th>

                                <th class="text-right">1.276</th>



                            </tr>



                            </tr>



                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
