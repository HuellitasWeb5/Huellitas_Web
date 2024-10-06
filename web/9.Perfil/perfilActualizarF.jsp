<%-- 
    Document   : clientesActualizar
    Created on : 27/05/2024, 03:36:08 PM
    Author     : URB
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
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>(); //aqui se almacenan los datos enviados por el formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        //no se pasa por el formulario que corresponde a eliminar
        variables.put("accion", request.getParameter("accion"));
        variables.put("Identificacion", request.getParameter("Identificacion"));
    } else {
        //configuraciones para subir el archivo 
        String rutaActual = getServletContext().getRealPath("/");
        out.print(rutaActual);
        File destino = new File(rutaActual + "/presentacion/clientes/");
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        File archivo = null;

        ServletRequestContext origen = new ServletRequestContext(request);

        //para recorrer los elementos enviados por el formulario
        List elementosFormulario = upload.parseRequest(origen);
        Iterator iterador = elementosFormulario.iterator();
        while (iterador.hasNext()) {
            FileItem elemento = (FileItem) iterador.next();
            if (elemento.isFormField()) {
                out.print(elemento.getFieldName() + " = " + elemento.getString() + "<br>");
                variables.put(elemento.getFieldName(), elemento.getString());
            } else {
                out.print(elemento.getFieldName() + " = " + elemento.getName() + "<br>");
                variables.put(elemento.getFieldName(), elemento.getName());
                if (!elemento.getName().equals("")) {
                    subioArchivo = true;
                    elemento.write(new File(destino, elemento.getName()));
                    variables.put(elemento.getFieldName(), elemento.getName());
                }
            }
        }
    }

    String accion = variables.get("accion");
    String identificacionAnterior = variables.get("identificacionAnterior");

    Persona usuarioActual = new Persona();
    usuarioActual.setIdentificacion(variables.get("identificacion"));
    usuarioActual.setNombre(variables.get("nombre"));
    usuarioActual.setGenero(variables.get("genero"));
    usuarioActual.setFechaNacimiento(variables.get("fechaNacimiento"));
    usuarioActual.setEmail(variables.get("email"));
    usuarioActual.setTelefono(variables.get("telefono"));
    usuarioActual.setDireccion(variables.get("direccion"));
    usuarioActual.setResidencia(variables.get("residencia"));
    usuarioActual.setFoto(variables.get("foto"));
    usuarioActual.setTipo("S");
    usuarioActual.setClave(variables.get("clave"));

    switch (variables.get("accion")) {
        case "Modificar":
            if (!subioArchivo) {
                Persona auxiliar = new Persona(variables.get("identificacion"));
                usuarioActual.setFoto(auxiliar.getFoto());

            }
            usuarioActual.modificar(identificacionAnterior);
            break;
        case "Eliminar":
            usuarioActual.setIdentificacion(request.getParameter("identificacion"));
            usuarioActual.eliminar();
            break;
    }
%>

<script type="text/javascript">
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=index-InicioSesion.jsp";
</script>