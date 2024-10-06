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

    // Imprimir la acción recibida para depuración
    System.out.println("Acción recibida: " + accion);

    // Imprimir la cadena completa de donaciones recibida
    System.out.println("Donaciones recibidas: " + donacionStr);

    // Verificar que se haya recibido la información correctamente
    if (donacionStr != null && !donacionStr.isEmpty()) {
        // Separar las donaciones si hay múltiples entradas
        String[] donacionesArray = donacionStr.split("\\|\\|");

        // Crear una lista para almacenar los detalles de donación
        List<DonacionDetalle> detallesDonacion = new ArrayList<>();

        // Iterar sobre cada donación y descomponer los valores
        for (String donacionDetalle : donacionesArray) {
            String[] detalle = donacionDetalle.split("\\|");

            // Asegurarse de que el array detalle tiene el tamaño adecuado
            if (detalle.length == 3) {
                String tipoDonacionId = detalle[0]; // ID del tipo de donación
                String conceptoDonacionId = detalle[1]; // ID del concepto de donación
                String cantidad = detalle[2]; // Cantidad de la donación

                // Imprimir los valores descompuestos para depuración
                System.out.println("Tipo de donación ID: " + tipoDonacionId);
                System.out.println("Concepto de donación ID: " + conceptoDonacionId);
                System.out.println("Cantidad: " + cantidad);

                // Crear un objeto DonacionDetalle y asignar los valores
                DonacionDetalle detalleDonacion = new DonacionDetalle();
                detalleDonacion.setCodigoTipoDonacion(tipoDonacionId); // Asignar el ID del tipo de donación
                detalleDonacion.setIdConcepto(conceptoDonacionId); // Asignar el ID del concepto de donación
                detalleDonacion.setCantidad(cantidad); // Asignar la cantidad como cadena (o convertirla a número si es necesario)

                // Añadir el detalle a la lista
                detallesDonacion.add(detalleDonacion);
            } else {
                // Si el formato de la donación no es correcto, imprimir un mensaje de error
                System.out.println("Formato de donación incorrecto: " + donacionDetalle);
            }
        }

        donacion.setDescripcion(descripcion);
        donacion.setIdentificacionDonante(identificacionD);

        // Ejecutar la acción según el caso (Adicionar, Modificar, Eliminar)
        switch (accion) {
            case "Adicionar":
                // Grabar la donación principal en la base de datos
                donacion.grabar(); 

                // Obtener el ID de la donación recién creada
                String donacionId = donacion.getCodigo();

                // Grabar cada detalle de donación con el ID de la donación principal
                for (DonacionDetalle detalleDonacion : detallesDonacion) {
                    detalleDonacion.set(donacionId); // Asignar el ID de la donación principal
                    detalleDonacion.grabar(); // Grabar el detalle en la base de datos
                }
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
