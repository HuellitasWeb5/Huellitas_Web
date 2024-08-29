<%-- 
    Document   : principal
    Created on : 25/08/2024, 04:43:56 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
HttpSession sesion=request.getSession();
Persona ADMINISTRADOR=null;
if (sesion.getAttribute("administrador")==null) response.sendRedirect("index.jsp?error=2");
else ADMINISTRADOR=(Persona) sesion.getAttribute("administrador");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HUELLITAS WEB</title>
    </head>


<body>
     <div id="banner"></div>
     <div id="menu"><%=ADMINISTRADOR.getTipoEnObjeto().getMenu()%></div>
     <div id="contenido">
            <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" />
        </div>
</body>
</html>