<%-- 
    Document   : mascotasFormulario
    Created on : 28/08/2024, 09:12:29 AM
    Author     : URB
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
</head>
<%@page import="clases.Mascota"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    Mascota mascota = new Mascota();
    mascota.setCodigo("Por generar");
    if (accion.equals("Modificar")) {
        mascota = new Mascota(codigo);
    }
%>
<h3><%=accion.toUpperCase()%> MASCOTAS</h3>
<div class="card-carousel">
    <div class="card">
        <div class="titulo">
            <h2>DATOS DE LA MASCOTA</h2>
        </div>   
        <div class="card-body">
            <img src="presentacion/mascota/<%=mascota.getFoto()%>" id="foto" class="profile-image">
            <form name="formulario" method="post" action="principal.jsp?CONTENIDO=3.Mascotas/mascotasActualizar.jsp" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="codigo">Codigo:</label>
                    <a><%=mascota.getCodigo()%></a>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" value="<%=mascota.getNombre()%>" size="50" maxlength="50" required>
                </div>
                <div class="form-group">
                    <label for="genero">Genero:</label>
                    <div><%=mascota.getGeneroEnObjeto().getRadioButtons()%></div>
                </div>
                <div class="form-group">
                    <label for="tamano">Tamaño:</label>
                    <div>
                        <select name="tamano" required>
                            <option value="pequeno" <%= mascota.getTamano().equals("pequeno") ? "selected" : ""%>>Pequeño</option>
                            <option value="mediano" <%= mascota.getTamano().equals("mediano") ? "selected" : ""%>>Mediano</option>
                            <option value="grande" <%= mascota.getTamano().equals("grande") ? "selected" : ""%>>Grande</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="foto">Foto:</label>
                    <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();" required>
                </div>
                <div class="form-group">
                    <label for="cuidadosEspeciales">Cuidados Especiales:</label>
                    <input type="text" name="cuidadosEspeciales" value="<%=mascota.getCuidadosEspeciales()%>" maxlength="80" required>
                </div>
                <div class="form-group">
                    <label for="fechaNacimientoAproximada">Fecha Aproximada De Nacimiento:</label>
                    <input type="date" name="fechaNacimientoAproximada" value="<%=mascota.getFechaNacimientoAproximada()%>" required>
                </div>
                <div class="form-group">
                    <label for="fechaIngreso">Fecha De Ingreso:</label>
                    <input type="date" name="fechaIngreso" value="<%=mascota.getFechaIngreso()%>" required>
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select id="estado" name="estado" required>
                        <option value="disponible" <%= mascota.getEstado().equals("disponible") ? "selected" : ""%>>Disponible</option>
                        <option value="apadrinado" <%= mascota.getEstado().equals("apadrinado") ? "selected" : ""%>>Apadrinado</option>
                        <option value="adoptado" <%= mascota.getEstado().equals("adoptado") ? "selected" : ""%>>Adoptado</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea name="descripcion" cols="50" rows="5" maxlength="60" required><%=mascota.getDescripcion()%></textarea>
                </div>
                <div class="btn-container">
                    <input type="hidden" name="codigo" value="<%=mascota.getCodigo()%>">
                    <input type="submit" name="accion" value="<%=accion%>" class="btn-adicionar">
                    <input type="button" value="Cancelar" onClick="window.history.back()" class="btn-eliminar">
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
</script>