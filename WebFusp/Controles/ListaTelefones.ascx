<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListaTelefones.ascx.cs" Inherits="WebFusp.Controles.ListaTelefones" %>




<cTel:cTel ID="cTel1" runat="server" ValidationGroup="telefone" />




<asp:Button ID="btAdd" runat="server" onclick="btAdd_Click" Text="salvar" 
    ValidationGroup="telefone" Width="80px" />
<asp:Button ID="btExcluir" runat="server" onclick="btExcluir_Click" 
    Text="excluir"  ValidationGroup="telefone" Width="80px" />



<asp:Button ID="btCancel" runat="server" onclick="btCancel_Click" 
    Text="cancelar" CausesValidation="False" Width="80px" />
<asp:Label ID="txtId" runat="server" Text="-1" Visible="False"></asp:Label>



&nbsp;<p>
    <asp:GridView ID="gridTelefone" runat="server" 
        ondatabinding="gridTelefone_DataBinding" 
        onrowdeleting="gridTelefone_RowDeleting" AutoGenerateColumns="False" 
        Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" DeleteText="selecionar" >
            <ItemStyle Width="50px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="telefone">
              
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("valueToString") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="450px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
    </asp:GridView>
</p>

