<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <style>
        #rptComentarios {
            background-color:red;
        }
    </style>
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
     
      <asp:Repeater ID="rptPublicaciones" runat="server" >
          <ItemTemplate>
              <table>
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
              </table>
              <asp:Repeater DataSource="<%#Container.DataItem%>" runat="server">
                  <ItemTemplate>
                      <table>
                          <tr>
                              <td>
                                  nombre usuario
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  comentario
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <table>
                                      <tr>
                                          <td>
                                              fecha
                                          </td>
                                          <td>
                                              puntuacion digamos
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                      </table>
                  </ItemTemplate>
              </asp:Repeater>
          </ItemTemplate>
      </asp:Repeater>

    <asp:Repeater ID="rptGrupos" runat="server" >          
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
                    text='<%# Eval("nombre") %>' />
              </td>
              <td bgcolor="#CCFFCC">
                  <asp:Label runat="server" ID="Label2" 
                      text='<%# Eval("descripcion") %>' />
              </td>
          </tr>
          </ItemTemplate>
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
    

