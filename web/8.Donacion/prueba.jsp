 <%@page import="clases.DonacionDetalle"%>
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
    
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    
%>
<center><h3>Agregar Donación Detalle</h3></center>


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