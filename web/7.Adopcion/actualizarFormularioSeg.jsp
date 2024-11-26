<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="clases.FormularioDeSeguimiento"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Inicializar variables
    Map<String, String> variables = new HashMap<String, String>();  // Almacena los datos del formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    String rutaArchivos = getServletContext().getRealPath("/") + "uploads/";  // Ruta de guardado
    File destino = new File(rutaArchivos);

    if (!destino.exists()) {
        destino.mkdirs();  // Crear el directorio si no existe
    }

    if (isMultipart) {
        // Configuraciones para subir los archivos
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = items.iterator();

        // Recorrer los elementos del formulario
        while (iterador.hasNext()) {
            FileItem item = iterador.next();
            if (item.isFormField()) {
                // Si es un campo de formulario, almacenar en el mapa
                variables.put(item.getFieldName(), item.getString());
            } else {
                // Si es un archivo, manejar la subida del archivo
                String nombreArchivo = item.getName();
                if (!nombreArchivo.isEmpty()) {
                    File archivoGuardado = new File(destino, nombreArchivo);
                    item.write(archivoGuardado);
                    variables.put(item.getFieldName(), nombreArchivo);  // Almacenar el nombre del archivo
                }
            }
        }
    } else {
        // No es un formulario de tipo multipart, manejar los datos regulares
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacionAdoptante", request.getParameter("identificacionAdoptante"));
    }

    // Capturar valores del formulario de seguimiento
    String accion = variables.get("accion");
    String identificacionAdoptante = variables.get("identificacionAdoptante");
    String codigoMascota = variables.get("codigoMascota");
    String evolucionMedica = variables.get("evolucionMedica");
    String masaCorporal = variables.get("masaCorporal");
    String estadoEmocional = variables.get("estadoEmocional");
    String adaptacion = variables.get("adaptacion");
    String vinculo = variables.get("vinculo");
    String descripcion = variables.get("descripcion");
    String calificacion = variables.get("calificacion");
    String fechaProximaVisita = variables.get("fechaProximaVisita");
    String foto = variables.get("foto");

    FormularioDeSeguimiento formularioDeSeguimiento = new FormularioDeSeguimiento();
    formularioDeSeguimiento.setIdentificacionAdoptante(identificacionAdoptante);
    formularioDeSeguimiento.setCodigoMascota(codigoMascota);
    formularioDeSeguimiento.setEvolucionMedica(evolucionMedica);
    formularioDeSeguimiento.setMasaCorporal(masaCorporal);
    formularioDeSeguimiento.setEstadoEmocional(estadoEmocional);
    formularioDeSeguimiento.setAdaptacion(adaptacion);
    formularioDeSeguimiento.setVinculo(vinculo);
    formularioDeSeguimiento.setDescripcion(descripcion);
    formularioDeSeguimiento.setCalificacion(calificacion);
    formularioDeSeguimiento.setFechaProximaVisita(fechaProximaVisita);
    formularioDeSeguimiento.setFoto(foto);

    // Acciones del formulario de seguimiento
    switch (accion) {
        case "Adicionar":
            formularioDeSeguimiento.grabar();
            break;
        case "Modificar":
            formularioDeSeguimiento.setCodigo(request.getParameter("codigo"));
            formularioDeSeguimiento.modificar();
            break;
        case "Eliminar":
            formularioDeSeguimiento.setCodigo(request.getParameter("codigo"));
            formularioDeSeguimiento.eliminar();
            break;
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=7.Adopcion/verFormularioSeg.jsp";
</script>
