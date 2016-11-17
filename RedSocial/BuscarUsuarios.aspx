<%@ Page Title="" Language="C#" MasterPageFile="~/Autenticado.master" AutoEventWireup="true" CodeFile="BuscarUsuarios.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <style>
        #rptComentarios {
            background-color:red;
        }
    </style>
      
      <asp:Label runat="server" ID="lblListaContactos" text="Seleccione un nuevo contacto" CssClass="EtiquetaListaUsuarios" ></asp:Label>
        
      <asp:Repeater ID="rptUsuarios" runat="server" >
          <ItemTemplate>
              <table>
                  <tr>
                      <td bgcolor="#CCFFCC">
                        <asp:Label runat="server" ID="Label1" 
                            text='<%# Eval("nombre") %>' />
                      </td>
                      <td bgcolor="#CCFFCC">
                          <asp:Label runat="server" ID="Label2" 
                              text='<%# Eval("id") %>' />
                      </td>
                  </tr>
              </table>              
          </ItemTemplate>
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
    

