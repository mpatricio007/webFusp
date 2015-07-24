<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Endereco.ascx.cs" Inherits="WebFusp.Controles.Endereco" %>
                <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
   
<table class="cadastro">
<tr>
<th colspan="2">
    <asp:Label ID="lblTitulo" runat="server" Text="endereço"></asp:Label>
    </th>
</tr>
    <tr>
        <td class="esquerdo">
            logradouro:
        </td>
        <td class="direito">
           
            <asp:TextBox  ID="cTextoLogradouro" runat="server" EnableValidator="True" 
                MaxLength="50" Width="400px" />
            <asp:RequiredFieldValidator  ID="rfvLogradouro" runat="server" 
                ErrorMessage="logradouro obrigatório" 
                ControlToValidate="cTextoLogradouro" EnableTheming="False" 
                ForeColor="Red" ></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="esquerdo">
            número:
        </td>
        <td class="direito">
            <asp:TextBox  ID="cTextoNumero" runat="server" MaxLength="10" />
            <asp:RequiredFieldValidator  ID="rfvNumero" runat="server" 
                ErrorMessage="número obrigatório" ControlToValidate="cTextoNumero" 
                EnableTheming="False" ForeColor="Red" ></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="esquerdo">
            complemento</td>
        <td class="direito">
            <asp:TextBox  ID="cTextoComplemento" runat="server" MaxLength="50" 
                Width="400px" />
        </td>
    </tr>
    <tr>
        <td class="esquerdo">
            bairro:</td>
        <td class="direito">
            <asp:TextBox  ID="cTextoBairro" runat="server" MaxLength="30" Width="400px" />
            <asp:RequiredFieldValidator  ID="rfvBairro" runat="server" 
                ErrorMessage="bairro obrigatório" ControlToValidate="cTextoBairro" 
                EnableTheming="False" ForeColor="Red" ></asp:RequiredFieldValidator>
        </td>
    </tr>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
           
                                                     
    <tr>
        <td class="esquerdo">
            uf</td>
        <td class="direito">
       
            <asp:DropDownList ID="listaUF" runat="server" AppendDataBoundItems="True" 
                AutoPostBack="True" DataTextField="uf" DataValueField="uf" 
                onselectedindexchanged="listaUF_SelectedIndexChanged" Width="70px">
            </asp:DropDownList>
    
            <asp:CompareValidator ID="cvUF" runat="server" ControlToValidate="listaUF" 
                ErrorMessage="selecione um uf..." ForeColor="Red" Operator="NotEqual" 
                ValueToCompare="0" EnableTheming="False"></asp:CompareValidator>
           
         
        </td>
    </tr>
       <tr>
        <td class="esquerdo">
            cidade</td>
  
        <td class="direito">
      
            <asp:DropDownList ID="listaCidade" runat="server" AppendDataBoundItems="True" 
                DataTextField="cidade" DataValueField="cidade" Width="300px">
            </asp:DropDownList>
            <asp:ListSearchExtender ID="listaCidade_ListSearchExtender" runat="server" 
                Enabled="True" PromptCssClass="ListSearchExtenderPrompt" 
                PromptText="digite para procurar" QueryPattern="StartsWith" QueryTimeout="2000" 
                TargetControlID="listaCidade">
            </asp:ListSearchExtender>
            <asp:CompareValidator ID="cvCidade" runat="server" ControlToValidate="listaCidade" 
                ErrorMessage="selecione uma cidade..." ForeColor="Red" Operator="NotEqual" 
                ValueToCompare="0" EnableTheming="False"></asp:CompareValidator>
                        </td>
    </tr>

         </ContentTemplate></asp:UpdatePanel>
    <tr>
        <td class="esquerdo">
            cep</td><td class="direito">
            <asp:TextBox  ID="cTextoCep" runat="server" CssClass="cep" Width="80px" MaxLength="9"/>
            <asp:RequiredFieldValidator  ID="rfvCep" runat="server" onkeyup="formataCEP(this,event);"
                ErrorMessage="cep obrigatório" ControlToValidate="cTextoCep" 
                EnableTheming="False" ForeColor="Red" ></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>

        