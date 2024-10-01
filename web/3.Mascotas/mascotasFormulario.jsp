<%-- 
    Document   : mascotasFormulario
    Created on : 28/08/2024, 09:12:29 AM
    Author     : URB
--%>
<head>
    <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">
</head>
<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
String accion=request.getParameter("accion");
String codigo=request.getParameter("codigo");
Mascota mascota=new Mascota();
mascota.setCodigo("codigo");
if (accion.equals("Modificar")) {
        mascota=new Mascota(codigo);
    }
%>

<h3><%=accion.toUpperCase() %> MASCOTAS</h3>
<table border="0"><tr><td>

<form name="formulario" method="post" action="principal.jsp?CONTENIDO=3.Mascotas/mascotasActualizar.jsp" enctype="multipart/form-data">
    <table border="0">
        <tr>
            <th>Código</th><td><%=mascota.getCodigo()%></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombre" value="<%=mascota.getNombre()%>" size="50" maxlength="50" required></td>
        </tr>
        <tr>
            <th>Género</th><td><%=mascota.getGeneroEnObjeto().getRadioButtons() %></td>
        </tr>
        <tr>
            <th>Tamaño</th><td><select name="tamano" required>
            <option value="pequeno">Pequeño</option>
            <option value="mediano">Mediano</option>
            <option value="grande">Grande</option>
        </select></td>
        </tr>
        <tr>
            <th>Foto</th>
            <td> <input type="file" name="foto" accept="image/*" value="<%=mascota.getFoto()%>" onchange="mostrarFoto();" >
        </tr>
        <tr>
            <th>Cuidados Especiales</th>

            <td><input type="text" name="cuidadosEspeciales" value="<%=mascota.getCuidadosEspeciales()%>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>Fecha Aproximada De Nacimiento</th>
            <td><input type="date" name="fechaNacimientoAproximada" value="<%=mascota.getFechaNacimientoAproximada()%>" required></td>
        </tr>
        <tr>
            <th>Fecha De Ingreso</th>
            <td><input type="date" name="fechaIngreso" value="<%=mascota.getFechaIngreso()%>" required></td>
        </tr>
        <tr>
            <th>Estado</th>
            <td><select id="estado" name="estado"  required>
            <option value="disponible">Disponible</option>
            <option value="apadrinado">Apadrinado</option>
            <option value="adoptado">Adoptado</option>
        </select>
        </tr>
        <tr>
            <th>Descripcion</th>
            <td>
                <textarea name="descripcion" cols="50" rows="5" maxlength="60"  required><%=mascota.getDescripcion()%></textarea>
            </td>
        </tr>
        
    </table>
    <input type="hidden" name="codigo" value="<%=codigo%>">
    <input class='btn-adicionar' type="submit" name="accion" value="<%=accion %>">
    <input class='btn-eliminar' type="button" value="Cancelar" onClick="window.history.back()">
</form>
    </td><td><img src="presentacion/mascota/<%=mascota.getFoto()%>" id="foto" width="auto" height="250"></td></table>
<script> 
    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
</script>
