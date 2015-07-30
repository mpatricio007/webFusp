<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLic.master" AutoEventWireup="true" CodeBehind="InscricaoPregoes.aspx.cs" Inherits="WebFusp.InscricaoPregoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
      <div class="conteudo">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <h3>Cadastre-se para participar do Pregão</h3>

                <p align="left"><strong>ATENÇÂO:</strong> O preenchimento do formulário é obrigatório e a veracidade das informações prestadas </p>
                <p align="left">é muito importante para que possamos manter o cadastro e o contato com a sua empresa.</p>

                <p class="error" align="left">Os campos marcados com * são de preenchimento obrigatório</p>
                <asp:Panel ID="panelCadastro" runat="server" Visible="true">
                    <table class="cadastro">
                        <tr>
                            <td ><span class="error">*</span> tipo:<asp:Label ID="txtCodigo" runat="server" Text="0" Visible="False"></asp:Label>
                            </td>
                            <td class="direito">
                                <asp:RadioButtonList ID="rbTipo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbTipo_SelectedIndexChanged" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="Pessoa_Fisica">Pessoa Física</asp:ListItem>
                                    <asp:ListItem Value="Pessoa_Juridica">Pessoa Jurídica</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rbTipo" ErrorMessage="campo obrigatório!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <asp:Panel ID="divPessoaJuridica" runat="server">
                            <tr>
                                <td class="esquerdo">cnpj:
                                </td>
                                <td class="direito">
                                    <cCnpj:cCNPJ ID="cCNPJ2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="esquerdo"><span class="error">*</span> razão social:</td>
                                <td class="direito">
                                    <ctx:cTexto ID="cTextoRazaoSocial" runat="server" MaxLength="150" Width="500px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="esquerdo"><span class="error">*</span> nome fantasia:</td>
                                <td class="direito">
                                    <ctx:cTexto ID="cTextoNomeFantasia" runat="server" MaxLength="150" Width="500px" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="divPessoaFisica" runat="server">
                            <tr>
                                <td class="esquerdo">cpf:</td>

                                <td class="direito">
                                    <cCpf:cCPF ID="cCPF" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="esquerdo"><span class="error">*</span> nome responsável:</td>
                                <td class="direito">
                                    <ctx:cTexto ID="cTextoNome" runat="server" MaxLength="200" Width="500px" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td colspan="2">
                                <span class="error">*</span>
                                <cender:cEnder ID="cEnder1" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td class="esquerdo">telefone comercial:</td>
                            <td class="direito">
                                <span class="error">
                                    <asp:TextBox ID="cTelComercial" runat="server" MaxLength="11" Width="150px" CssClass="telefone"></asp:TextBox>
                                </span>Formato: (99) 9-9999-9999
                            </td>
                        </tr>
                        <tr>
                            <td class="esquerdo">telefone residencial:</td>
                            <td class="direito">
                                <span class="error">
                                    <asp:TextBox ID="cTelResidencial" runat="server" MaxLength="11" Width="150px" CssClass="telefone"></asp:TextBox>
                                </span>Formato: (99) 9-9999-9999
                            </td>
                        </tr>
                        <tr>
                            <td class="esquerdo">celular:</td>
                            <td class="direito">
                                <span class="error">
                                    <asp:TextBox ID="cTelCelular" runat="server" MaxLength="11" Width="150px" CssClass="telefone"></asp:TextBox>
                                </span>Formato: (99) 9-9999-9999
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>
                                    <strong>OBS:</strong> Atenção ao digitar um endereço de e-mail.
                                </p>
                                <p>
                                    Ele será usado para o envio de nova senha, em caso de esquecimento.
                                </p>
                                <p>
                                    Por favor, evite usar e-mails pessoais, dê preferência a e-mails insitucionais.
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><span class="error">*</span> e-mail:</td>
                            <td class="auto-style2"><%--<cListaemails:cListaEmails ID="cEmail" runat="server" />--%>
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" TextMode="Email" Width="350px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="e-mail obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rex" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidateRequestMode="Enabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">e-mail inválido</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtConfirmaEmail" ControlToValidate="txtEmail" ErrorMessage="E-mails não correspondem!" ForeColor="Red"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><span class="error">*</span> confirmar e-mail:</td>
                            <td class="direito"><%--<cListaemails:cListaEmails ID="cConfirmarEmail" runat="server" />--%>
                                <asp:TextBox ID="txtConfirmaEmail" runat="server" MaxLength="100" TextMode="Email" Width="350px"></asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="rex0" runat="server" ControlToValidate="txtConfirmaEmail" ForeColor="Red" ValidateRequestMode="Enabled" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">e-mail inválido</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><span class="error">*</span> senha:</td>
                            <td class="direito">
                                <asp:TextBox ID="txtSenha" runat="server" MaxLength="100" TextMode="Password"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSenha" ErrorMessage="senha obrigatória" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfirmarSenha" ControlToValidate="txtSenha" ErrorMessage="Senhas inválidas!" ForeColor="Red"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td ><span class="error">*</span> confirmar senha:</td>
                            <td class="direito">
                                <asp:TextBox ID="txtConfirmarSenha" runat="server" MaxLength="100" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <th colspan="2">
                                <div id="dGravacao1" runat="server">
                                    <asp:Button class="btn btn-large btn-primary" ID="btSalvar" runat="server" OnClick="btSalvar_Click" Text="salvar"/>
                                    &nbsp;<asp:Label ID="lblMsg" runat="server" Visible="true"></asp:Label>
                                    &nbsp;</div>
                            </th>
                        </tr>
                        
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <ajaxToolkit:UpdatePanelAnimationExtender ID="upae" BehaviorID="animation" runat="server" TargetControlID="UpdatePanel1" Enabled="True">
            <Animations>
            <OnUpdating>
                <Parallel duration="0">
                    <FadeOut minimumOpacity=".5" />
                       <ScriptAction Script="waitingDialog({});" />  
                 </Parallel>
            </OnUpdating>
            <OnUpdated>
                <Parallel duration="0">
                   <FadeIn minimumOpacity=".5" />  
                     <ScriptAction Script="closeWaitingDialog()" /> 
                </Parallel> 
            </OnUpdated>
            </Animations>
        </ajaxToolkit:UpdatePanelAnimationExtender>
    </div>
</asp:Content>
