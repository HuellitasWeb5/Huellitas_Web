<%-- 
    Document   : clientesFormulario
    Created on : 27/05/2024, 03:20:46 PM
    Author     : URB
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
    <link rel="stylesheet" href="presentacion/style-Registrarse.css">
</head>
<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    String identificacion = request.getParameter("identificacion");
    Persona clientes = new Persona();
%>
<body>
    <div class="logo-container">
        <img src="presentacion/imagenes/Logo-Fundacion.png" alt="Logo Izquierdo" class="logo logo-left">
        <img src="presentacion/imagenes/Logo.png" alt="Logo Derecho" class="logo logo-right">
    </div>
    <div class="fondo-container">
        <img src="presentacion/imagenes/fondoVillaEsperanza.jpg" class="fondoVE">
    </div>
    <div class="card-carousel">
        <div class="container">
            <div class="card-header">
                <h2>Registra Tus Datos Personales</h2>
            </div>
            <div class="card-body">
                <img src="presentacion/clientes/<%=clientes.getFoto()%>" id="foto" class="profile-image">
                <form name="formulario" method="post" action="registrarseActualizar.jsp" enctype="multipart/form-data" onsubmit="return validarContraseña();">
                    <div class="form-container">
                        <div class="form-group">
                            <label for="identificacion">Identificación:</label>
                            <input type="text" name="identificacion" id="identificacion" maxlength="12" required>
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" name="nombre" id="nombre" size="50" maxlength="50" required>
                        </div>
                        <div class="form-group">
                            <label>Género:</label>
                            <div><%=clientes.getGeneroEnObjeto().getRadioButtons()%></div>
                        </div>
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha de nacimiento:</label>
                            <input type="date" id="fechaNacimiento" name="fechaNacimiento" required onchange="calcularEdad()">
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" name="email" id="email" maxlength="80" required>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="number" name="telefono" id="telefono" maxlength="12" required>
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <input type="text" name="direccion" id="direccion" size="50" maxlength="100" required>
                        </div>
                        <div class="form-group">
                            <label for="residencia">Residencia: (Ciudad-Municipio)</label>
                            <input type="text" name="residencia" id="residencia" size="50" maxlength="100" required>
                        </div>
                        <div class="form-group">
                            <label for="foto">Foto de perfil:</label>
                            <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
                        </div>
                        <div class="form-group">
                            <label for="clave">Contraseña:</label>
                            <input type="password" name="clave" id="clave" required onkeyup="mostrarRequisitos();">
                        </div>
                        <div class="form-group">
                            <label for="confirmarClave">Confirmar contraseña:</label>
                            <input type="password" name="confirmarClave" id="confirmarClave" required onkeyup="verificarCoincidencia();">
                        </div>
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
                    <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
                    <div class="btn-container">
                        <input class='btn-adicionar1' type="submit" name="accion" value="Adicionar">
                        <input class='btn-eliminar1' type="submit" value="Cancelar" onClick="window.history.back()">
                    </div>
                </form>
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
</body>
