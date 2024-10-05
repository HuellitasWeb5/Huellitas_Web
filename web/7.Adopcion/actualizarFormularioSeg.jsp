<%-- 
    Document   : actualizarFormularioDeSeguimiento
    Created on : 1 oct 2024, 23:02:13
    Author     : Angie
--%>
<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Captura de los parámetros del formulario de seguimiento
    String accion = request.getParameter("accion");
    String identificacion = request.getParameter("identificacion");
    String nombreAdoptante = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String residencia = request.getParameter("residencia");
    
    String codigoMascota = request.getParameter("codigo");
    String nombreMascota = request.getParameter("nombreMascota");
    String fechaNacimiento = request.getParameter("fechaNacimiento");
    String genero = request.getParameter("genero");
    String cuidadosEspeciales = request.getParameter("cuidadosEspeciales");

    String cambioSalud = request.getParameter("cambioSalud");
    String cambioPeso = request.getParameter("cambioPeso");
    String cambioEmocional = request.getParameter("cambioEmocional");
    String adaptacion = request.getParameter("adaptacion");
    String relacion = request.getParameter("relacion");
    String fechaProximaVisita = request.getParameter("fechaProximaVisita");
    String descripcion = request.getParameter("descripcion");
    int calificacion = Integer.parseInt(request.getParameter("rating"));

    // Creación del objeto FormularioDeSeguimiento para gestionar los datos del seguimiento
    FormularioDeSeguimiento formulario = new FormularioDeSeguimiento();
    formulario.setIdentificacion(identificacion);
    formulario.setNombreAdoptante(nombreAdoptante);
    formulario.setTelefono(telefono);
    formulario.setDireccion(direccion);
    formulario.setResidencia(residencia);
    
    formulario.setCodigoMascota(codigoMascota);
    formulario.setNombreMascota(nombreMascota);
    formulario.setFechaNacimiento(Date.valueOf(fechaNacimiento));
    formulario.setGenero(genero);
    formulario.setCuidadosEspeciales(cuidadosEspeciales);
    
    formulario.setCambioSalud(cambioSalud);
    formulario.setCambioPeso(cambioPeso);
    formulario.setCambioEmocional(cambioEmocional);
    formulario.setAdaptacion(adaptacion);
    formulario.setRelacion(relacion);
    formulario.setFechaProximaVisita(Date.valueOf(fechaProximaVisita));
    formulario.setDescripcion(descripcion);
    formulario.setCalificacion(calificacion);

    // Dependiendo de la acción (Adicionar, Modificar, Eliminar) ejecuta la función correspondiente
    switch (accion) {
        case "grabar":
            formulario.grabar();
            break;
        case "Modificar":
            formulario.setId(request.getParameter("id"));
            formulario.modificar();
            break;
        case "Eliminar":
            formulario.setId(request.getParameter("id"));
            formulario.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=verFormularioSeg.jsp";
</script>
