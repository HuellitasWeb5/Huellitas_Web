<%-- 
    Document   : donacionesFormularioActualizar
    Created on : 6/09/2024, 03:15:29 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.DonacionDetalle"%>
<%@page import="clases.Donacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion = request.getParameter("accion");

    if ("Adicionar".equals(accion)) {
        // Capturar los datos principales de la donación
        String identificacionDonante = request.getParameter("identificacionDonante");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");

        // Crear y guardar la donación principal
        Donacion donacion = new Donacion();
        donacion.setIdentificacionDonante(identificacionDonante);
        donacion.setDescripcion(descripcion);
        donacion.setFecha(fecha);
        boolean resultadoDonacion = donacion.grabar(); // Guarda la donación principal

        // Capturar los detalles (tipo de donación, concepto, cantidad)
        String detalles = request.getParameter("detalles");
        if (resultadoDonacion && detalles != null && !detalles.isEmpty()) {
            String[] detalleArray = detalles.split("\\|\\|"); // Dividir los detalles por cada tarjeta agregada
            for (String detalle : detalleArray) {
                String[] datos = detalle.split("\\|");
                String tipoDonacion = datos[0];
                String conceptoDonacion = datos[1];
                String cantidad = datos[2];

                // Crear y guardar los detalles
                DonacionDetalle donacionDetalle = new DonacionDetalle();
                donacionDetalle.setIdConcepto(conceptoDonacion); // Aquí debes usar el ID, no el nombre
                donacionDetalle.setCantidad(cantidad);
                donacionDetalle.setCodigoDonacion(donacion.getCodigo()); // Asociar al código de la donación
                donacionDetalle.grabar(); // Guardar cada detalle
            }
        }
    }
%>

<script type="text/javascript">
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=8.Donacion/donacionesDetalles.jsp";
</script>
