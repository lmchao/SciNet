<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
   <%--<style style="></style>--%>
   <div id="main">
   <div id="left">Left</div>
   <div id="content">Center</div>
   <div id="right">Right</div>
    <div style="clear:both"></div> 
   <div id="footer">Footer</div>
</div> 

      <a href="AltaGrupo.aspx">
      <asp:Label runat="server" ID="nuevoGrupo" text="Nuevo Grupo" CssClass="EtiquetaNuevoGrupo" ></asp:Label>
      </a>
     
      <asp:Repeater ID="rptPublicaciones" runat="server">
          <%--DataSourceID="SqlDataSource_Publicaciones">--%>
          <HeaderTemplate>
              <table>
              <tr>
                 <th>Name</th>
                 <th>Description</th>
              </tr>
          </HeaderTemplate>

          <ItemTemplate>
          
          <tr >
              <div runat="server" CssClass="ItemPublicacion">
              <td bgcolor="#CCFFCC">
                <asp:Label runat="server" ID="Label1" 
                    text='<%# Eval("Descripcion") %>' />
              </td>
              <td bgcolor="#CCFFCC">
                  <asp:Label runat="server" ID="Label2" 
                      text='<%# Eval("UsuarioID") %>' />
              </td>
              </div>
          </tr>
        
          </ItemTemplate>

<%--          <AlternatingItemTemplate>
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
          </AlternatingItemTemplate>--%>

          <FooterTemplate>
              </table>
          </FooterTemplate>
      </asp:Repeater>
<%--
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
 --%>
    </div>
    </asp:Content>
    

