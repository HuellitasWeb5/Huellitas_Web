<%-- 
    Document   : donacionesActualizar
    Created on : 6/09/2024, 03:15:29 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.Donacion"%>
<%@page import="clases.DonacionDetalle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    // Inicializar el objeto Donacion
    Donacion donacion = new Donacion();

    String accion = request.getParameter("accion"); // La acción: "Adicionar", "Modificar", "Eliminar"
    String donacionStr = request.getParameter("donacion"); // El campo "donacion" con formato tipoDonacionId|donacionConceptoId|cantidad
    String descripcion = request.getParameter("descripcion");
    String identificacionD = request.getParameter("identificacionD");

   
        // Ejecutar la acción según el caso (Adicionar, Modificar, Eliminar)
        switch (accion) {
            case "Adicionar":
                donacion.setIdentificacionDonante(identificacionD);
                donacion.setDescripcion(descripcion);
                donacion.grabarProcedimientoAlmacenado(donacionStr);                

            case "Modificar":
                donacion.setCodigo(request.getParameter("codigo")); // Obtener el ID de la donación que se va a modificar
                donacion.modificar(); // Modifica la donación y sus detalles en la base de datos
                break;

            case "Eliminar":
                donacion.setCodigo(request.getParameter("codigo")); // Obtener el ID de la donación que se va a eliminar
                donacion.eliminar(); // Elimina la donación y sus detalles en la base de datos
                break;

            default:
                out.println("Acción no válida");
                break;
        }
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=8.Donacion/donaciones.jsp";
</script>