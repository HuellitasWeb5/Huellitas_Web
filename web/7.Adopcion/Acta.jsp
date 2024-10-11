<%-- 
    Document   : Acta
    Created on : 5/10/2024, 02:37:31 PM
    Author     : Luis Eraso
--%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="clases.Adopcion"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>();  // Almacena los datos del formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    String rutaArchivos = getServletContext().getRealPath("/") + "uploads/";  // Ruta para guardar archivos
    File destino = new File(rutaArchivos);

    if (!destino.exists()) {
        destino.mkdirs();  // Crear el directorio si no existe
    }

    String codigoFormulario = null; // Variable para almacenar el código del formulario

    if (isMultipart) {
        // Configuración para la subida de archivos
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = items.iterator();

        // Procesar los elementos del formulario
        while (iterador.hasNext()) {
            FileItem item = iterador.next();
            if (item.isFormField()) {
                // Si es un campo de formulario, almacenar en el mapa
                variables.put(item.getFieldName(), item.getString());

                // Extraer específicamente el valor de 'codigoFormulario'
                if ("codigoFormulario".equals(item.getFieldName())) {
                    codigoFormulario = item.getString();
                }
            } else {
                // Si es un archivo, manejar la subida del archivo
                String nombreArchivo = new File(item.getName()).getName(); // Extraer solo el nombre del archivo
                if (!nombreArchivo.isEmpty()) {
                    File archivoGuardado = new File(destino, nombreArchivo);
                    item.write(archivoGuardado);
                    variables.put(item.getFieldName(), nombreArchivo);  // Guardar el nombre del archivo
                    subioArchivo = true;
                }
            }
        }
    } else {
        // Manejo de datos regulares si no es un formulario multipart
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacionAdoptante", request.getParameter("identificacionAdoptante"));
    }

    // Capturar valores del formulario
    String accion = variables.get("accion");
    String identificacionAdoptante = variables.get("identificacionAdoptante");
    String codigoMascota = variables.get("codigoMascota");

    // Archivos subidos
    String acta = variables.get("acta");

    // Crear una instancia de Adopcion y asignar valores
    Adopcion adopcion = new Adopcion();
    adopcion.setIdentificacionAdoptante(identificacionAdoptante);
    adopcion.setCodigoMascota(codigoMascota);
    adopcion.setActaAdopcion(acta);  // Asignar el nombre del archivo acta

    String mensaje = "";
    // Acciones del formulario
    if ("Acta".equals(accion)) {
        adopcion.setCodigo(codigoFormulario);  // Asignar el código del formulario extraído correctamente
        System.out.println("Código del formulario: " + codigoFormulario);
        adopcion.SubirArchivo(); 
        mensaje = "Acta subida correctamente.";
    } else {
        mensaje = "Error al subir el acta.";
    }
%>

<script type="text/javascript">
    alert('<%= mensaje %>');  // Muestra un mensaje al usuario
    document.location = "principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp";
</script>
