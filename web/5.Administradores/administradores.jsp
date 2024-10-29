<%-- 
    Document   : usuarios
    Created on : 28/08/2024, 09:04:02 AM
    Author     : VALEN
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">

</head>
<%
    String lista = "";
    List<Persona> datos = Persona.getListaEnObjetos("tipo<>'c'", null);
    lista += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper
    for (int i = 0; i < datos.size(); i++) {
        Persona administrador = datos.get(i);
        lista += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        lista += "<div class='card'>"; // Añadido la clase 'card'
        lista += "<div class='card-image'>"; // Contenedor de la imagen
        lista += "<img src='presentacion/administrador/" + administrador.getFoto() + "' alt='Foto de " + administrador.getNombre() + "' class='profile-image' width='30' height='auto'>";
        lista += "</div>"; // Fin de la imagen
        lista += "<div class='card-header'>"; // Cabecera de la tarjeta
        lista += administrador.getNombre(); // Nombre del administrador como título
        lista += "<p class='rol-administrador'>" + administrador.getTipoEnObjeto() + "</p>"; // Rol del administrador como subtítulo

        lista += "</div>"; // Fin de la cabecera
 
        lista += "<div class='card-body'>"; // Cuerpo de la tarjeta
        lista += "<p><strong>Identificación:</strong> " + administrador.getIdentificacion() + "</p>";
        lista += "<p><strong>Género:</strong> " + administrador.getGeneroPersona()+ "</p>";
        lista += "<p><strong>Edad:</strong> " + administrador.getEdad() + " años</p>";
        lista += "<p><strong>Email:</strong> " + administrador.getEmail() + "</p>";
        lista += "<p><strong>Teléfono:</strong> " + administrador.getTelefono() + "</p>";
        lista += "<p><strong>Dirección:</strong> " + administrador.getDireccion() + "</p>";
        lista += "<p><strong>Residencia:</strong> " + administrador.getResidencia() + "</p>";
        lista += "</div>"; // Fin del cuerpo de la tarjeta
        lista += "<div class='btn-container'>"; // Contenedor de botones
        lista += "<a href='principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Modificar&identificacion=" + administrador.getIdentificacion() + "' title='Modificar'>";
        lista += "<button class='btn-adicionar'>Modificar</button></a>";
        lista += "<button class='btn-eliminar' onClick='eliminar(" + administrador.getIdentificacion() + ")'>Eliminar</button>";
        lista += "</div>"; // Fin del contenedor de botones
        lista += "</div>"; // Fin de la tarjeta
        lista += "</div>"; // Fin de la diapositiva
    }
    lista += "</div>"; // Fin del swiper-wrapper
%>


<h3>LISTA DE ADMINISTRADORES</h3>

<div class="header-container">
    <!-- Buscar por nombre -->
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>

    <!-- Botón de adicionar -->
    <div class="btn-container">
        <a href="principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Adicionar">
            <button class="btn-adicionar">Adicionar</button>
        </a>
    </div>
</div>

<div class="swiper-container">
    <%= lista %>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<div id="result"></div>
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
    
   function filterNames() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const slides = document.getElementsByClassName('swiper-slide');

    // Recorre cada slide y oculta o muestra dependiendo del filtro
    for (let i = 0; i < slides.length; i++) {
        const cardHeader = slides[i].getElementsByClassName('card-header')[0];
        const textValue = cardHeader.textContent || cardHeader.innerText;

        if (textValue.toLowerCase().indexOf(filter) > -1) {
            slides[i].style.display = "";
        } else {
            slides[i].style.display = "none";
        }
    }
}
</script>

  
