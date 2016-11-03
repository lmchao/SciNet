<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <style>
        #rptComentarios {
            background-color:red;
        }
    </style>

    <table style="width:100%;text-align:center;">
        <tr>
            <td style="background-color:red;">

            </td>
        </tr>
        <tr>
            <td  style="background-color:beige">
                <table>
                    <tr>
                        <td style="width:10%;">

                        </td>
                        <td style="width:80%;">
                            <asp:Repeater ID="rptPublicaciones" runat="server" OnItemDataBound="rptPublicaciones_ItemDataBound">
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
                                  <asp:Repeater ID="rptComentarios" runat="server">
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
                        </td>
                        <td style="width:10%;">
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color:red;">

            </td>
        </tr>
    </table>
    

      <a href="AltaGrupo.aspx">
      <asp:Label runat="server" ID="nuevoGrupo" text="Nuevo Grupo" CssClass="EtiquetaNuevoGrupo" ></asp:Label>
      </a>
     
      

    
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
    

