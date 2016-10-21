<%@ Page Title="SciNet - Actualizar Datos" Language="C#" AutoEventWireup="true" MasterPageFile="~/Autenticado.master" CodeFile="actualizardatos.aspx.cs" Inherits="actualizardatos" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <asp:Panel runat="server" ID="panInicio" CssClass="FondoRegistracion">
       <%-- <asp:Image runat="server" ID="imgRedSocialORT" ImageUrl="~/Imagenes/RedSocialORT.png" CssClass="RedSocialORT" />--%>
              <p><asp:Image ID="imgFotoPerfil" runat="server" OnLoad="CargarFotoPerfil"/></p>
    <p><asp:FileUpload ID="fupCargarFotoPerfil" runat="server"  /><p>
    <asp:Button ID="btnCargarFotoPerfil" runat="server" Text="Cargar" OnClick="btnCargarFotoPerfil_Click" />
    
        <asp:Panel runat="server" ID="panRegistraciom" CssClass="ActualizarDatos">
            <asp:Table runat="server" ID="tblRegistracion" CellSpacing="8">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"><asp:Label runat="server" ID="lblRegistrate" Text="Registrate" CssClass="Registracion"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblNombre" Text="Nombre" CssClass="EtiquetaRegistracion"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblApellido" Text="Apellido" CssClass="EtiquetaRegistracion"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNombre" runat="server" Columns="20" MaxLength="30" placeholder="Nombre" CssClass="CajaTextoRegistracion"></asp:TextBox>            
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtApellido" runat="server" Columns="20" MaxLength="30" placeholder="Apellido" CssClass="CajaTextoRegistracionApellido"></asp:TextBox>            
                    </asp:TableCell>
                </asp:TableRow>
                <%-- <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" ID="lblEmail" Text="Email" CssClass="EtiquetaRegistracion"></asp:Label>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:TextBox ID="txtEmail" runat="server" Columns="48" MaxLength="100" placeholder="Tu correo electrónico" CssClass="CajaTextoRegistracion"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" ID="lblEmailConfirmacion" Text="Vuelve a escribir tu correo electrónico" CssClass="EtiquetaRegistracion"></asp:Label>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:TextBox ID="txtEmailVerificacion" runat="server" Columns="48" MaxLength="100" placeholder="Vuelve a escribir tu correo electrónico" CssClass="CajaTextoRegistracion"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow> --%>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" ID="lblPassword" Text="Contraseña" CssClass="EtiquetaRegistracion"></asp:Label>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <%--<asp:TextBox ID="txtPassword" runat="server" Columns="48" MaxLength="10"  TextMode="Password" placeholder="Contraseña" CssClass="CajaTextoRegistracion"></asp:TextBox> --%>
                        <asp:TextBox ID="txtPassword" runat="server" Columns="48" MaxLength="10" placeholder="Contraseña" CssClass="CajaTextoRegistracion"></asp:TextBox>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"><asp:Label runat="server" ID="lblFechaNacimiento" Text="Fecha de nacimiento" CssClass="EtiquetaRegistracion"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:DropDownList ID="ddlDia" runat="server">
                            <asp:ListItem Value="0" Text="Día"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlMes" runat="server">
                            <asp:ListItem Value="0" Text="Mes"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Ene"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Feb"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Mar"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Abr"></asp:ListItem>
                            <asp:ListItem Value="5" Text="May"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Jun"></asp:ListItem>
                            <asp:ListItem Value="7" Text="Jul"></asp:ListItem>
                            <asp:ListItem Value="8" Text="Agos"></asp:ListItem>
                            <asp:ListItem Value="9" Text="Sept"></asp:ListItem>
                            <asp:ListItem Value="10" Text="Oct"></asp:ListItem>
                            <asp:ListItem Value="11" Text="Nov"></asp:ListItem>
                            <asp:ListItem Value="12" Text="Dic"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAnio" runat="server">
                            <asp:ListItem Value="0" Text="Año"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:RadioButton ID="radMujer" runat="server" Text="Mujer" CssClass="SexoFemenino" />
                        <asp:RadioButton ID="radHombre" runat="server" Text="Hombre" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnRegistrate" runat="server" Text="Registrate" OnClick="btnRegistrate_Click" CssClass="BotonRegistracion" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>
    </asp:Panel>
   
</asp:Content>