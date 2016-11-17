<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="Biografia.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <style>
        #rptPublicaciones {
            width:100%;
        }

        .NombreUsuario {
            font-weight:bold;
            forecolor:Blue;
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
                        <td style="width:20%;vertical-align:top;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtBuscarUsuario" runat="server" />
                                        <asp:Button ID="btnBuscarUsuario" runat="server" Text="Buscar" OnClick="btnBuscarUsuario_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:70%;text-align:center;">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPublicar" runat="server" TextMode="MultiLine" Width="400px" Height="50px"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnPublicar" runat="server" Text="PUBLICAR" CssClass="BotonRegistracion" OnClick="btnPublicar_Click" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Repeater ID="rptPublicaciones" runat="server" OnItemDataBound="rptPublicaciones_ItemDataBound" >
                              <ItemTemplate>
                                  <table style="margin: 10px 10px 10px 10px;border: 1px solid blue; width:90%;">
                                      <tr>
                                          <td style="height:20px;">
                                              <table style="width:100%;">
                                                  <tr>
                                                      <td style="width:20%;">
                                                          <div>
                                                              <asp:Image ID="imgPubUsuarioPost" runat="server" />
                                                          </div>
                                                      </td>
                                                      <td>
                                                          <asp:Label ID="lblPubNombreUsuario" runat="server" CssClass="NombreUsuario" Text="texto de prueba" />
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="height:auto;">
                                              <table style="margin: 10px 10px 10px 10px; width:100%;">
                                                  <tr>
                                                      <td style="text-align:left;">
                                                          <div>
                                                              <asp:Label ID="lblPubMensaje" runat="server" Text="Mensaje de la publicacion" />
                                                          </div>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          <div>
                                                              <asp:Image ID="imgPubImagen" runat="server" />
                                                          </div>
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <table style="width:100%;">
                                                  <tr>
                                                      <td style="text-align:left;">
                                                          <div>
                                                              <asp:Label ID="lblPubFecha" runat="server" Text="10/10/2016" />
                                                          </div>
                                                      </td>
                                                      <td style="text-align:right;">
                                                          <div>
                                                              <%--<asp:Image ID="imgPubRanking" runat="server" />--%>
                                                              <asp:Label ID="imgPubRanking" runat="server" Text="10 puntos" />
                                                          </div>
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Repeater ID="rptComentarios" runat="server" OnItemDataBound="rptComentarios_ItemDataBound" >
                                                  <ItemTemplate>
                                                      <table style="width:100%;text-align:left; border:solid 1px blue;">
                                                          <tr>
                                                              <td>
                                                                  <asp:Label ID="lblComNombre" runat="server" Text="Com nombre" CssClass="NombreUsuario" />
                                                              </td>
                                                          </tr>
                                                          <tr>
                                                              <td>
                                                                  <asp:Label ID="lblComTexto" runat="server" Text="Com teXto" />
                                                              </td>
                                                          </tr>
                                                          <tr>
                                                              <td>
                                                                  <table style="width:100%;">
                                                                      <tr>
                                                                          <td>
                                                                              <asp:Label ID="lblComFecha" runat="server" Text="10/10/2016" />
                                                                          </td>
                                                                          <td style="text-align:right;">
                                                                              <asp:Label ID="lblComPuntos" runat="server" Text="1 punto" />
                                                                          </td>
                                                                      </tr>
                                                                  </table>
                                                              </td>
                                                          </tr>
                                                      </table>
                                                  </ItemTemplate>
                                              </asp:Repeater>
                                          </td>
                                      </tr>
                                  </table>
                              </ItemTemplate>
                          </asp:Repeater>
                        </td>
                        <td style="width:20%; vertical-align:top;">
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
                        <td style="width:10%;">

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
    

