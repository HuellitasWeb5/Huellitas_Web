<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">
    <script>
        function mostrarFoto() {
            var lector = new FileReader();
            lector.readAsDataURL(document.formulario.foto.files[0]);
            lector.onloadend = function() {
                document.getElementById("foto").src = lector.result;
            }
        }
    </script>
</head>
<%
String accion = request.getParameter("accion");
String identificacion = request.getParameter("identificacion");
Persona administrador = new Persona();
if (accion.equals("Modificar")) {
    administrador = new Persona(identificacion);
}
%>

<h3><%= accion.toUpperCase() %> ADMINISTRADOR </h3>

<div class="card-carousel">
    <div class="card">
        <div class="card-header">
            <h2>DATOS DEL ADMINISTRADOR</h2>
        </div>
        <div class="card-body">
            <img src="presentacion/administrador/<%=administrador.getFoto()%>" id="foto" class="profile-image">
            <form name="formulario" method="post" action="principal.jsp?CONTENIDO=5.Administradores/administradoresActualizar.jsp" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="identificacion">Identificación:</label>
                    <input type="text" name="identificacion" id="identificacion" maxlength="12" value="<%=administrador.getIdentificacion()%>" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" value="<%=administrador.getNombre()%>" size="50" maxlength="50">
                </div>
                <div class="form-group">
                    <label>Género:</label>
                    <div><%=administrador.getGeneroEnObjeto().getRadioButtons() %></div>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha De Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="<%=administrador.getFechaNacimiento()%>" required onchange="calcularEdad()">
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="text" name="email" id="email" value="<%=administrador.getEmail() %>" maxlength="80" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" name="telefono" id="telefono" value="<%=administrador.getTelefono()%>" maxlength="12">
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" name="direccion" id="direccion" value="<%=administrador.getDireccion() %>" size="50" maxlength="100">
                </div>
                <div class="form-group">
                    <label for="residencia">Residencia:</label>
                    <input type="text" name="residencia" id="residencia" value="<%=administrador.getResidencia() %>" size="50" maxlength="100">
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
                    <input type="password" name="clave" id="clave" required>
                </div>
                <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
                <div class="btn-container">
                    <input class="btn-adicionar" type="submit" name="accion" value="<%=accion%>">
                    <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">
                </div>
            </form>
        </div>
    </div>
</div>