<%-- 
    Document   : padrinosActualizar.jsp
    Created on : 8/09/2024, 10:19:54 PM
    Author     : Yandar96
--%>

<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="clases.Apadrinamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        variables.put("accion", request.getParameter("accion"));
        variables.put("Identificacion", request.getParameter("Identificacion"));
    } else {
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "/presentacion/apadrinamiento/");
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        File archivo = null;

        ServletRequestContext origen = new ServletRequestContext(request);
        List elementosFormulario = upload.parseRequest(origen);
        Iterator iterador = elementosFormulario.iterator();
        while (iterador.hasNext()) {
            FileItem elemento = (FileItem) iterador.next();
            if (elemento.isFormField()) {
                variables.put(elemento.getFieldName(), elemento.getString());
            } else {
                if (!elemento.getName().equals("")) {
                    subioArchivo = true;
                    elemento.write(new File(destino, elemento.getName()));
                    variables.put(elemento.getFieldName(), elemento.getName());
                }
            }
        }
    }

    String accion = variables.get("accion");

    Apadrinamiento padrino = new Apadrinamiento();
    padrino.setIdentificacionPadrino(variables.get("identificacion"));
    padrino.setFotoRecibo(variables.get("fotoRecibo"));
    padrino.setFotoCedula(variables.get("fotoCedula"));

    if ("Adicionar".equals(accion)) {
         padrino.grabarConProcedimientoAlmacenado(variables.get("mascotasPlan"));
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp";
</script>
