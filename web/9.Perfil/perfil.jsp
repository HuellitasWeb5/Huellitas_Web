<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css"> <!-- Aseg�rate de tener el archivo CSS -->
</head>

<%
    // Obtener la lista de perfiles, ajustando la consulta seg�n sea necesario
    List<Persona> datosPerfil = Persona.getListaEnObjetos("tipo='C'", null);
%>

<h3>LISTA DE PERFILES</h3>



<!-- Estructura de Swiper para las tarjetas -->
<div class="swiper-container">
    <div class="swiper-wrapper">
        <%
        // Generar din�micamente las tarjetas para cada perfil
        for (int i = 0; i < datosPerfil.size(); i++) {
            Persona perfil = datosPerfil.get(i);
        %>
        <div class="swiper-slide">
            <div class="card">
                <div class="card-image">
                    <img src="presentacion/perfil/<%= perfil.getFoto() %>" alt="Foto de <%= perfil.getNombre() %>" class="profile-image">
                </div>
                <div class="card-header">
                    <%= perfil.getNombre() %>
                </div>
                <div class="card-subtitle">
                    <p><%= perfil.getTipoEnObjeto().getNombre() %></p>
                </div>
                <div class="card-body">
                    <p><strong>Identificaci�n:</strong> <%= perfil.getIdentificacion() %></p>
                    <p><strong>G�nero:</strong> <%= perfil.getGenero() %></p>
                    <p><strong>Edad:</strong> <%= perfil.getEdad() %></p>
                    <p><strong>Email:</strong> <%= perfil.getEmail() %></p>
                    <p><strong>Tel�fono:</strong> <%= perfil.getTelefono() %></p>
                    <p><strong>Direcci�n:</strong> <%= perfil.getDireccion() %></p>
                    <p><strong>Residencia:</strong> <%= perfil.getResidencia() %></p>
                </div>
                <div class="btn-container">
                    <a href="perfilFormulario.jsp?accion=Modificar&identificacion=<%= perfil.getIdentificacion() %>">
                        <button class="btn-modificar">Modificar</button>
                    </a>
                    <button class="btn-eliminar" onClick="eliminar(<%= perfil.getIdentificacion() %>)">Eliminar</button>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Botones de navegaci�n de Swiper -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<!-- Resultados -->
<div id="result"></div>

<!-- Scripts -->
<script type="text/javascript">
    function eliminar(identificacion) {
        var resultado = confirm("Realmente desea eliminar el perfil con identificaci�n " + identificacion + "?");
        if (resultado) {
            document.location = "perfilActualizar.jsp?accion=Eliminar&identificacion=" + identificacion;
        }
    }

    // Inicializar Swiper.js
    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 3, // Mostrar 3 perfiles por vista
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });

    // Filtrar los nombres en las tarjetas
    function filterNames() {
        let input = document.getElementById('searchInput').value.toLowerCase();
        let cards = document.getElementsByClassName('card');
        
        for (let i = 0; i < cards.length; i++) {
            let name = cards[i].querySelector('.card-header').innerText.toLowerCase();
            if (name.includes(input)) {
                cards[i].style.display = ""; // Mostrar tarjeta si coincide
            } else {
                cards[i].style.display = "none"; // Ocultar tarjeta si no coincide
            }
        }
    }

    // Mostrar informaci�n del perfil seleccionado
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('click', function() {
            const name = this.querySelector('.card-header').innerText;
            const id = this.dataset.id; // Obtener la identificaci�n de la tarjeta
            alert(`Nombre: ${name}, ID: ${id}`);
        });
    });
</script>
