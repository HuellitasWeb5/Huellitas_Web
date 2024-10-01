<%-- 
    Document   : mascotasActualizar
    Created on : 28/08/2024, 09:13:23 AM
    Author     : URB
--%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
boolean subioArchivo = false;
Map<String, String> variables = new HashMap<String, String>(); // Aquí se almacenan los datos enviados por el formulario
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (!isMultipart) {
    // No se pasa por el formulario que corresponde a eliminar
    variables.put("accion", request.getParameter("accion"));
    variables.put("codigo", request.getParameter("codigo"));
} else {
    // Configuraciones para subir el archivo
    String rutaActual = getServletContext().getRealPath("/");
    File destino = new File(rutaActual + "/presentacion/mascota/");
    if (!destino.exists()) {
        destino.mkdirs();  // Crear la carpeta si no existe
    }

    DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
    ServletFileUpload upload = new ServletFileUpload(factory);
    
    ServletRequestContext origen = new ServletRequestContext(request);
    List elementosFormulario = upload.parseRequest(origen);
    Iterator iterador = elementosFormulario.iterator();

    while (iterador.hasNext()) {
        FileItem elemento = (FileItem) iterador.next();
        if (elemento.isFormField()) {
            out.print(elemento.getFieldName() + " = " + elemento.getString() + "<br>");
            variables.put(elemento.getFieldName(), elemento.getString());
        } else {
            out.print(elemento.getFieldName() + " = " + elemento.getName() + "<br>");
            if (!elemento.getName().equals("")) {
                String contentType = elemento.getContentType();
                if (contentType.startsWith("image/")) {
                    try {
                        String nombreArchivo = UUID.randomUUID().toString() + "_" + elemento.getName();
                        elemento.write(new File(destino, nombreArchivo));
                        variables.put(elemento.getFieldName(), nombreArchivo);
                        subioArchivo = true;
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("Error al subir el archivo: " + e.getMessage());
                    }
                } else {
                    out.print("Error: El archivo debe ser una imagen.");
                }
            }
        }
    }
}

Mascota mascota = new Mascota();
mascota.setCodigo(variables.get("codigo"));
mascota.setNombre(variables.get("nombre"));
mascota.setGenero(variables.get("genero"));
mascota.setTamano(variables.get("tamano"));
mascota.setFoto(variables.get("foto"));
mascota.setCuidadosEspeciales(variables.get("cuidadosEspeciales"));
mascota.setFechaNacimientoAproximada(variables.get("fechaNacimientoAproximada"));
mascota.setFechaIngreso(variables.get("fechaIngreso"));
mascota.setEstado(variables.get("estado"));
mascota.setDescripcion(variables.get("descripcion"));

switch (variables.get("accion")) {
    case "Adicionar":
        mascota.grabar();
        break;
    case "Modificar":
        if (!subioArchivo) {
            Mascota auxiliar = new Mascota(variables.get("codigo"));
            mascota.setFoto(auxiliar.getFoto());
        }
        mascota.modificar();
        break;
    case "Eliminar":
        mascota.eliminar();
        break;
}
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp";
</script>>
