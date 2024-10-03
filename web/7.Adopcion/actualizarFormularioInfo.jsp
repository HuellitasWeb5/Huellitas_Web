<%-- 
    Document   : actualizarFormularioInfo
    Created on : 1 oct 2024, 23:02:13
    Author     : Angie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="clases.ConectorBD" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>

<%
    // Obtener los parámetros del formulario que se envían desde la página anterior
    String idFormulario = request.getParameter("idFormulario");
    String identificacionAdoptante = request.getParameter("identificacionAdoptante");
    String codigoMascota = request.getParameter("codigoMascota");
    String nuevaInformacion = request.getParameter("nuevaInformacion");

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String mensaje = "";

    try {
        // Establecer conexión con la base de datos
        con = ConectorBD.getConnection();
        stmt = con.createStatement();

    // Consultar si existe el adoptante en la base de datos
    String query = "SELECT * FROM Adoptantes WHERE identificacion = '" + identificacionAdoptante + "'";
    rs = stmt.executeQuery(query);

    if (rs.next()) {
        // Si el adoptante existe, se procede a insertar o actualizar el formulario
        String updateQuery = "INSERT INTO FormulariosAdopcion (idFormulario, identificacionAdoptante, codigoMascota, nuevaInformacion) VALUES "
                + "('" + idFormulario + "', '" + identificacionAdoptante + "', '" + codigoMascota + "', '" + nuevaInformacion + "') "
                + "ON DUPLICATE KEY UPDATE nuevaInformacion = '" + nuevaInformacion + "'";
        stmt.executeUpdate(updateQuery);
        mensaje = "Formulario guardado correctamente";
    } else {
        mensaje = "Error: El adoptante no existe en la base de datos.";
    }

        // Consultar si existe el adoptante en la base de datos
        String consultaAdoptante = "SELECT * FROM adoptante WHERE identificacion = '" + identificacionAdoptante + "'";
        rs = stmt.executeQuery(consultaAdoptante);

        if (rs.next()) {
            // El adoptante existe
            String codigoAdopcion = rs.getString("codigoAdopcion");

            // Consultar si existe la mascota con el código proporcionado
            String consultaMascota = "SELECT * FROM mascota WHERE codigo = '" + codigoMascota + "'";
            rs = stmt.executeQuery(consultaMascota);

            if (rs.next()) {
                // La mascota existe, proceder a actualizar la información del formulario
                String actualizacionFormulario = "UPDATE formulario SET informacion = ? WHERE id = ?";
                PreparedStatement psFormulario = con.prepareStatement(actualizacionFormulario);
                psFormulario.setString(1, nuevaInformacion);
                psFormulario.setString(2, idFormulario);
                psFormulario.executeUpdate();

                // Actualizar la tabla de adopción con la nueva información del formulario
                String actualizacionAdopcion = "UPDATE adopcionDetalle SET codigoFormularioInformacion = ? WHERE codigoAdopcion = ?";
                PreparedStatement psAdopcion = con.prepareStatement(actualizacionAdopcion);
                psAdopcion.setString(1, idFormulario);
                psAdopcion.setString(2, codigoAdopcion);
                psAdopcion.executeUpdate();

                mensaje = "Formulario y datos de adopción actualizados correctamente.";

            } else {
                mensaje = "No se encontró ninguna mascota con el código proporcionado.";
            }

        } else {
            mensaje = "No se encontró ningún adoptante con la identificación proporcionada.";
        }

    } catch (SQLException ex) {
        Logger.getLogger("actualizarFormularioInfo.jsp").log(Level.SEVERE, null, ex);
        mensaje = "Error al actualizar la información: " + ex.getMessage();
    } finally {
        // Cerrar los recursos
        if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignorar */ }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* Ignorar */ }
        if (con != null) try { con.close(); } catch (SQLException e) { /* Ignorar */ }
    }
%>



