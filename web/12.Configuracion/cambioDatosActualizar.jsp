<%-- 
    Document   : cambioDatosActualizar
    Created on : 10/12/2024, 11:39:18 AM
    Author     : Luis Eraso
--%>
<%@page import="clases.Datos"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<>(); // Aquí se almacenan los datos enviados por el formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        // Configuraciones para subir el archivo
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "/presentacion/imagenes/");
        if (!destino.exists()) {
            destino.mkdirs(); // Crear directorio si no existe
        }
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        File archivo = null;

        ServletRequestContext origen = new ServletRequestContext(request);

        // Para recorrer los elementos enviados por el formulario
        List<FileItem> elementosFormulario = upload.parseRequest(origen);
        Iterator<FileItem> iterador = elementosFormulario.iterator();
        while (iterador.hasNext()) {
            FileItem elemento = iterador.next();
            if (elemento.isFormField()) {
                variables.put(elemento.getFieldName(), elemento.getString());
            } else {
                if (!elemento.getName().equals("")) {
                    subioArchivo = true;
                    String nombreArchivo = System.currentTimeMillis() + "_" + elemento.getName(); // Evitar duplicados
                    archivo = new File(destino, nombreArchivo);
                    elemento.write(archivo);
                    variables.put(elemento.getFieldName(), nombreArchivo);
                }
            }
        }
    }

    // Creación de instancia de Datos y asignación de valores
    Datos datos = new Datos();
    datos.setId(variables.get("id")); // ID tratado como String
    datos.setTitulo1(variables.get("titulo1"));
    datos.setTitulo2(variables.get("titulo2"));
    datos.setInformacion(variables.get("informacion"));
    datos.setFoto(variables.getOrDefault("foto", "")); // Usar el valor predeterminado si no se subió archivo

    // Acción según el valor del campo "accion"
    switch (variables.get("accion")) {
        case "Adicionar":
            datos.grabar();
            break;
        case "Modificar":
            if (!subioArchivo) {
                Datos auxiliar = new Datos(datos.getId());
                datos.setFoto(auxiliar.getFoto()); // Mantener la foto existente si no se subió una nueva
            }
            datos.modificar();
            break;
        case "Eliminar":
            datos.eliminar();
            break;
    }
%>

<script type="text/javascript">
    // Redireccionar después de la acción
    document.location = "principal.jsp?CONTENIDO=12.Configuracion/cambioDatos.jsp&accion=Modificar";
</script>
