<%-- 
    Document   : validar
    Created on : 25/08/2024, 04:42:39 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String identificacion = request.getParameter("identificacion");
    String clave = request.getParameter("clave");
    Persona administrador = Persona.validar(identificacion, clave);
    if (administrador!=null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("administrador", administrador);
            response.sendRedirect("principal.jsp?CONTENIDO=inicio.jsp");
        }else {
        response.sendRedirect("index.jsp?error=1");
    }
%>
