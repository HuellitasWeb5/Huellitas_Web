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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Donaciones</title>
</head>
<body>

<%
    // Obtener los parámetros del formulario
    String accion = request.getParameter("accion"); // La acción: "Adicionar", "Modificar", "Eliminar"
    String donacionStr = request.getParameter("donacion"); // El campo "donacion" con formato tipoDonacionId|donacionConceptoId|cantidad

    // Verificar que se haya recibido la información correctamente
    if (donacionStr != null && !donacionStr.isEmpty()) {
        // Separar las donaciones si hay múltiples entradas
        String[] donacionesArray = donacionStr.split("\\|\\|");

        // Crear una lista para almacenar los detalles de donación
        List<DonacionDetalle> detallesDonacion = new ArrayList<>();

        // Iterar sobre cada donación y descomponer los valores
        for (String donacionDetalle : donacionesArray) {
            String[] detalle = donacionDetalle.split("\\|");
            String tipoDonacionId = detalle[0]; // ID del tipo de donación
            String conceptoDonacionId = detalle[1]; // ID del concepto de donación
            String cantidad = detalle[2]; // Cantidad de la donación

            // Crear un objeto DonacionDetalle y asignar los valores
            DonacionDetalle detalleDonacion = new DonacionDetalle();
            detalleDonacion.setCodigoTipoDonacion(tipoDonacionId); // Asignar el ID del tipo de donación
            detalleDonacion.setIdConcepto(conceptoDonacionId); // Asignar el ID del concepto de donación
            detalleDonacion.setCantidad((cantidad)); // Convertir la cantidad a número

            // Añadir el detalle a la lista
            detallesDonacion.add(detalleDonacion);
        }

        // Crear una instancia de Donacion (suponiendo que tienes una clase Donacion para manejar la entidad)
        Donacion donacion = new Donacion();


        // Ejecutar la acción según el caso (Adicionar, Modificar, Eliminar)
        switch (accion) {
            case "Adicionar":
                donacion.grabar(); // Graba la donación y sus detalles en la base de datos
                break;
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
    } else {
        out.println("Error: No se recibió información de donación válida.");
    }
%>

<script type="text/javascript">
    // Redirigir al usuario a la página principal después de procesar la acción
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=1.Donacion/donaciones.jsp";
</script>

</body>
</html>
