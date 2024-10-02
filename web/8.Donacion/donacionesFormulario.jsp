<%@page import="clases.Donacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Donacion donacion = new Donacion();
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    List<Donacion> datos = donacion.getListaEnObjetos(null, null);
    if ("Modificar".equals(accion)) {
        donacion = new Donacion(codigo);
    }
%>
<center><h3>Agregar Donación Detalle</h3></center>
<style>
    .container {
        width: 50%;
        margin: 0 auto;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        position: relative;
    }
    .header {
        background-color: #003366;
        color: white;
        padding: 10px;
        font-size: 20px;
        text-align: center;
        border-radius: 8px 8px 0 0;
    }
    .close-btn {
        position: absolute;
        top: 10px;
        right: 20px;
        background: none;
        border: none;
        color: white;
        font-size: 24px;
        cursor: pointer;
    }
    .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 15px;
    }
    .form-group label {
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-group input {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #f0f0f0;
    }
    .form-group span{
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #f0f0f0;
        height: 45px;
    }
    .hidden {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease;
    }
</style>

<div class="container">
    <button class="close-btn" onclick="toggleContainer()">−</button>
    <div class="header">Datos del Usuario</div>
    <div class="content">

        <div class="form-group">
            <label>Identificación</label>
            <input type="text" name="identificacionD" id="identificacionD" value="">
        </div>
        <div class="form-group">
            <label for="nombre">Nombre</label>
             <span name="nombre" id="nombre" value="" readonly></span>
        </div>
        <div class="form-group">
            <label for="numero">Número</label>
           <span name="numero" id="numero" value="" readonly></span>
        </div>
        <div class="form-group">
            <label for="direccion">Dirección</label>
           <span name="direccion" id="direccion" value="" readonly></span>
        </div>
        <div class="form-group">
            <label for="correo">Correo Electrónico</label>
            <span type="text" id="correo" value="" readonly></span>
        </div>
    </div>
</div>

<!-- Ventana emergente para el formulario de detalle -->
<div id="formularioDetalle" title="Adicionar Donación Detalle" style="display:none;">
    <form name="formularioDonacionDetalle">
        <table>
            <tr>
                <th>Nombre</th>
                <td><input type="text" name="nombreDetalle" id="nombreDetalle" required></td>
            </tr>
            <tr>
                <th>Tipo</th>
                <td><input type="text" name="tipo" id="tipo" required></td>
            </tr>
            <tr>
                <th>Donación</th>
                <td><input type="text" name="donacionCatalogo" id="donacion" required></td>
            </tr>
            <tr>
                <th>Cantidad</th>
                <td><input type="number" name="cantidad" id="cantidad" value="1" required></td>
            </tr>
        </table>
        <input type="button" value="Agregar" onclick="actualizarTabla();">
        <input type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>

<!-- Tabla para mostrar los detalles de la donación -->
<table id="tablaDonaciones" border="1">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Donación</th>
            <th>Cantidad</th>
        </tr>
    </thead>
    <tbody>
        <!-- Las filas se añadirán aquí dinámicamente -->
    </tbody>
</table>

<div class="filter-container">
    <button class="add-button" onclick="abrirFormularioDetalle();">Adicionar Donación</button>
</div>

<script>
    var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;

    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0] ;
    }
    $("#identificacionD").autocomplete({
        source: vectorPersonas
    });
    
    function buscarPersona(valor, indice) {
        encontrado = false;
        i = 0;
        while (!encontrado) {
            if (valor == personas[i][indice])
                encontrado = true;
            i++;
        }
        if (encontrado)
            return i - 1;
        else
            return false;
    }
    
    $('#identificacionD').change(function () {
        identificacion = this.value.trim();
        indicePersona = buscarPersona(identificacion, 0);
        nombre = personas[indicePersona][1];
        numero = personas[indicePersona][2];
        direccion = personas[indicePersona][3];
        correo = personas[indicePersona][5];

        document.getElementById("nombre").innerHTML = nombre;
        document.getElementById("numero").innerHTML = numero;
        document.getElementById("direccion").innerHTML = direccion;
        document.getElementById("correo").innerHTML = correo;


    });
    
    function toggleContainer() {
        const content = document.querySelector('.content');
        content.classList.toggle('hidden');
    }

    $(document).ready(function () {
        $("#formularioDetalle").dialog({
            autoOpen: false,
            modal: true,
            buttons: {
                "Cerrar": function () {
                    $(this).dialog("close");
                }
            }
        });
    });

    function abrirFormularioDetalle() {
        $("#formularioDetalle").dialog("open");
    }

    function cerrarFormulario() {
        $("#formularioDetalle").dialog("close");
    }

    function actualizarTabla() {
        // Obtener los valores del formulario de detalle
        var nombre = document.getElementById("nombreCatalogo").value;
        var tipo = document.getElementById("tipoCatalogo").value;
        var donacion = document.getElementById("donacionCatalogo").value;
        var cantidad = document.getElementById("cantidad").value;

        // Crear una nueva fila en la tabla
        var tabla = document.getElementById("tablaDonaciones").getElementsByTagName('tbody')[0];
        var nuevaFila = tabla.insertRow();

        // Insertar celdas en la fila
        var celdaNombre = nuevaFila.insertCell(0);
        var celdaTipo = nuevaFila.insertCell(1);
        var celdaDonacion = nuevaFila.insertCell(2);
        var celdaCantidad = nuevaFila.insertCell(3);

        // Asignar los valores a las celdas
        celdaNombre.innerHTML = nombre;
        celdaTipo.innerHTML = tipo;
        celdaDonacion.innerHTML = donacion;
        celdaCantidad.innerHTML = cantidad;

        // Cerrar el formulario
        cerrarFormulario();
    }

    function AgregarDonacion() {
        var identificacionDonante = document.getElementById('identificacionDonante').value;
        var fecha = document.getElementById('fecha').value;
        var descripcion = document.getElementById('descripcion').value;
        var url = "8.Donacion/donacionesFormularioActualizar.jsp?accion=Adicionar&identificacionDonante=" + identificacionDonante + "&fecha=" + fecha + "&descripcion=" + descripcion;
        window.location.href = url;
    }
</script>
