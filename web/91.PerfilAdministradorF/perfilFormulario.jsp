<%-- 
    Document   : clientesFormulario
    Created on : 27/05/2024, 03:20:46 PM
    Author     : URB
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
</head>
<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%   
    String identificacion=request.getParameter("identificacion");
    // Obtener el usuario actual de la sesión
    HttpSession sesion = request.getSession();
    Persona usuarioActual = (Persona) sesion.getAttribute("usuario");

    if (usuarioActual == null) {
        // Redirigir a la página de inicio de sesión si el usuario no está autenticado
        response.sendRedirect("index-InicioSesion.jsp");
        return;
    }
%>

<div class="card-carousel">
    <div class="card">
        <div class="titulo">
            <h2>MODIFICA TUS DATOS SANPATITAS</h2>
        </div>
        <div class="card-body">
            <form name="formulario" method="post" action="principal.jsp?CONTENIDO=91.PerfilAdministradorF/perfilActualizar.jsp" enctype="multipart/form-data" onsubmit="return validarContraseña();">
                <!-- Mostrar la foto del usuario -->
                <img src="presentacion/clientes/<%=usuarioActual.getFoto() != null ? usuarioActual.getFoto() : "default.jpg"%>" id="foto" class="profile-image">

                <!-- Permitir la modificación de los datos del usuario -->
                <div class="form-group">
                    <label for="identificacion">Identificación:</label>
                    <input type="text" id="identificacion" name="identificacion" value="<%=usuarioActual.getIdentificacion()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%=usuarioActual.getNombre()%>">
                </div>
                <div class="form-group">
                    <label>Género:</label>
                    <div><%=usuarioActual.getGeneroEnObjeto().getRadioButtons() %></div>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha De Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento"  value="<%=usuarioActual.getFechaNacimiento()%>" onchange="calcularEdad()" required >

                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" id="email" name="email" value="<%=usuarioActual.getEmail()%>">
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" id="telefono" name="telefono" value="<%=usuarioActual.getTelefono()%>">
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" value="<%=usuarioActual.getDireccion()%>">
                </div>
                <div class="form-group">
                    <label for="residencia">Residencia:</label>
                    <input type="text" id="residencia" name="residencia" value="<%=usuarioActual.getResidencia()%>">
                </div>
                <div class="form-group">
                    <label for="foto">Foto:</label>
                    <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
                </div>
                <div class="form-group">
                    <label for="clave">Contraseña:</label>
                    <input type="password" name="clave" id="clave" required onkeyup="mostrarRequisitos();">
                </div>
                <div class="form-group">
                    <label for="confirmarClave">Confirmar Contraseña:</label>
                    <input type="password" name="confirmarClave" id="confirmarClave" required onkeyup="verificarCoincidencia();">
                </div>
                <div id="requisitosClave">
                    <p>La contraseña debe cumplir los siguientes requisitos:</p>
                    <ul>
                        <li id="minimoCaracteres">Al menos 8 caracteres</li>
                        <li id="letraMayuscula">Al menos una letra mayúscula</li>
                        <li id="letraMinuscula">Al menos una letra minúscula</li>
                        <li id="numero">Al menos un número</li>
                        <li id="coincidencia">Las contraseñas deben coincidir</li>
                    </ul>
                </div>
                <!-- Botón para guardar los cambios -->
                <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
                <div class='btn-container'>
                    
                    <button type="submit" class="btn-adicionar" name="accion"  onclick="modificar('<%= usuarioActual.getIdentificacion() %>')"  value="Modificar">Modificar</button>

                    <input class='btn-eliminar' type="button" value="Cancelar" onClick="window.history.back()" class="btn-cancelar">
                    <!-- Botón para eliminar con llamada a una función JavaScript -->
                    </div>
            </form>
        </div>
    </div>
</div>

<!-- JavaScript para la función de eliminación -->
<script>

    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
    function modificar(identificacion) {
        resultado = confirm("Tus datos han sido modificados, deberas iniciar sesion de nuevo");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=9.Perfil/perfilActualizar.jsp&accion=Modificar&identificacion=" + identificacion;
        }
    }
function mostrarRequisitos() {
        const clave = document.getElementById("clave").value;
        document.getElementById("minimoCaracteres").style.color = clave.length >= 8 ? "green" : "red";
        document.getElementById("letraMayuscula").style.color = /[A-Z]/.test(clave) ? "green" : "red";
        document.getElementById("letraMinuscula").style.color = /[a-z]/.test(clave) ? "green" : "red";
        document.getElementById("numero").style.color = /\d/.test(clave) ? "green" : "red";
    }

    function verificarCoincidencia() {
        const clave = document.getElementById("clave").value;
        const confirmarClave = document.getElementById("confirmarClave").value;
        document.getElementById("coincidencia").style.color = (clave === confirmarClave) ? "green" : "red";
    }

    function validarContraseña() {
        const clave = document.getElementById("clave").value;
        const confirmarClave = document.getElementById("confirmarClave").value;

        let mensajeError = '';

        // Verificar requisitos de la contraseña
        if (clave.length < 8) {
            mensajeError += 'La contraseña debe tener al menos 8 caracteres.\n';
        }
        if (!/[A-Z]/.test(clave)) {
            mensajeError += 'La contraseña debe contener al menos una letra mayúscula.\n';
        }
        if (!/[a-z]/.test(clave)) {
            mensajeError += 'La contraseña debe contener al menos una letra minúscula.\n';
        }
        if (!/\d/.test(clave)) {
            mensajeError += 'La contraseña debe contener al menos un número.\n';
        }
        if (clave !== confirmarClave) {
            mensajeError += 'Las contraseñas no coinciden.\n';
        }

        // Si hay errores, mostrar la alerta y evitar el envío del formulario
        if (mensajeError !== '') {
            alert(mensajeError);
            return false; // Evitar que el formulario se envíe
        }

        return true; // Permitir que el formulario se envíe si todo está correcto
    }
</script>
