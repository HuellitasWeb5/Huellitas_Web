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
        <link rel="stylesheet" href="presentacion/style-Proyecto.css">
        <link rel="stylesheet" href="recursos/jquery-ui-1.13.3.custom/jquery-ui.css">
        <link rel="stylesheet" href="recursos/bootstrap/css/bootstrap.min.css">
        <script src="recursos/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="recursos/jquery-3.7.1.min.js"></script>
        <script src="recursos/jquery-ui-1.13.3.custom/jquery-ui.min.js"></script>
       <script src="recursos/swiper-bundle.min.js"></script>   
       <link rel="stylesheet" href="recursos/swiper-bundle.min.css" />
        <title>HUELLITAS WEB</title>
    </head>


<body>
     <div id="banner"></div>
     <div id="menu"><%=USUARIO.getTipoEnObjeto().getMenu()%></div>
     <div id="contenido">
            <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" />
        </div>
</body>
<footer>
    <div class="footer-info">
        <p>3162562576</p>
        <p>Fundacionvillaesperanza@gmail.com</p>
        <p>Parque Natural Chimayoy</p>
    </div>
</footer>
</html>