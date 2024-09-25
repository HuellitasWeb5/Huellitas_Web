<%-- 
    Document   : usuarios
    Created on : 28/08/2024, 09:04:02 AM
    Author     : VALEN
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos("tipo<>'C'", null);
for (int i = 0; i < datos.size(); i++) {
        Persona administrador = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + administrador.getIdentificacion() + "</td>";
        lista+="<td>" + administrador.getNombre()+ "</td>";
        lista+="<td>" + administrador.getGenero() + "</td>";
        lista+="<td>" + administrador.getFechaNacimiento() + "</td>";
        lista+="<td>" + administrador.getEmail()+ "</td>";
        lista+="<td>" + administrador.getTelefono() + "</td>";
        lista+="<td>" + administrador.getDireccion()+ "</td>";
        lista+="<td>" + administrador.getResidencia()+ "</td>";
        lista+="<td><img src='presentacion/administrador/" + administrador.getFoto() + "' width='30' height='auto'></td>";
 
        lista+="<td>" + administrador.getTipoEnObjeto()+ "</td>";
        lista+="<td><a href='principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Modificar&identificacion=" + administrador.getIdentificacion()+
                " 'title='Modificar'> <button title='Modificar'> Modificar </button></a> "; 
        lista+="<button title='Eliminar' onClick='eliminar("+ administrador.getIdentificacion()+")'>Eliminar</button>";
        lista+="</td>";
        lista+="</tr>";
  }
%>

<h3>LISTA  DE  ADMINISTRADORES  </h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Genero</th><th>Edad</th><th>Email</th><th>Telefono</th><th>Dirección</th><th>Residencia</th><th>foto</th><th>Tipo</th>
                <th><a href="principal.jsp?CONTENIDO=5.Administradores/administradoresFormulario.jsp&accion=Adicionar" title="Adicionar  ">
                        <button id="Adicionar">Adicionar</button> </a>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el administrador con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=5.Administradores/administradoresActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
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

    