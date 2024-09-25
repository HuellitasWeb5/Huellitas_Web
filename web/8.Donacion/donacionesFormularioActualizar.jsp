<%@page import="clases.Donacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    String accion = request.getParameter("accion");
    String descripcion = request.getParameter("descripcion");
    String fecha = request.getParameter("fecha");
    String identificacionDonante = request.getParameter("identificacionDonante");

    Donacion donacion = new Donacion();

    donacion.setDescripcion(descripcion);
    donacion.setFecha(fecha);
    donacion.setIdentificacionDonante(identificacionDonante);
    boolean grabadoConExito = false;

    switch (accion) {
        case "Adicionar":
            grabadoConExito = donacion.grabar(); // Suponiendo que grabar() retorna true si fue exitoso.
            break;
        case "Modificar":
            donacion.setCodigo(request.getParameter("codigo"));
            grabadoConExito = donacion.modificar(); // Similarmente
            break;
        case "Eliminar":
            donacion.setCodigo(request.getParameter("codigo"));
            grabadoConExito = donacion.eliminar();
            break;
    }
    
%>

<script type="text/javascript">
    // Verificamos si la operación fue exitosa y luego llamamos a la función AgregarDonacion
    <% if (grabadoConExito) { %>
        AgregarDonacion();
    <% } %>

    function AgregarDonacion() {
        var codigo = '<%= donacion.getCodigo() %>'; // Obtenemos el código de la donación desde el servidor
        var url = "donacionesFormulario.jsp?accion=Adicionar&codigo=" + codigo;
        window.location.href = url;
    }
</script>
