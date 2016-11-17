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
                            <table style="text-align:center">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtBuscarUsuario" runat="server" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnBuscarUsuario" runat="server" CssClass="BotonCabecera" Text="Buscar" OnClick="btnBuscarUsuario_Click" />
                                    
                                        <asp:Repeater ID="rptSolicitudes" runat="server" OnItemCommand="rptSolicitudes_ItemCommand" >
                                            <HeaderTemplate>
                                              <table>
                                                <tr>
                                                    <th>Solicitud de Contacto</th>
                                                    <th></th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td bgcolor="#CCFFCC">
                                                        <asp:Label runat="server" ID="Label1" 
                                                            text='<%# Eval("usuarioIDSolicita") %>' />
                                                        </td>
                                                        <td bgcolor="#CCFFCC" style="display:none;">
                                                            <asp:Label runat="server" ID="Label2" 
                                                                text='<%# Eval("id") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CommandName="Aceptar" CommandArgument='<%# Eval("id") %>' />
                                                            <asp:Button ID="btnRechazar" runat="server" Text="Rechazar" CommandName="Rechazar" CommandArgument='<%# Eval("id") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Repeater ID="rptContactos" runat="server">
                                            <HeaderTemplate>
                                              <table>
                                                <tr>
                                                    <th>Nombre</th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td bgcolor="#CCFFCC">
                                                        <asp:Label runat="server" ID="Label1" 
                                                            text='<%# Eval("nombre") %>' />
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
                        <td style="width:60%;text-align:center;">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPublicar" runat="server" TextMode="MultiLine" Width="700px" Height="50px"   />
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
                            <asp:Repeater ID="rptPublicaciones" runat="server" OnItemDataBound="rptPublicaciones_ItemDataBound" OnItemCommand="rptPublicaciones_ItemCommand" >
                                <ItemTemplate>
                                  <table style="margin: 10px 10px 10px 10px;border: 1px solid blue; width:98%;">
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
                                      <tr>
                                          <td>
                                              <table style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtComentar" runat="server" TextMode="MultiLine" Width="600px" Height="40px"   />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCalificacion" runat="server">
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Button ID="btnComentar" runat="server" Text="COMENTAR" CssClass="BotonRegistracion" OnClick="btnPublicar_Click" CommandName="Comentar" />
                                                    </td>
                                                </tr>
                                            </table>
                                          </td>
                                      </tr>
                                  </table>
                              </ItemTemplate>
                          </asp:Repeater>
                        </td>
                        <td style="width:20%; vertical-align:top;">
                            <table style="width:100%;text-align:center;">
                                <tr>
                                    <td>
                                        <input type="button" value="Nuevo Grupo" class="BotonCabecera" onClick="javascript: window.location = 'AltaGrupo.aspx';" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
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
</asp:Content>
    

