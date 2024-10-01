<%-- 
    Document   : usuarios
    Created on : 28/08/2024, 09:04:02 AM
    Author     : VALEN
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-Tarjetas.css">

</head>
<%
String lista = "";
List<Persona> datos = Persona.getListaEnObjetos("tipo<>'C'", null);
for (int i = 0; i < datos.size(); i++) {
    Persona administrador = datos.get(i);
    lista += "<div class='swiper-slide card'>"; // Añadido la clase 'card'
    lista += "<div class='card-body'>"; // Contenedor para el cuerpo de la tarjeta
    lista += "<img src='presentacion/administrador/" + administrador.getFoto() + "' class='profile-image'/>"; // Imagen de perfil
    lista += "<p><strong>Identificación:</strong> " + administrador.getIdentificacion() + "</p>";
    lista += "<p><strong>Nombre:</strong> " + administrador.getNombre() + "</p>";
    lista += "<p><strong>Género:</strong> " + administrador.getGenero() + "</p>";
    lista += "<p><strong>Edad:</strong> " + administrador.getEdad() + "</p>";
    lista += "<p><strong>Email:</strong> " + administrador.getEmail() + "</p>";
    lista += "<p><strong>Teléfono:</strong> " + administrador.getTelefono() + "</p>";
    lista += "<p><strong>Dirección:</strong> " + administrador.getDireccion() + "</p>";
    lista += "<p><strong>Residencia:</strong> " + administrador.getResidencia() + "</p>";
    lista += "<div class='card-footer'>"; // Contenedor para los botones
    lista += "<a href='principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Modificar&identificacion=" + administrador.getIdentificacion() + "' title='Modificar'>";
    lista += "<button class='btn-adicionar'  title='Modificar'>Modificar</button></a>";
    lista += "<button class='btn-eliminar' title='Eliminar' onClick='eliminar(" + administrador.getIdentificacion() + ")'>Eliminar</button>";
    lista += "</div>"; // Fin de card-footer
    lista += "</div>"; // Fin de card-body
    lista += "</div>"; // Fin de swiper-slide
}
%>


<h3>LISTA DE ADMINISTRADORES</h3>

<div class="header-container">
    <!-- Buscar por nombre -->
    <form id="searchForm">
        <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
        <ul id="nameList"></ul> <!-- Lista de nombres -->
    </form>

    <!-- Botón de adicionar -->
    <div class="btn-estilo-container">
        <a href="principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Adicionar">
            <button class='btn-adicionar' id="Adicionar" class="btn-adicionar">Adicionar</button>
        </a>
    </div>
</div>


<div class="swiper-container">
    <div class="swiper-wrapper">
        <% for (int i = 0; i < datos.size(); i++) {
            Persona administrador = datos.get(i);
        %>
        <div class="swiper-slide">
            <div class="card">
                <div class="card-header">
                    <%= administrador.getNombre() %>
                </div>
                <div class="card-image">
                    <img src="presentacion/administrador/<%= administrador.getFoto() %>" alt="Foto de <%= administrador.getNombre() %>" class="profile-image">
                </div>
                <div class="card-body">
                    <p><strong>Identificación:</strong> <%= administrador.getIdentificacion() %></p>
                    <p><strong>Género:</strong> <%= administrador.getGenero() %></p>
                    <p><strong>Edad:</strong> <%= administrador.getEdad() %></p>
                    <p><strong>Email:</strong> <%= administrador.getEmail() %></p>
                    <p><strong>Teléfono:</strong> <%= administrador.getTelefono() %></p>
                    <p><strong>Dirección:</strong> <%= administrador.getDireccion() %></p>
                    <p><strong>Residencia:</strong> <%= administrador.getResidencia() %></p>
                </div>
                <div class="btn-container">
                    <a href="principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Modificar&identificacion=<%= administrador.getIdentificacion() %>">
                        <button class="btn-adicionar">Modificar</button>
                    </a>
                    <button class="btn-eliminar" onClick="eliminar(<%= administrador.getIdentificacion() %>)">Eliminar</button>
                </div>
            </div>
        </div>
        <% } %>
    </div>


<div id="result"></div> <!-- Para mostrar la identificación -->
<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el administrador con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=5.Administradores/administradoresActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
    
    function calcularEdad() {
    const fechaNacimiento = document.getElementById("fechaNacimiento").value;
    if (fechaNacimiento) {
        const fechaActual = new Date();
        const nacimiento = new Date(fechaNacimiento);
        let edad = fechaActual.getFullYear() - nacimiento.getFullYear();
        const mes = fechaActual.getMonth() - nacimiento.getMonth();

        if (mes < 0 || (mes === 0 && fechaActual.getDate() < nacimiento.getDate())) {
            edad--;
        }

        document.getElementById("edad").textContent = edad;
    }
}

// Llamar a la función al cargar la página si ya hay una fecha de nacimiento
window.onload = function() {
    calcularEdad();
}

  const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 3, // ayuda a mostrarme  4 tarjetas a la vez
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });
</script>

  