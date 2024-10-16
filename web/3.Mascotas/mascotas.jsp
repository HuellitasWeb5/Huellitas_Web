<%-- 
        Document   : mascotas
        Created on : 28/08/2024, 08:37:21 AM
        Author     : URB
--%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<%
    // Recibir el parámetro "nombre" desde la URL
    String nombreTipoPersona = request.getParameter("nombre");

    // Si el parámetro no se recibe, asumir que es "Cliente" por defecto
    if (nombreTipoPersona == null) {
        nombreTipoPersona = "Cliente";
    }
%>

<%
    // Generar la lista de mascotas según el tipo de usuario
    String lista = "";
    List<Mascota> datos = Mascota.getListaEnObjetos(null, null);
    lista += "<div class='swiper-wrapper'>";

    for (int i = 0; i < datos.size(); i++) {
        Mascota mascota = datos.get(i);

        // Filtrar mascotas según el tipo de usuario
        boolean mostrarMascota = true;
        if ("Cliente".equals(nombreTipoPersona)) {
            // Si es un cliente, solo mostrar las mascotas disponibles y apadrinadas
            if (!mascota.getEstado().equalsIgnoreCase("disponible") && 
                !mascota.getEstado().equalsIgnoreCase("apadrinado")) {
                mostrarMascota = false;
            }
        }

        if (mostrarMascota) {
            lista += "<div class='swiper-slide'>";
            lista += "<div class='card'>";
            lista += "<div class='card-image'>";
            lista += "<img src='presentacion/mascota/" + mascota.getFoto() + "' width='auto' height='60' class='profile-image'>";
            lista += "</div>";
            lista += "<div class='card-header'>";
            lista += mascota.getNombre();
            lista += "</div>";
            lista += "<div class='card-body'>";
            lista += "<p><strong>Código:</strong>" + mascota.getCodigo() + "</p>";
            lista += "<p><strong>Género:</strong>" + mascota.getGeneroEnObjeto() + "</p>";
            lista += "<p><strong>Tamaño:</strong>" + mascota.getTamano() + "</p>";
            lista += "<p><strong>Cuidado:</strong>" + mascota.getCuidadosEspeciales() + "</p>";
            lista += "<p><strong>Edad aproximada:</strong>" + mascota.getEdad() + " años</p>";
            lista += "<p><strong>Fecha de ingreso:</strong>" + mascota.getFechaIngreso() + "</p>";
            lista += "<p><strong>Estado:</strong>" + mascota.getEstado() + "</p>";
            lista += "<p><strong>Descripción:</strong>" + mascota.getDescripcion() + "</p>";
            lista += "</div>";

            // Solo mostrar los botones de Modificar y Eliminar si NO es un cliente
            if (!"Cliente".equals(nombreTipoPersona)) {
                lista += "<div class='btn-container'>";
                lista += "<a href='principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Modificar&codigo=" + mascota.getCodigo() + "&nombre=" + nombreTipoPersona
                        + " 'title='Modificar'> <button class='btn-adicionar' title='Modificar'>Modificar</button></a>";
                lista += "<a><button class='btn-eliminar' onClick='eliminar(" + mascota.getCodigo() + ")'>Eliminar</button></a>";
                lista += "</div>";
            }

            // Estos botones siempre se muestran
            lista += "<div class='btn-container'>";
            lista += "<a class='nav-link' href='principal.jsp?CONTENIDO=9.Perfil/padrinosFormulario.jsp&accion=Adicionar'><button class='btn-otro'>Apadrinar</button></a>";
            lista += "<a class='nav-link' href='principal.jsp?CONTENIDO=9.Perfil/formularioInformacion.jsp&accion=Adicionar'><button class='btn-otro'>Adoptar</button></a>";
            lista += "</div>";
            lista += "</div>";
            lista += "</div>";
        }
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
    <div class="btn-container">
            <a href="principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Adicionar">
                <button id="Adicionar" class="btn-adicionar">Adicionar</button>
            </a>
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
