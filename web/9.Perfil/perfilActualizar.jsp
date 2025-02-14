<%-- 
    Document   : clientesActualizar
    Created on : 27/05/2024, 03:36:08 PM
    Author     : URB
--%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
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
    usuarioActual.setTipo("C");
    usuarioActual.setClave(variables.get("clave"));
    

    String claveActual = variables.get("claveActual");
    String claveActualHash = "md5('" + claveActual + "')"; // Asegúrate de que la contraseña se encripte de la misma manera que en la base de datos

    // Verificar si la contraseña actual es correcta
    Persona personaVerificada = Persona.validar(usuarioActual.getIdentificacion(), claveActual);
    if (personaVerificada == null) {
        out.print("<script>alert('La contraseña actual es incorrecta.'); window.history.back();</script>");
        return; // Detener la ejecución si la contraseña es incorrecta
    }

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
    document.location = "index-InicioSesion.jsp";
</script>