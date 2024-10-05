<%-- 
        Document   : mascotas
        Created on : 28/08/2024, 08:37:21 AM
        Author     : URB
--%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<% 
    String userRole = (String) session.getAttribute("userRole"); // Obtener el rol del usuario de la sesión
    String lista = "";
    List<Mascota> datos = Mascota.getListaEnObjetos(null, null);
    lista += "<div class='swiper-wrapper'>";
    for (int i = 0; i < datos.size(); i++) {
        Mascota mascotas = datos.get(i);
        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-image'>";
        lista += "<img src='presentacion/mascota/" + mascotas.getFoto() + "' width='auto' height='60' class='profile-image'>";
        lista += "</div>";
        lista += "<div class='card-header'>";
        lista += mascotas.getNombre();
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Código:</strong>" + mascotas.getCodigo() + "</p>";
        lista += "<p><strong>Género:</strong>" + mascotas.getGeneroEnObjeto() + "</p>";
        lista += "<p><strong>Tamaño:</strong>" + mascotas.getTamano() + "</p>";
        lista += "<p><strong>Cuidado:</strong>" + mascotas.getCuidadosEspeciales() + "</p>";
        lista += "<p><strong>Edad aproximada:</strong>" + mascotas.getEdad() + " años</p>";
        lista += "<p><strong>Fecha de ingreso:</strong>" + mascotas.getFechaIngreso() + "</p>";
        lista += "<p><strong>Estado:</strong>" + mascotas.getEstado() + "</p>";
        lista += "<p><strong>Descripción:</strong>" + mascotas.getDescripcion() + "</p>";
        lista += "</div>";
        
        // Mostrar botones de Modificar y Eliminar solo si el rol es "admin del sistema (S)" o "admin de la fundación (F)"
        if (userRole != null && (userRole.equals("S") || userRole.equals("F"))) {
            lista += "<div class='btn-container'>";
            lista += "<a href='principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Modificar&codigo=" + mascotas.getCodigo()
                    + " 'title='Modificar'> <button class='btn-adicionar' title='Modificar'>Modificar</button></a>";
            lista += "<a><button class='btn-eliminar' onClick='eliminar(" + mascotas.getCodigo() + ")'>Eliminar</button></a>";
            lista += "</div>";
        }
        
        lista += "<div class='btn-container'>";
        lista += "<a><button class='btn-otro'>Padripets</button></a>";
        lista += "<a><button class='btn-otro'>Adoptar</button></a>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
    lista += "</div>";
%>

<h3>LISTA DE MASCOTAS</h3>
<div class="header-container">
    <!-- Buscar por nombre -->
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon"> <!-- Cambia la ruta por la de tu icono -->
        </div>
        <ul id="nameList"></ul> <!-- Lista de nombres -->
    </form>
</div>
<!-- Botón de adicionar -->
<div class="btn-container">
    <a href="principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-adicionar">Adicionar</button>
    </a>
</div>



<div class="swiper-container">
    <%= lista%>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>
<div id="result"></div> <!-- Para mostrar la identificación -->
<script type="text/javascript">
    function eliminar(codigo) {
        resultado = confirm("Realmente desea eliminar la mascota con el codigo: " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=3.Mascotas/mascotasActualizar.jsp&accion=Eliminar&codigo=" + codigo;
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
