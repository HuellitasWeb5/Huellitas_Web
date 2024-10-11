
<%-- 
    Document   : planesPadrinos.jsp
    Created on : 3/09/2024, 09:27:55 AM
    Author     : yanda
--%>
<%@page import="clases.PlanesApadrinamiento" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="presentacion/style-Tarjetas.css">

<%
    PlanesApadrinamiento planes=new PlanesApadrinamiento();
    String lista="";
    List<PlanesApadrinamiento> datos=PlanesApadrinamiento.getListaEnObjetos(null, null);

    // Crear objeto de JavaScript con los datos de tipos de donación
%>

<script>
    const planesP = {};

    <% for (int i = 0; i < datos.size(); i++) {
            planes = datos.get(i);%>
    planesP["<%= planes.getId() %>"] = {
        nombre: "<%= planes.getNombre()%>",
        descripcion: "<%= planes.getDescripcion()%>"
    };
    <% } %>
</script>


<%
    
    for (int i = 0; i < datos.size(); i++) {
        planes = datos.get(i);
        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + planes.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Codigo:</strong> " + planes.getId() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + planes.getDescripcion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario(\"Modificar\", \"" + planes.getId() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + planes.getId() + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>"; 
    }
%>

<h3>PLANES PARA PADRINOS</h3>
<div class="header-container">
        <form id="searchForm">
            <div class="search-container">
                <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
                <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
            </div>
            <ul id="nameList"></ul>
        </form>
        <button class="btn-adicionar" onclick="abrirFormulario('Adicionar');">Agregar Tipo de donacion</button>
    </div>
<div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista %>
            <br><br>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
<div id="formularioPlan" title="Adicionar Planes para Padrinos" >
    <form name="formularioPlanes">
        <table>
            <tr><th>Nombre: </th><td><input type="text" name="Nombre" id="Nombre" required> </td></tr>
            <tr><th>Descripcion: </th><td><input type="text" name="Descripcion" id="Descripcion" required></td></tr>
        </table>
        <input class="btn-adicionar" type="button" value="Agregar" onclick="agregarPlan();">
        <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>
<script type="text/javascript">
    function confirmarEliminacion(id) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesActualizar.jsp&accion=Eliminar&id=" + id;
        }
    }

    $(function () {
        $("#formularioPlan").dialog({
            autoOpen: false,
            width: 500, // Ajusta el ancho 
            height: 200, // Ajusta la altura 
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "explode",
                duration: 1000
            }
        });
    });


    function abrirFormulario(accion, id = null) {
        if (accion === "Modificar") {
            $('#formularioPlan').dialog('option', 'title', 'Modificar Plan de Padripet');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';
        
            document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificar(' + id + ');');


        } else if (accion === "Adicionar") {
            $('#formularioPlan').dialog('option', 'title', 'Adicionar Plan Padripets');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
            document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarPlan();');
          
            document.getElementById('Nombre').value = '';
            document.getElementById('Descripcion').value = '';
        }

        $('#formularioPlan').dialog('open');
    }
    function modificar(id) {
        var nombre = document.getElementById('Nombre').value;
        var descripcion = document.getElementById('Descripcion').value;
        var url = "principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesActualizar.jsp?accion=Modificar&id=" + id + "&Nombre=" + nombre + "&Descripcion=" + descripcion;
        window.location.href = url;
        
        cargarDatos(codigo);
    }
    
    function cargarDatos(codigo) {
        const planes = planesP[codigo];

        if (tipoDonacion) {
            document.getElementById('nombre').value = planes.nombre;
            document.getElementById('descripcion').value = planes.descripcion;
        }
    }
    
    function agregarPlan() {
        var nombre = document.getElementById('Nombre').value;
        var descripcion = document.getElementById('Descripcion').value;
        var url = "principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesActualizar.jsp?accion=Adicionar&Nombre=" + nombre + "&Descripcion=" + descripcion;
        window.location.href = url;
    }

    function cerrarFormulario() {
        document.getElementById("Nombre").value = "";
        document.getElementById("Descripcion").value = "";
        $('#formularioPlan').dialog('close');
    }
    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 4, // Muestra 4 tarjetas a la vez
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        }
    });function filterNames() {
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