<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <p><asp:Image ID="imgFotoPerfil" runat="server" OnLoad="CargarFotoPerfil"/></p>
    <p><asp:FileUpload ID="fupCargarFotoPerfil" runat="server"  /><p>
    <asp:Button ID="btnCargarFotoPerfil" runat="server" Text="Cargar" OnClick="btnCargarFotoPerfil_Click" />

        <div>
    
      <asp:Repeater ID="rptPublicaciones" runat="server" 
          DataSourceID="SqlDataSource_Publicaciones">
          <HeaderTemplate>
              <table>
              <tr>
                 <th>Name</th>
                 <th>Description</th>
              </tr>
          </HeaderTemplate>

          <ItemTemplate>
          <tr>
              <td bgcolor="#CCFFCC">
                <asp:Label runat="server" ID="Label1" 
                    text='<%# Eval("Descripcion") %>' />
              </td>
              <td bgcolor="#CCFFCC">
                  <asp:Label runat="server" ID="Label2" 
                      text='<%# Eval("UsuarioID") %>' />
              </td>
          </tr>
          </ItemTemplate>

          <AlternatingItemTemplate>
          <tr>
              <td >
                <asp:Label runat="server" ID="Label3" 
                    text='<%# Eval("Descripcion") %>' />
              </td>
              <td >
                 <asp:Label runat="server" ID="Label4" 
                     text='<%# Eval("UsuarioID") %>' />
              </td>
          </tr>
          </AlternatingItemTemplate>

          <FooterTemplate>
              </table>
          </FooterTemplate>
      </asp:Repeater>

      <asp:SqlDataSource 
          ConnectionString=
              "<%$ ConnectionStrings:ConexionRedSocial %>"
          ID="SqlDataSource_Publicaciones" runat="server" 
          SelectCommand="SELECT TOP (15) [PublicacionID]
      ,[UsuarioID]
      ,[GrupoID]
      ,[Descripcion]
      ,[PublicacionActualizacion]
      ,[PublicacionCalificacion]
      ,[PublicacionImagen]
  FROM [RedSocialORT22AGrupo02].[dbo].[Publicacion]">
      </asp:SqlDataSource>
    </div>
    </asp:Content>
    

