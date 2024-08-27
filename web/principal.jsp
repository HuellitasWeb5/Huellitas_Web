<%-- 
    Document   : principal
    Created on : 25/08/2024, 04:43:56 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
HttpSession sesion=request.getSession();
Persona USUARIO=null;
if (sesion.getAttribute("usuario")==null) response.sendRedirect("index.jsp?error=2");
else USUARIO=(Persona) sesion.getAttribute("usuario");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Software de ventas</title>
    </head>


<body>
     <div id="banner"></div>
     <div id="menu"><%=USUARIO.getTipoEnObjeto().getMenu()%></div>
     <div id="contenido">
            <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" />
        </div>
</body>
</html>