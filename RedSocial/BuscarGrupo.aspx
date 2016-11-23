<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="BuscarGrupo.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <style>
        #rptComentarios {
            background-color:red;
        }
    </style>
      
      <asp:Label runat="server" ID="lblListaGrupos" text="Seleccione un nuevo grupo" CssClass="EtiquetaListaGrupos" ></asp:Label>
        
      <asp:Repeater ID="rptGrupos" runat="server" OnItemCommand="rptGrupos_ItemCommand" >
          <ItemTemplate>
              <table>
                  <tr>
                      <td bgcolor="#CCFFCC">
                        <asp:Label runat="server" ID="Label1" 
                            text='<%# Eval("nombre") %>' />
                      </td>
                      <td bgcolor="#CCFFCC" style="display:none;">
                          <asp:Label runat="server" ID="Label2" 
                              text='<%# Eval("descripcion") %>' />
                      </td>
                      <td>
                          <asp:Button ID="btnInscripcion" runat="server" Text="Inscripcion" CommandName="Inscribirse" CommandArgument='<%# Eval("id") %>' />
                      </td>
                  </tr>
              </table>              
          </ItemTemplate>
      </asp:Repeater>

    </asp:Content>
    

