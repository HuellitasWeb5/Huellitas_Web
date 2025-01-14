
<%@page import="clases.Apadrinamiento"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="presentacion/style-Tarjetas.css">

<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (!isMultipart) {
        variables.put("accion", request.getParameter("accion"));
        variables.put("Identificacion", request.getParameter("Identificacion"));
    } else {
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "/presentacion/padripet/");
        
        // Crear directorio si no existe
        if (!destino.exists()) {
            destino.mkdirs();
        }

        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        List<FileItem> elementosFormulario = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = elementosFormulario.iterator();
        
        while (iterador.hasNext()) {
            FileItem elemento = iterador.next();
            if (elemento.isFormField()) {
                variables.put(elemento.getFieldName(), elemento.getString());
            } else {
                if (!elemento.getName().isEmpty()) {
                    subioArchivo = true;
                    try {
                        File archivo = new File(destino, elemento.getName());
                        elemento.write(archivo);
                        
                        // Guardar la ruta del archivo
                        variables.put(elemento.getFieldName(), "/presentacion/padripet/" + elemento.getName());
                        System.out.println("Archivo subido: " + elemento.getName());
                    } catch (Exception e) {
                        e.printStackTrace(); // Manejo de error
                        System.out.println("Error al subir el archivo: " + elemento.getName());
                    }
                } else {
                    System.out.println("El archivo está vacío.");
                }
            }
        }
    }

    String accion = variables.get("accion");
    String codigo = request.getParameter("codigo");
    Apadrinamiento padrino = new Apadrinamiento();

    if ("Adicionar".equals(accion)) {
        padrino.setIdentificacionPadrino(variables.get("identificacion"));
        padrino.setFotoRecibo(variables.get("fotoRecibo")); // Usar la ruta guardada
        padrino.setFotoCedula(variables.get("fotoCedula")); // Usar la ruta guardada
        padrino.grabarConProcedimientoAlmacenado(variables.get("mascotasPlan"));

    } else if ("Eliminar".equals(accion)) {
        padrino.eliminar(codigo);
        System.out.println("Se eliminó el apadrinamiento con código: " + codigo);
    } else {
        System.out.println("Acción no válida: " + accion);
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp";
</script>
