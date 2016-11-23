<%@ Page Title="SciNet" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="AltaGrupo.aspx.cs" Inherits="Registracion" %>

<asp:Content ID="cphContenido" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <asp:Panel runat="server" ID="panInicio" CssClass="FondoRegistracion">
        <asp:Image runat="server" ID="imgRedSocialORT" ImageUrl="~/Imagenes/RedSocialORT.png" CssClass="RedSocialORT" />

        <asp:Panel runat="server" ID="panCreaGrupo" CssClass="CreaGrupo">
            <asp:Table runat="server" ID="tblCrearGrupo" CellSpacing="8">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"><asp:Label runat="server" ID="lblRegistrate" Text="Crear Grupo" CssClass="CreaGrupo"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblNombre" Text="Nombre" CssClass="EtiquetaCrearGrupo"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblDescripcion" Text="Descripcion" CssClass="EtiquetaCrearGrupo"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNombre" runat="server" Columns="20" MaxLength="30" placeholder="Nombre" CssClass="CajaTextoCrearGrupo"></asp:TextBox>            
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDescripcion" runat="server" Columns="20" MaxLength="100" placeholder="Descripcion" CssClass="CajaTextoCrearGrupoDescripcion"></asp:TextBox>            
                    </asp:TableCell>
                </asp:TableRow>                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnCrearGrupo" runat="server" Text="Crear" OnClick="btnCrearGrupo_Click" CssClass="BotonCrearGrupo" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

