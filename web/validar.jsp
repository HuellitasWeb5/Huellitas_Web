<%-- 
    Document   : validar
    Created on : 25/08/2024, 04:42:39 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String identificacion = request.getParameter("identificacion");
    String clave = request.getParameter("clave");
    Persona usuario = Persona.validar(identificacion, clave);
    if (usuario != null) {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", usuario);
        sesion.setAttribute("numeroUsuario", usuario.getIdentificacion()); // Almacena el número en la sesión
        sesion.setAttribute("tipoUsuario", usuario.getTipo()); // Almacena el tipo en la sesión
        response.sendRedirect("principal.jsp?CONTENIDO=inicio.jsp");
    } else {
        response.sendRedirect("index-InicioSesion.jsp?error=1");
    }
%>