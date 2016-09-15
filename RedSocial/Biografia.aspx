<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <p><asp:Image ID="imgFotoPerfil" runat="server" OnLoad="CargarFotoPerfil"/></p>
    <p><asp:FileUpload ID="fupCargarFotoPerfil" runat="server"  /><p>
    <asp:Button ID="btnCargarFotoPerfil" runat="server" Text="Cargar" OnClick="btnCargarFotoPerfil_Click" />
    </asp:Content>
    

