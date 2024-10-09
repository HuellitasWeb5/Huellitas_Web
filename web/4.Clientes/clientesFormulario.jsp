<%-- 
    Document   : clientesFormulario
    Created on : 27/05/2024, 03:20:46 PM
    Author     : URB
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">
</head>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String identificacion=request.getParameter("identificacion");
Persona clientes=new Persona();
if (accion.equals("Modificar")) {
        clientes=new Persona(identificacion);
    }
%>
<h3><%=accion.toUpperCase() %> SANPATITAS</h3>
<div class="card-carousel">
    <div class="card">
        <div class="card-header">
            <h2>DATOS DE NUESTRO SANPATITAS</h2>
        </div>
        <div class="card-body">
            <img src="presentacion/clientes/<%=clientes.getFoto()%>" id="foto" class="profile-image">
            <form name="formulario" method="post" action="principal.jsp?CONTENIDO=4.Clientes/clientesActualizar.jsp" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="identificacion">Identificación:</label>
                    <input type="text" name="identificacion" id="identificacion" maxlength="12" value="<%=clientes.getIdentificacion()%>" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" value="<%=clientes.getNombre()%>" size="50" maxlength="50" required>
                </div>
                <div class="form-group">
                    <label>Género:</label>
                    <div><%=clientes.getGeneroEnObjeto().getRadioButtons() %></div>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha De Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="<%=clientes.getFechaNacimiento()%>" required onchange="calcularEdad()">
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" name="email" id="email" value="<%=clientes.getEmail() %>" maxlength="80" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" name="telefono" id="telefono" value="<%=clientes.getTelefono()%>" maxlength="12" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" name="direccion" id="direccion" value="<%=clientes.getDireccion() %>" size="50" maxlength="100" required>
                </div>
                <div class="form-group">
                    <label for="residencia">Residencia:</label>
                    <input type="text" name="residencia" id="residencia" value="<%=clientes.getResidencia() %>" size="50" maxlength="100" required>
                </div>
                <div class="form-group">
                    <label for="foto">Foto:</label>
                    <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();" required>
                </div>
                <div class="form-group">
                    <label for="clave">Contraseña:</label>
                    <input type="password" name="clave" id="clave" required>
                </div>
                <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
                <div class="btn-container">
                    <input class='btn-adicionar'  type="submit" name="accion" value="<%=accion%>" class="btn-adicionar">
                    <input class='btn-eliminar' type="button" value="Cancelar" onClick="window.history.back()" class="btn-cancelar">
                </div>
            </form>
        </div>
    </div>
</div>
<script> 
    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
</script>
