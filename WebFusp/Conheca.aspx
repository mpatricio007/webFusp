<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Conheca.aspx.cs" Inherits="WebFusp.Conheca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- DIRETORIA -->
    <div id="mdDiretoria" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>DIRETORIA</h3>
        </div>
        <div class="modal-body">


            <p><strong>DIRETOR EXECUTIVO</strong></p>
            <p>José Roberto Cardoso, 2014</p>
            <p>Antonio Marcos de Aguirra Massola, 1992/2014</p>

            <p><strong>DIRETOR FINANCEIRO</strong> </p>
            <p>Rudinei Toneto Junior, 2014</p>
            <p>Rubens Famá, 2000/2014</p>
            <p>Cicely Moitinho Amaral, 1992/2000 </p>

            <p><strong>DIRETOR ADJUNTO</strong></p>
            <p>vago desde 11/02/2014</p>
            <p>José Sidnei Colombo Martini, 2011/2014</p>

            <p><strong>DIRETOR VOGAL</strong></p>
            <p>Dante Pinheiro Martinelli, 2007/2011</p>
            <p>Douglas Wagner Franco, 2006/2007</p>
            <p>Adilson Carvalho, 2003/2006</p>
            <p>Hélio Nogueira da Cruz, 1997/2003</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
        </div>
    </div>

    <div id="mdConsCurador" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>CONSELHO CURADOR</h3>
        </div>
        <div class="modal-body">
            <h5>Presidente</h5>
            <p>Marco Antonio Zago, 2014/</p>
           
            <h5>Membros</h5>
              <p>Antonio Roque Dechen (CO), 2009/ </p>
              <p>Diná de Almeida Lopes Monteiro da Cruz (CO), 2013/</p>
              <p>Geraldo Roberto Martins, 2014/</p>
              <p>Gerson Aparecido Yukio Tomanari, 2014/</p>


            <p>José Eduardo Krieger, 2014/</p>        
            <p>José Roberto Drugowich de Felício, 2014/</p>
            <p>Maria Arminda do Nascimento Arruda, 2010/</p>
          
            <br />
          
            <h4>GESTÕES ANTERIORES</h4>

               <p>Adolpho José Melfi, 2001/2005</p>
               <p>Adilson Avansi de Abreu, 1998/2005                       </p>
               <p>Antonio Junqueira de Azevedo, 1992/2000 - 2005/2010      </p>
               <p>Belmiro Mendes de Castro Filho, 2002/2005                </p>
               <p>Carlos Alberto Barbosa Dantas, 1992/2000                 </p>
               <p>Carlos de Paula Eduardo, 2010/2014                       </p>
               <p>Celso de Barros Gomes, 1996/2001                         </p>
               <p>Dalmo de Souza Amorim, 1992/1995                         </p>
               <p>Eliseu Martins, 2006/2008                                </p>
               <p>Erney Felício Plessmann de Camargo, 1992/1993            </p>
               <p>Flávio Fava de Moraes, 1994/1997                         </p>
               <p>Francisco Antonio Rocco Lahr, 2003/2009                  </p>
               <p>Franco Maria Lajolo, 2009/2010                           </p>
               <p>Fúlvio José Carlos Pillegi, 1992/1993                    </p>
               <p>Guilherme Ary Plonski, 1996/2001                         </p>
               <p>Hans Viertler, 2009/2010                                 </p>
               <p>Hélio Mattar, 2006/2009                                  </p>
               <p>Hélio Nogueira da Cruz, 1992/1997                        </p>
               <p>Hernan Chaimovich Guralnik, 1997/2001                    </p>
               <p>Holmer Savastano Junior, 2004/2008 - 2009/2010           </p>
               <p>Hugo Aguirre Armelin, 1994/1997                          </p>
               <p>Isília Aparecida Silva, 2010/2014                        </p>
               <p>Ivette Senise Ferreira, 2000/2004                        </p>
               <p>Jacques Marcovitch, 1997/2001                            </p>
               <p>João Grandino Rodas, 2010/2014                           </p>
               <p>João Lúcio de Azevedo, 1994/1994                         </p>
               <p>Joaquim José de Camargo Engler, 1995/2014                </p>
               <p>José Antunes Rodrigues 1996/2003                         </p>
               <p>José Carlos Pereira (CO), 2013/2014</p>
               <p>Jurandyr Povinelli, 2000/2003                            </p>
               <p>Luis Carlos de Menezes, 1992/1993                        </p>
               <p>Luiz Nunes de Oliveira, 2002/2005                        </p>               
               <p>Mayana Zatz, 2006/2010                                   </p>
               <p>Milton Almeida dos Santos, 1994/1998                     </p>
               <p>Renato Janine Ribeiro, 1992/1993                         </p>
               <p>Ricardo Toledo Silva, 2010/2013                          </p>
               <p>Roberto Leal Lobo e Silva Filho, 1992/1993               </p>
               <p>Ruy Alberto Corrêa Altafim, 2008/2010                    </p>
               <p>Ruy Laurenti, 1993/1993                                  </p>
               <p>Sedi Hirano, 2006/2008                                   </p>
               <p>Suely Vilela, 2005/2009                                  </p>
               <p>Wilson Teixeira, 2002/2005                               </p>

        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
        </div>
    </div>

    <!-- CONSELHO FISCAL -->
    <div id="mdConsFiscal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>CONSELHO FISCAL</h3>
        </div>
        <div class="modal-body">

            <p>Alberto Borges Maia, 2014 </p>
            <p>Antonio Evaldo Comune, 2010 </p>
            <p>Reinaldo Guerreiro, 2012 </p>
            <h4>GESTÕES ANTERIORES</h4>

            <p>Hermes Marcelo Huck, 2004/2008 </p>
            <p>Eliseu Martins, 2004/2006 - 2008/2012</p>
            <p>Iran Siqueira Lima, Presidente - 2006/2010 </p>
            <p>Geraldo Francisco Burani, 2008/2012</p>
            <p>Sigismundo Bialoskorski Neto, 2012/2014</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
        </div>
    </div>

    <div id="mdUtilPublica" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>UTILIDADE PÚBLICA</h3>
        </div>
        <div class="modal-body">



            <h4>MUNICIPAL</h4>

            <p>A FUSP, através do Decreto nº 42.450 de 27 de Setembro de 2002, publicado no Diário Oficial do Município de São Paulo em 28/09/2002, foi declarada Entidade de Utilidade Pública Municipal.</p>

            <h4>ESTADUAL</h4>

            <p>A FUSP, através do Decreto nº 47.132 de 25 de Setembro de 2002, publicado no Diário Oficial do Estado de São Paulo em 26/09/2002, foi declarada Entidade de Utilidade Pública Estadual.</p>

            <h4>FEDERAL</h4>

            <p>A FUSP, através da Portaria nº 1276 de 9 de Outubro de 2002 do Ministério da Justiça, publicada no Diário Oficial da União em 10/10/2002, foi declarada Entidade de Utilidade Pública Federal.</p>

            <p>Para consultar no site do Ministério da Justiça as entidades de utilidade pública federal <a href="http://portal.mj.gov.br/data/Pages/MJ4268993FPTBRIE.htm" target="_blank">clique aqui</a></p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">

            <div class="hero-unit">
                <h3>O QUE É A FUSP</h3>
                <p><strong>A Fundação de Apoio à Universidade de São Paulo - FUSP</strong> é uma entidade sem fins lucrativos que foi criada com o principal objetivo de flexibilizar, agilizar e contribuir para a eficiência das atividades da Universidade de São Paulo. Foi planejada desde o início com o compromisso de apoiar e dar suporte gerencial aos Institutos, Escolas, Núcleos de Apoio e Órgãos da Universidade, propiciando uma facilidade mais ampla na execução de projetos de interesse da USP.</p>
                <p>
                    <a class="btn btn-large btn-primary" href="oqueafusp.aspx">Detalhes »</a>
                    <a class="btn btn-large btn-primary" href="ConhecaParaImpressao.aspx">Imprimir&nbsp<i class="icon-print icon-white"></i></a>
                </p>


            </div>
        </div>
    </div>








    <div class="row-fluid">
        <div class="span4">
            <h4>DIRETORIA
            </h4>
            <p>
                A Diretoria, composta por três diretores, é responsável pelas diretrizes e políticas da FUSP, aprovadas pelo Conselho Curador. 
            </p>
            <p>
                <a href="#mdDiretoria" role="button" class="btn" data-toggle="modal">Membros »</a>
            </p>
        </div>


        <div class="span4">
            <h4>CONSELHO CURADOR
            </h4>
            <p>
                O conselho curador, presidido pelo Magnífico Reitor da Universidade de São Paulo, é responsável pela aprovação e acompanhamento das atividades da FUSP. 
            </p>
            <p>
                <a href="#mdConsCurador" role="button" class="btn" data-toggle="modal">Membros »</a>
            </p>
        </div>

        <div class="span4">
            <h4>CONSELHO FISCAL
            </h4>
            <p>
                O Conselho Fiscal é responsável pela fiscalização dos atos dos administradores e cumprimento de seus deveres legais e estatutários.
            </p>
            <p>
                <a href="#mdConsFiscal" role="button" class="btn" data-toggle="modal">Membros »</a>
            </p>
        </div>
    </div>

    <!-- FIM CONSELHO FISCAL -->


    <div class="row-fluid">
        <div class="span4">
            <h4>HISTÓRICO
            </h4>
            <p>
                No dia 20 de Julho 1992 foi lavrada a escritura pública de sua instituição
            </p>
            <p>
                <a class="btn" href="historico.aspx">Detalhes »</a>
            </p>
        </div>

        <!-- FIM DIRETORIA -->
        <!-- CONSELHO CURADOR -->


        <div class="span4">
            <h4>UTILIDADE PÚBLICA
            </h4>
            <p>
                A FUSP é reconhecida pelo governo pelos serviços prestados à sociedade possuindo títulos de utilidade Pública Federal, Estadual e Municipal.
            </p>
            <p>
                <a href="#mdUtilPublica" role="button" class="btn " data-toggle="modal">Detalhes »</a>
            </p>
        </div>

        <!-- FIM CONSELHO CURADOR -->

        <div class="span4">
            <h4>LOCALIZAÇÃO
            </h4>
            <p>
                Av. Afrânio Peixoto, 14 Butanta - São Paulo - SP
            </p>
            <p>
                <a class="btn" href="contato.aspx">Detalhes »</a>
            </p>
        </div>
    </div>


</asp:Content>
