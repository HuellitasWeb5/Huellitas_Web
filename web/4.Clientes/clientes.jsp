<%-- 
    Document   : clientes
    Created on : 27/05/2024, 03:11:27 PM
    Author     : URB
--%>

<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos(null, null);
for (int i = 0; i < datos.size(); i++) {
        Persona clientes = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + clientes.getIdentificacion() + "</td>";
        lista+="<td>" + clientes.getNombre()+ "</td>";
        lista+="<td>" + clientes.getGeneroPersona()+ "</td>";
        lista+="<td>" + clientes.getEdad()+ "</td>";
        lista+="<td>" + clientes.getEmail()+ "</td>";
        lista+="<td>" + clientes.getTelefono()+ "</td>";
        lista+="<td>" + clientes.getDireccion()+ "</td>";
        lista+="<td>" + clientes.getResidencia()+ "</td>";
        lista+="<td><img src='presentacion/clientes/" + clientes.getFoto() + "' width='30' height='auto'></td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=4.Clientes/clientesFormulario.jsp&accion=Modificar&identificacion=" + clientes.getIdentificacion()+
                " 'title='Modificar'> <button class='btn-adicionar' title='Modificar'> Modificar </button> </a>"; 
        lista+="<button class='btn-eliminar' title='Eliminar' onClick='eliminar("+ clientes.getIdentificacion()+")'>Eliminar</button>";
        lista+="</td>";
        lista+="</tr>";
    }
%>
<h3>SANPATITAS</h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Genero</th><th>Fecha de nacimiento</th><th>Email</th><th>Telefono</th><th>Direccion</th>
        <th>Residencia</th><th>Foto</th>
                <th><a href="principal.jsp?CONTENIDO=4.Clientes/clientesFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <button class='btn-otro' id="Adicionar" >Adicionar</button>  </a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el cliente con identificacion= "+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=4.Clientes/clientesActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
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

    // Llamar a la función al cargar la página si ya hay una fecha de nacimiento
    window.onload = function() {
        calcularEdad();
    };
</script>