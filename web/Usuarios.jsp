<%-- 
    Document   : Usuarios
    Created on : 17/02/2014, 12:06:31 AM
    Author     : Sony
--%>

<%@page import="clases.Usuario"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema WEB</title>
        <jsp:include page="encabezado.jsp"></jsp:include>
    </head>
    <body>
        <% 
            //mensaje que muestra mensajes del sistema
            String mensaje ="";
            
            //todos los botonoes los apgamos
            boolean consultar = false;
            boolean nuevo = false;
            boolean modificar = false;
            boolean borrar = false;
            boolean limpiar = false;
            boolean listar = false;
            
            if(request.getParameter("consultar") != null) consultar = true;
            if(request.getParameter("nuevo") != null) nuevo = true;
            if(request.getParameter("modificar") != null) modificar = true;
            if(request.getParameter("borrar") != null) borrar = true;
            if(request.getParameter("limpiar") != null) limpiar = true;
            if(request.getParameter("listar") != null) listar = true;
            
            //campos
            String idusuario ="";
            String nombres ="";
            String apellidos ="";
            String clave ="";
            String confirmacion ="";
            String perfil ="";
            String foto ="";
            
            
             if(request.getParameter("idusuario") != null) idusuario = request.getParameter("idusuario");
             if(request.getParameter("nombres") != null) nombres = request.getParameter("nombres");
             if(request.getParameter("apellidos") != null) apellidos = request.getParameter("apellidos");
             if(request.getParameter("clave") != null) clave = request.getParameter("clave");
             if(request.getParameter("confirmacion") != null) confirmacion = request.getParameter("confirmacion");
             if(request.getParameter("perfil") != null) perfil = request.getParameter("perfil");
             if(request.getParameter("foto") != null) foto = request.getParameter("foto");
            
            //Si presiona el boton consultar
             if(consultar)
                 if(idusuario == ""){
                     mensaje = "Debe Ingresar un ID de usuario";
                 }else{
                     Datos misDatos = new Datos();
                     Usuario miUsuario = misDatos.getUsuario(idusuario);
                     
                     if(miUsuario == null){
                         mensaje = "Usuario no existe";
                     }else{
                         idusuario = miUsuario.getIdusuario();
                         nombres = miUsuario.getNombres();
                         apellidos = miUsuario.getApellidos();
                         clave = miUsuario.getClave();
                         confirmacion = miUsuario.getClave();
                         perfil = ""+ miUsuario.getIdperfil();
                         
                     }
                     
                 }
        %>
        <h1>Menu Usuarios</h1>
        <form name="usuarios" id="usuarios" action="Usuarios.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ID Usuario</td>
                        <td><input type="text" name="idusuario" id="idusuario" value="<%=idusuario%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Nombres</td>
                        <td><input type="text" name="nombres" id="nombres" value="<%=nombres%>" size="30" /></td>
                    </tr>
                    <tr>
                        <td>Apellidos</td>
                        <td><input type="text" name="apellidos" id="apellidos" value="<%=apellidos%>" size="30" /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><input type="password" name="clave" id="clave" value="<%=clave%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Confirmacion</td>
                        <td><input type="password" name="confirmacion" id="confirmacion" value="<%=clave%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Perfil</td>
                        <td><select name="perfil" id="perfil">
                                <option value="0">Selecciona perfil</option>
                                <option value="1">Administrador</option>
                                <option value="2">Empleado</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Foto</td>
                        <td><input type="file" name="foto" id="foto" value="<%=foto%>" /></td>
                    </tr>
                </tbody>
            </table>
        <jsp:include page="Botones.jsp"></jsp:include>
           
        </form>
         <br>
        <a href="javascript:history.back(1)">Regresar a la pagina anterior</a><br>
        <a href="MenuAdministrador.jsp">Regresar al menu</a><br>
    </body>
</html>
