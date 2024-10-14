<%-- 
    Document   : Acta
    Created on : 5/10/2024, 02:37:31 PM
    Author     : Luis Eraso
--%>

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
    Map<String, String> variables = new HashMap<String, String>();  
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    String rutaArchivos = getServletContext().getRealPath("/") + "uploads/"; 
    File destino = new File(rutaArchivos);

    if (!destino.exists()) {
        destino.mkdirs(); 
    }

    String codigoFormulario = null; 
    if (isMultipart) {
     
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = items.iterator();

        while (iterador.hasNext()) {
            FileItem item = iterador.next();
            if (item.isFormField()) {
           
                variables.put(item.getFieldName(), item.getString());

                if ("codigoFormulario".equals(item.getFieldName())) {
                    codigoFormulario = item.getString();
                }
            } else {
                
                String nombreArchivo = new File(item.getName()).getName(); 
                if (!nombreArchivo.isEmpty()) {
                    File archivoGuardado = new File(destino, nombreArchivo);
                    item.write(archivoGuardado);
                    variables.put(item.getFieldName(), nombreArchivo);  
                    subioArchivo = true;
                }
            }
        }
    } else {
        // Manejo de datos regulares si no es un formulario multipart
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacionAdoptante", request.getParameter("identificacionAdoptante"));
    }

    String accion = variables.get("accion");
    String identificacionAdoptante = variables.get("identificacionAdoptante");
    String codigoMascota = variables.get("codigoMascota");

    String acta = variables.get("acta");

    // Crear una instancia de Adopcion y asignar valores
    Adopcion adopcion = new Adopcion();
    adopcion.setIdentificacionAdoptante(identificacionAdoptante);
    adopcion.setCodigoMascota(codigoMascota);
    adopcion.setActaAdopcion(acta);  

    String mensaje = "";
    // Acciones del formulario
    if ("Acta".equals(accion)) {
        adopcion.setCodigo(codigoFormulario);  
        System.out.println("Código del formulario: " + codigoFormulario);
        adopcion.SubirArchivo(); 
        mensaje = "Contrato de adopción subido correctamente.";
    } else {
        mensaje = "Error al subir el contrato de adopción.";
    }
%>

<script type="text/javascript">
    alert('<%= mensaje %>');  
    document.location = "principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp";
</script>

