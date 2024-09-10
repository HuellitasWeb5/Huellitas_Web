<%-- 
    Document   : administradoresActualizar
    Created on : 30/08/2024, 10:50:01 AM
    Author     : VALEN
--%>

<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="clases.Persona"%>
<%
    boolean subioArchivo=false;
Map<String, String> variables=new HashMap<String, String>(); //aqui se almacenan los datos enviados por el formulario
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(!isMultipart){
    //no se pasa por el formulario que corresponde a eliminar
    variables.put("accion", request.getParameter("accion"));
    variables.put("identificacion", request.getParameter("identificacion"));
}else{
    //configuraciones para subir el archivo 
    String rutaActual=getServletContext().getRealPath("/");
    out.print(rutaActual);
    File destino=new File(rutaActual+"/presentacion/administrador/");
    DiskFileItemFactory factory=new DiskFileItemFactory(1024*1024, destino);
    ServletFileUpload upload=new ServletFileUpload(factory);
    File archivo=null;
    
    ServletRequestContext origen = new ServletRequestContext(request);
    
    //para recorrer los elementos enviados por el formulario
    List administradoresFormulario=upload.parseRequest(origen);
    Iterator iterador=administradoresFormulario.iterator();
    while (iterador.hasNext()) {
            FileItem elemento=(FileItem) iterador.next();
            if(elemento.isFormField()){
                out.print(elemento.getFieldName()+" = "+elemento.getString()+"<br>");
                variables.put(elemento.getFieldName(),elemento.getString());
            }
            else {
                out.print(elemento.getFieldName()+" = "+elemento.getName()+"<br>");
                variables.put(elemento.getFieldName(), elemento.getName());
                if(!elemento.getName().equals("")){
                subioArchivo=true;
                elemento.write(new File(destino,elemento.getName()));
                variables.put(elemento.getFieldName(),elemento.getName());
                }
            }
        }
}
String accion=variables.get("accion");
String identificacionAnterior=variables.get("identificacionAnterior");

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

switch(variables.get("accion")){
    case "Adicionar":
        administrador.grabar();
        break;
    case "Modificar":
        if(!subioArchivo){
            Persona auxiliar=new Persona(variables.get("identificacion"));
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
    document.location="principal.jsp?CONTENIDO=5.Administradores/administradores.jsp"
</script>