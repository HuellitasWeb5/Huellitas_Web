<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
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
<style>
    body{
        text-align: center;
    }
</style>
<div class="card-carousel">
    <div class="card">
        <div class="card-header">
            <h2>TUS DATOS SANPATITAS</h2>
        </div>
        <div class="card-body">
            <!-- Mostrar la foto del usuario -->
            <img src="presentacion/clientes/<%=usuarioActual.getFoto()%>" id="foto" class="profile-image">

            <div class="form-group">
                <label for="identificacion">Identificación:</label>
                <input type="text" name="identificacion" id="identificacion" value="<%=usuarioActual.getIdentificacion()%>" readonly>
            </div>

            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="<%=usuarioActual.getNombre()%>" readonly>
            </div>

            <div class="form-group">
                <label for="genero">Género:</label>
                <input type="text" name="genero" id="genero" value="<%=usuarioActual.getGeneroPersona()%>" readonly>
            </div>

            <div class="form-group">
                <label for="edad">Edad:</label>
                <input type="text" name="edad" id="edad" value="<%=usuarioActual.getEdad()%> años" readonly>
            </div>

            <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="text" name="email" id="email" value="<%=usuarioActual.getEmail()%>" readonly>
            </div>

            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" name="telefono" id="telefono" value="<%=usuarioActual.getTelefono()%>" readonly>
            </div>

            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" name="direccion" id="direccion" value="<%=usuarioActual.getDireccion()%>" readonly>
            </div>

            <div class="form-group">
                <label for="residencia">Residencia:</label>
                <input type="text" name="residencia" id="residencia" value="<%=usuarioActual.getResidencia()%>" readonly>
            </div>
        </div>
        <div class='btn-container'>
            <a href='principal.jsp?CONTENIDO=9.Perfil/perfilFormulario.jsp&accion=Modificar&identificacion=<%= usuarioActual.getIdentificacion()%>' title='Modificar'>
                <button class='btn-adicionar' title='Modificar'> Modificar </button>
            </a>
            <button class='btn-eliminar' title='Eliminar' onClick='eliminar(<%= usuarioActual.getIdentificacion()%>)'>Eliminar</button>
        </div>
    </div>
</div>
<script>

    function eliminar(identificacion) {
        resultado = confirm("Realmente desea eliminar tu cuenta?" + identificacion);
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=9.Perfil/perfilActualizar.jsp&accion=Modificar&identificacion=&identificacion=" + identificacion;
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
