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
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    String nombreTipo = variables.get("nombreTipo");
    System.out.println(nombreTipo);

    Persona clientes = new Persona();
    clientes.setIdentificacion(variables.get("identificacion"));
    clientes.setNombre(variables.get("nombre"));
    clientes.setGenero(variables.get("genero"));
    clientes.setFechaNacimiento(variables.get("fechaNacimiento"));
    clientes.setEmail(variables.get("email"));
    clientes.setTelefono(variables.get("telefono"));
    clientes.setDireccion(variables.get("direccion"));
    clientes.setResidencia(variables.get("residencia"));
    clientes.setFoto(variables.get("foto"));
    clientes.setTipo("C");
    clientes.setClave(variables.get("clave"));

    switch (variables.get("accion")) {
        case "Adicionar":
            clientes.grabar();
            break;
        case "Modificar":
            if (!subioArchivo) {
                Persona auxiliar = new Persona(variables.get("identificacion"));
                clientes.setFoto(auxiliar.getFoto());

            }
            clientes.modificar(identificacionAnterior);
            break;
        case "Eliminar":
            clientes.setIdentificacion(request.getParameter("identificacion"));
            clientes.eliminar();
            break;
    }
%>

<script type="text/javascript">

    document.location = "principal.jsp?CONTENIDO=4.Clientes/clientes.jsp&nombre=<%=nombreTipo%>";
</script>