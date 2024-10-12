<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
</head>
<%
    String accion = request.getParameter("accion");
    String identificacion = request.getParameter("identificacion");
    Persona administrador = new Persona();
    if (accion.equals("Modificar")) {
        administrador = new Persona(identificacion);
    }
%>

<h3><%= accion.toUpperCase()%> ADMINISTRADOR </h3>

<div class="card-carousel">
    <div class="card">
        <div class="titulo">
            <h2>DATOS DEL ADMINISTRADOR</h2>
        </div>
        <div class="card-body">
            <img src="presentacion/administrador/<%=administrador.getFoto()%>" id="foto" class="profile-image">
            <form name="formulario" method="post" action="principal.jsp?CONTENIDO=5.Administradores/administradoresActualizar.jsp" enctype="multipart/form-data" onsubmit="return validarContraseña();">
                <div class="form-group">
                    <label for="identificacion">Identificación:</label>
                    <input type="text" name="identificacion" id="identificacion" maxlength="12" value="<%=administrador.getIdentificacion()%>" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" value="<%=administrador.getNombre()%>" size="50" maxlength="50" required>
                </div>
                <div class="form-group">
                    <label>Género:</label>
                    <div><%=administrador.getGeneroEnObjeto().getRadioButtons()%></div>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha De Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="<%=administrador.getFechaNacimiento()%>" required onchange="calcularEdad()">
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" name="email" id="email" value="<%=administrador.getEmail()%>" maxlength="80" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" name="telefono" id="telefono" value="<%=administrador.getTelefono()%>" maxlength="12" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" name="direccion" id="direccion" value="<%=administrador.getDireccion()%>" size="50" maxlength="100" required>
                </div>
                <div class="form-group">
                    <label for="residencia">Residencia:</label>
                    <input type="text" name="residencia" id="residencia" value="<%=administrador.getResidencia()%>" size="50" maxlength="100" required>
                </div>
                <div class="form-group">
                    <label for="foto">Foto:</label>
                    <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
                </div>
                <div class="form-group">
                    <label for="tipo">Rol:</label>
                    <select class="recuadro" name="tipo" id="tipo"><%=administrador.getTipoEnObjeto().getListaEnOptions()%></select>
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
            </form>
        </div>
        <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
        <div class="btn-container">
            <input class='btn-adicionar' type="submit" name="accion" value="<%=accion%>" class="btn-adicionar">
            <input class='btn-eliminar' type="button" value="Cancelar" onClick="window.history.back()" class="btn-cancelar">
        </div>
    </div>
</div>

<script>
    function mostrarFoto() {
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend = function () {
            document.getElementById("foto").src = lector.result;
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

