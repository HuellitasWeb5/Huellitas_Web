<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">
</head>

<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Obtener el usuario actual de la sesión
    HttpSession sesion = request.getSession();
    Persona usuarioActual = (Persona) sesion.getAttribute("usuario");

    if (usuarioActual == null) {
        // Redirigir a la página de inicio de sesión si el usuario no está autenticado
        response.sendRedirect("index-InicioSesion.jsp");
        return;
    }

    // Verificar si se han actualizado los datos del usuario
    if (request.getParameter("accion") != null && request.getParameter("accion").equals("Modificar")) {
        // Obtener los datos modificados del formulario (simulando que ya se modificaron)
        String nombre = request.getParameter("nombre");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String residencia = request.getParameter("residencia");

        // Actualizar el objeto usuarioActual con los nuevos datos
        usuarioActual.setNombre(nombre);
        usuarioActual.setEmail(email);
        usuarioActual.setTelefono(telefono);
        usuarioActual.setDireccion(direccion);
        usuarioActual.setResidencia(residencia);

        // Guardar los cambios en la sesión (o en la base de datos según tu lógica de persistencia)
        sesion.setAttribute("usuario", usuarioActual);

        // Redirigir a la misma página para reflejar los cambios
        response.sendRedirect("perfil.jsp");
    }
%>

<div class="card-carousel">
    <div class="card">
        <div class="card-header">
            <h2>TUS DATOS SANPATITAS</h2>
        </div>
        <div class="card-body">
            <!-- Mostrar la foto del usuario -->
            <img src="presentacion/clientes/<%=usuarioActual.getFoto()%>" id="foto" class="profile-image">

            <p><strong><%= usuarioActual.getNombre()%></strong></p>
            <p><strong>Identificación:</strong><%= usuarioActual.getIdentificacion()%> </p>
            <p><strong>Género:</strong><%= usuarioActual.getGeneroPersona()%> </p>
            <p><strong>Edad:</strong><%= usuarioActual.getEdad()%> años</p>
            <p><strong>Email:</strong><%= usuarioActual.getEmail()%> </p>
            <p><strong>Teléfono:</strong><%= usuarioActual.getTelefono()%> </p>
            <p><strong>Dirección:</strong><%= usuarioActual.getDireccion()%> </p>
            <p><strong>Residencia:</strong><%= usuarioActual.getResidencia()%> </p>
        </div>
        <div class='btn-container'>
            <a href='principal.jsp?CONTENIDO=91.PerfilAdministradorF/perfilFormulario.jsp&accion=Modificar&identificacion=<%= usuarioActual.getIdentificacion()%>' title='Modificar'>
                <button class='btn-adicionar' title='Modificar'> Modificar </button>
            </a>
            <button class='btn-eliminar' title='Eliminar' onClick='eliminar(<%= usuarioActual.getIdentificacion()%>)'>Eliminar</button>
        </div>
    </div>
</div>
<script>
   
    function eliminar(identificacion) {
        resultado = confirm("Realmente desea eliminar tu cuenta?"+identificacion);
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=91.PerfilAdministradorF/perfilActualizar.jsp&accion=Eliminar&identificacion=" + identificacion;
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

    
    window.onload = function () {
        calcularEdad();
    };
</script>
