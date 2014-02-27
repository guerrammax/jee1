<%-- 
    Document   : index
    Created on : 5/02/2014, 04:57:57 PM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Aplicacion web</title>
        <script>
            $(document).ready(function(){
               $("#ValidarUsuario").submit(function (){
                   $.post("ValidarUsuario",$("#ValidarUsuario").serialize(),function (data){
                      perfil = jQuery.trim(data);
                      if(perfil == "1") document.location.href = "MenuAdministrador.jsp";
                      else if(perfil == "2") document.location.href = "MenuEmpleado.jsp";
                      else $("#mensaje-ingreso").html("<h1> Usuario no valido</h1>");
                   });
                   
                    return false; 
               }); 
            });
        </script>
    </head>
    <body>
        <h1>Sistema de Facturacion</h1>
        <form name="ValidarUsuario" id="ValidarUsuario" action="ValidarUsuario" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text"  name="usuario" id="usuario" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><input type="password" name="clave" id="clave" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Ingresar" name="ingresar" id="ingresar" /></td>
                        
                    </tr>
                </tbody>
            </table>

        </form>
        <div id="mensaje-ingreso"> </div>
    </body>
</html>
