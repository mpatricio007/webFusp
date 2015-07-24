<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="contato.aspx.cs" Inherits="WebFusp.contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function openDialog() {
            var dlg = $("#modalMsg").dialog({
                position: 'middle',
                modal: true,
                title: 'envio de e-mail'
            });
            dlg.parent().appendTo(jQuery("form:first"));
            $("#modalMsg").dialog("open");
        }

        function closeDialog() {
            $("#modalMsg").dialog("close");
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>









    <h3>CONTATO FUSP</h3>
    <div class="hero-unit">
        <div class="row-fluid">
            <div class="span4">

                <p>
                    <address>
                        <strong>
                            <h4>FUSP</h4>
                        </strong>
                        <h5>ENDEREÇO</h5>

                        Av. Afrânio Peixoto, 14 - Butantã 
                        <br />
                        São Paulo, SP - Brasil<br />



                        <strong>
                            <h5>
                            TELEFONES</strong></h5>
                            
                            Telefone: 55 11 3035-0550 / 3091-4289<br />
                        Fax: 55 11 3035-0580<br />
                        <br />
                        <br />


                        <strong>
                            <h4>FUSP - Seguro Saúde</h4>
                        </strong>

                        <strong>
                            <h5>
                            ENDEREÇO</strong></h5>
                            Rua Alvarenga, 1972 - Butantã <br />

                        São Paulo, SP - Brasil<br />

                        <strong>
                            <h5>TELEFONES</h5>
                        </strong>

                        Telefone: 55 11 3816-0250 
                    / 3032-7993<br />
                        <br />

                    </address>
                </p>
            </div>
            <div class="span8">
                <table class="table-bordered" width="700">
                    <tr>
                        <td>
                            <h4>MAPA DA LOCALIZAÇÃO</h4>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m29!1m12!1m3!1d3657.0922114583923!2d-46.71409351978724!3d-23.565131468211142!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m14!1i0!3e6!4m5!1s0x94ce565279ccf243%3A0x49c4a04a0ea0c02!2sAvenida+Afr%C3%A2nio+Peixoto%2C+14+-+Butant%C3%A3%2C+SP%2C+Brasil!3m2!1d-23.5656631!2d-46.7121582!4m5!1s0x94ce564d9db4905d%3A0xe282db62b93978d5!2sRua+Alvarenga%2C+1972+-+Butant%C3%A3%2C+SP%2C+05509-005%2C+Brasil!3m2!1d-23.5645526!2d-46.711737299999996!5e0!3m2!1spt-BR!2sus!4v1398278627988" width="680" height="350" frameborder="0" style="border:0"></iframe>
                            <br />
                            
                            


                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div class="row-fluid">

        <table class="table-bordered" width="100%">
            <tr>
                <td colspan="2">
                    <h4>ENTRE EM CONTATO</h4>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Nome</label>
                    <input type="text" placeholder="digite o seu nome…" runat="server" id="txtNome" style="width: 300px;" />
                    &nbsp;<label>E-mail</label>
                    <input type="text" placeholder="digite o seu e-mail…" runat="server" id="txtEmail" style="width: 300px;" />
                    <label>Assunto</label>
                    <input type="text" placeholder="digite o assunto…" runat="server" id="txtAssunto" style="width: 300px;" />
                </td>
                <td>
                    <label>Mensagem</label>
                    <textarea type="text" placeholder="digite a mensagem…" runat="server" id="txtBody" style="width: 400px; height: 200px"></textarea><br />

                    <asp:Button ID="btEnviar" class="btn btn-primary" runat="server" Text="Enviar" OnClick="btEnviar_Click" />
                    <asp:Label ID="lbMsg" runat="server"></asp:Label><br />
                </td>
            </tr>
        </table>
        <br />

    </div>








</asp:Content>
