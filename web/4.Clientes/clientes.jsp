<%-- 
    Document   : clientes
    Created on : 27/05/2024, 03:11:27 PM
    Author     : URB
--%>

<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    String lista = "";
    List<Persona> datos = Persona.getListaEnObjetos("tipo<>'S' && tipo<>'F'", null);
    lista += "<div class='swiper-wrapper'>";
    for (int i = 0; i < datos.size(); i++) {
        Persona clientes = datos.get(i);
        lista += "<div class='swiper-slide'>"; // Añadido la clase 'card'
        lista += "<div class='card'>"; // Añadido la clase 'card'
        lista += "<div class='card-image'>";
        lista += "<img src='presentacion/clientes/" + clientes.getFoto() + "' width='30' height='auto' class='profile-image'>";
        lista += "</div>";
        lista += "<div class='card-header'>";
        lista += clientes.getNombre();
        lista += "</div>";
        lista += "<div class='card-body'>"; // Contenedor para el cuerpo de la tarjeta   
        lista += "<p><strong>Identificacion:</strong>" + clientes.getIdentificacion() + "</p>";
        lista += "<p><strong>Genero:</strong>" + clientes.getGeneroPersona() + "</p>";
        lista += "<p><strong>Edad:</strong>" + clientes.getEdad() + " años</p>";
        lista += "<p><strong>Email:</strong>" + clientes.getEmail() + "</p>";
        lista += "<p><strong>Telefono:</strong>" + clientes.getTelefono() + "</p>";
        lista += "<p><strong>Direccion:</strong>" + clientes.getDireccion() + "</p>";
        lista += "<p><strong>Residencia:</strong>" + clientes.getResidencia() + "</p>";
        lista += "</div>";
        lista += "<div class='btn-container'>"; // Contenedor para los botones
        lista += "<a href='principal.jsp?CONTENIDO=4.Clientes/clientesFormulario.jsp&accion=Modificar&identificacion=" + clientes.getIdentificacion()
                + " 'title='Modificar'> <button class='btn-adicionar' title='Modificar'> Modificar </button> </a>";
        lista += "<button class='btn-eliminar' title='Eliminar' onClick='eliminar(" + clientes.getIdentificacion() + ")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
    lista += "</div>";
%>
<h3>SANPATITAS</h3>
<div class="header-container">
    <!-- Buscar por nombre -->
    <form id="searchForm">
        <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
        <ul id="nameList"></ul> <!-- Lista de nombres -->
    </form>

    <!-- Botón de adicionar -->
    <div class="btn-container">
        <a href="principal.jsp?CONTENIDO=4.Clientes/clientesFormulario.jsp&accion=Adicionar" title="Adicionar">
            <button class='btn-adicionar' id="Adicionar">Adicionar</button></a>
    </div>
</div>

<div class="swiper-container">
    <%= lista%>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<div id="result"></div> <!-- Para mostrar la identificación -->
<script type="text/javascript">
    function eliminar(identificacion) {
        resultado = confirm("Realmente desea eliminar el cliente con identificacion= " + identificacion + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=4.Clientes/clientesActualizar.jsp&accion=Eliminar&identificacion=" + identificacion;
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
    window.onload = function () {
        calcularEdad();
    };

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
        // Obtener el valor de entrada del campo de búsqueda
        let input = document.getElementById('searchInput');
        let filter = input.value.toLowerCase();

        // Obtener la lista de nombres y los elementos de las tarjetas
        let nameList = document.getElementById('nameList');
        let cards = document.getElementsByClassName('card');

        // Iterar sobre todas las tarjetas y filtrar por el texto que se escribió
        for (let i = 0; i < cards.length; i++) {
            // Obtener el nombre dentro de la tarjeta
            let name = cards[i].querySelector('.card-header').innerText;

            if (name.toLowerCase().includes(filter)) {
                cards[i].style.display = "";  // Mostrar tarjeta si coincide
            } else {
                cards[i].style.display = "none";  // Ocultar tarjeta si no coincide
            }
        }
    }
</script>