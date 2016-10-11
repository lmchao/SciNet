<%@ Page Title="SciNet - Actualizar Datos" Language="C#" AutoEventWireup="true" MasterPageFile="~/Autenticado.master" CodeFile="actualizardatos.aspx.cs" Inherits="actualizardatos" %>
<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">

         <p><asp:Image ID="imgFotoPerfil" runat="server" OnLoad="CargarFotoPerfil"/></p>
    <p><asp:FileUpload ID="fupCargarFotoPerfil" runat="server"  /><p>
    <asp:Button ID="btnCargarFotoPerfil" runat="server" Text="Cargar" OnClick="btnCargarFotoPerfil_Click" />
    
</asp:Content>