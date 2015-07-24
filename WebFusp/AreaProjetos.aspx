<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="AreaProjetos.aspx.cs" Inherits="WebFusp.AreaProjetos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script type="text/javascript">
    $(function(){
        var url = document.location.toString();  
        var t = url.split('#')[1];
        $('.nav-tabs a[href=#'+t+']').tab('show');
    })
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="row-fluid" >
   <div class="span12">
        <h3>ÁREA DE PROJETOS</h3>
        <div class="tabbable tabs-left" >
            <ul class="nav nav-tabs">
                <li class="active"><a href="#lD" data-toggle="tab">Acesso ao Demonstrativo</a></li>
                <li><a href="#lA" data-toggle="tab">Apresentação da FUSP</a></li>
                <li><a href="#lB" data-toggle="tab">Projetos novos</a></li>
                <li><a href="#lC" data-toggle="tab">Projetos em andamento</a></li>
                <li><a href="#lP" data-toggle="tab">Setor de Pessoal</a></li>
                <li><a href="#Bo" data-toggle="tab">Setor de Bolsas</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="id">
                    <h4>DEMONSTRATIVO</h4>

<P>Dentro do aspecto de agilização de procedimentos, informamos que a FUSP, está disponibilizando o acesso via internet para emissão dos demonstrativos financeiros dos projetos que a FUSP vem de longa data fornecendo aos Coordenadores dos Projetos através de relatórios impressos.

</P>

<P>

Para se ter acesso ao Sistema, é necessário o cadastramento prévio dos usuários autorizados para obtenção da senha. Deverão ser tomadas as seguintes providências:

</P>

<P>

1.	o Coordenador do Projeto deverá enviar correspondência devidamente assinada à FUSP indicando o seu nome completo, o número do seu CPF e o endereço de e-mail privativo e de acesso exclusivo do Coordenador do Projeto, bem como o(s) número(s) do(s) projeto(s) sob sua coordenação;

</P>

<P>

2.	se o Coordenador do Projeto desejar permitir o acesso a outras pessoas de sua confiança, ele deverá incluir na mesma, ou em outra correspondência, os mesmos dados referentes às pessoas autorizadas, solicitando a sua habilitação;

</P>

<P>

3.	no caso de existência de mais de um projeto por Coordenador, poderão ser indicadas as mesmas ou pessoas diferentes para cada projeto;

</P>

<P>

4.	a FUSP, ao cadastrar os usuários autorizados pelo Coordenador, fará com que o Sistema gere e envie a senha automaticamente para o endereço de e-mail privativo e de uso exclusivo de cada pessoa autorizada, conforme indicado nas correspondências recebidas do Coordenador do Projeto;

</P>

<P>

5.	recomenda-se alterar a senha fornecida por outra de fácil memorização no primeiro acesso ao sistema para evitar que pessoas não autorizadas possam ter informações do Projeto; em caso de esquecimento poderá ser solicitada nova senha que será enviada automaticamente para o e-mail indicado;

</P>

<p>

6.	sempre que se abrir um novo projeto, o seu Coordenador deverá realizar o mesmo processo em relação ao novo projeto, fornecendo os mesmos dados das pessoas autorizadas (nome completo, número do CPF e e-mail pessoal e privativo);

</P>

<p><a href="http://demonstrativo.fusp.org.br" target="_blank">Clique Aqui Para Acessar o Demonstrativo Financeiro </a><br/>
    
</p>


            </div>
                <div class="tab-pane" id="lA">
                    <h4>APRESENTAÇÃO</h4>
                      <ul>

                    <li><a href="http://fusp.org.br/lerarquivo.php?nomea=AA0_O_que_e_a_FUSP.pdf" target="_blank">O que é a FUSP</a></li>

                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP01_REG01_Esclarecimentos_NPs.pdf" target="_blank">Esclarecimentos sobre Normas e Procedimentos FUSP (NPs)_NP01_REG01</a></li><b></b>

                    </ul>
                </div>
                <div class="tab-pane" id="lB">
                    <h4>INSTRUÇÕES PARA ABERTURA DE PROJETO</h4>
                    <ul>

                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP02_INFUSP01_Como%20Elaborar%20Proposta_IN01.pdf" target="_blank">Como Elaborar Propostas/Orçamentos de Projetos NP02_INFUSP01_IN01</a></li>
                        <br/>
                            <li><b>NP03_Tabelas Consultas</b></li><br/>

                                <ul>

                                    <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP03_TAB02_%20CERT_credenciamento_IN01.pdf" target="_blank">CERT credenciamento_NP03_TAB02</a></li>




                                </ul>

                            <br/>

                            <li><b>NP04_Abertura de Projetos</b></li><br/>

                                <ul>

                                    <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A00_Procedimentos_Abertura%20de%20Projetos_IN01.pdf" target="_blank">Procedimentos de Abertura de Projetos_NP04_A00</a></li>

                                        <ul>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A01_Solicita%E7%E3o_de_Abertura_de_Projeto.doc" target="_blank">Solicitação de Abertura de Projeto_NP04_A01</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A02_Acordo%20de%20Trabalho_IN02.doc" target="_blank">Acordo de Trabalho_NP04_A02</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A03_Termo%20de%20Gerenciamento.doc" target="_blank">Termo de Compromisso de Gerenciamento de Projeto NP04_A03</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A04_Descri%E7%E3o_Sucinta_do_Projeto_IN02.doc" target="_blank">Descrição Sucinta do Projeto_NP04_A04</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A05_Controle_Financeiro_de_Projetos_IN02.doc" target="_blank">Controle Financeiro de Projeto_NP04_A05</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A06_Cartao_de_Assinaturas_IN02.doc" target="_blank">Cartão de Assinaturas_NP04_A06</a></li>

                                            <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP04_A07_Cadastro%20Projetos_IN01.doc" target="_blank">Cadastro de Projeto_NP04_A07</a></li>

                                        </ul>

                                </ul><br/>
                        <li><b>NP10_Abertura de Projetos de Cursos</b></li><br/>

                                <ul>

                                    <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP10_C00_Abertura_Projetos%20de%20Cursos.pdf" target="_blank">Procedimentos de Abertura de Projetos de Cursos NP10_C00</a></li>


                </div>
                <div class="tab-pane" id="lC">
                    <h4>PROCEDIMENTOS</h4>
                 <ul>

                     <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP02_INFUSP02_Obten%E7%E3o_de_Senha_IN01.doc" target="_blank">Obtenção de Senha</a></li>

                     <li><a href="http://fusp.org.br/lerarquivo.php?nomea=NP02_INFUSP00_Procedimentos_Adm_IN01.pdf" target="_blank">Procedimentos_Administrativos_NP02_INFUSP00</a></li>
			         <li><a href="http://fusp.org.br/lerarquivo.php?nomea=Formulario_Cadastro.doc" target="_blank">Atualização dados Cadastrais</a></li>   
                     <ul>
				              <li><a href="http://fusp.org.br/lerarquivo.php?nomea=Vademecum_AMAM-29nov.pdf" target="_blank">Vademecum</a></li>
			</ul>
                </ul>

                </div>
                
                <div class="tab-pane" id="lP">
                    <h4>SETOR DE PESSOAL</h4>

<p>Esta área destina-se a auxiliar os coordenadores de projetos no envio de alguns formulários

pertinentes ao setor de pessoal da FUSP.</p>

<h5>Boletim de Frequencia</h5>

<p>O projeto que possuir funcionários em regime CLT deverá encaminhar até o dia 25 de cada mês o Boletim de Frequência de cada um,

devidamente preenchido e assinado.

</p>

<p>Clique no Boletim de Frequencia do mês desejado e faça a sua impressão</p>

  <ul>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=1&ano=2014 target="_blank" >Janeiro/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=2&ano=2014 target="_blank" >Fevereiro/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=3&ano=2014 target="_blank" >Marco/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=4&ano=2014 target="_blank" >Abril/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=5&ano=2014 target="_blank" >Maio/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=6&ano=2014 target="_blank" >Junho/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=7&ano=2014 target="_blank" >Julho/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=8&ano=2014 target="_blank" >Agosto/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=9&ano=2014 target="_blank" >Setembro/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=10&ano=2014 target="_blank" >Outubro/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=11&ano=2014 target="_blank" >Novembro/2014</a></li>
      <li><a href=http://www.fusp.org.br/imprimirbf.php?mes=12&ano=2014 target="_blank" >Dezembro/2014</a></li>
  </ul>





</div>
                <div class="tab-pane" id="Bo">
                    <h4>CONCESSÃO DE BOLSAS</h4>
                    <p>Para a concessão de bolsas, o pleito deverá ser enviado à Diretoria Executiva 
                    da FUSP pelo Coordenador do Projeto, uma vez que as bolsas oferecidas por esta Fundação
                     são custeadas por recursos financeiros do próprio projeto em que o bolsista estiver vinculado
                     para desenvolver suas atividades.</p>

                     <p>Antes da contratação do bolsista, o Coordenador do Projeto deverá consultar previamente a sua
                        viabilidade junto ao Setor de Bolsas da FUSP, utilizando o <a href="http://demonstrativo.fusp.org.br/lerarquivo.php?nomea=NP08_BOL02_Consulta_Previa_Concessao_de_Bolsas_IN01.pdf" target="_blank">formulário Consulta Prévia_Concessão
                          de Bolsas</a></p>

                     <p>As modalidades e suas descrições, bem como duração e requisitos estão detalhadamente dispostos 
                         na <a href="http://demonstrativo.fusp.org.br/lerarquivo.php?nomea=NP08_BOL00_Programa%20de%20Bolsas_Instru%E7%F5es%20Gerais.pdf" target="_blank">NP08_BOL00_PROGRAMA DE BOLSAS FUSP.</a> </p>
                </div>
                
                </div> <!-- /tabbable -->
            </div>
       </div>
    </div> 
    
</asp:Content>
