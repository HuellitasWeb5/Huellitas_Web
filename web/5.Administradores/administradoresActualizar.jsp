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
    Map<String, String> variables = new HashMap<String, String>(); // Aquí se almacenan los datos enviados por el formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (!isMultipart) {
        // No se pasa por el formulario que corresponde a eliminar
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacion", request.getParameter("identificacion"));
    } else {
        // Configuraciones para subir el archivo 
        String rutaActual = getServletContext().getRealPath("/");
        File destino = new File(rutaActual + "presentacion" + File.separator + "administrador" + File.separator);
        DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, destino);
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        try {
            // Para recorrer los elementos enviados por el formulario
            ServletRequestContext origen = new ServletRequestContext(request);
            List<FileItem> administradoresFormulario = upload.parseRequest(origen);
            Iterator<FileItem> iterador = administradoresFormulario.iterator();
            
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
        } catch (Exception e) {
            out.print("Error al procesar el archivo: " + e.getMessage());
        }
    }

    String accion = variables.get("accion");
    String identificacionAnterior = variables.get("identificacionAnterior");
    
    Persona administrador = new Persona();
    administrador.setIdentificacion(variables.get("identificacion"));
    administrador.setNombre(variables.get("nombre"));
    administrador.setGenero(variables.get("genero"));
    administrador.setFechaNacimiento(variables.get("fechaNacimiento"));
    administrador.setEmail(variables.get("email"));
    administrador.setTelefono(variables.get("telefono"));
    administrador.setDireccion(variables.get("direccion"));
    administrador.setResidencia(variables.get("residencia"));
    administrador.setFoto(variables.get("foto"));
    administrador.setTipo(variables.get("tipo"));
    administrador.setClave(variables.get("clave"));

    switch (accion) {
        case "Adicionar":
            administrador.grabar();
            break;
        case "Modificar":
            if (!subioArchivo) {
                Persona auxiliar = new Persona(variables.get("identificacion"));
                administrador.setFoto(auxiliar.getFoto());
            }
            administrador.modificar(identificacionAnterior);
            break;
        case "Eliminar":
            administrador.setIdentificacion(request.getParameter("identificacion"));
            administrador.eliminar();
            break;
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=5.Administradores/administradores.jsp";
</script>