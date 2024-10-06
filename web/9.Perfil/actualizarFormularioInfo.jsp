<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="clases.FormularioDeInformacion"%>

<%
    // Inicializar variables
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>();  // Almacena los datos del formulario
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    String rutaArchivos = getServletContext().getRealPath("/") + "uploads/";  // Ruta de guardado
    File destino = new File(rutaArchivos);

    if (!destino.exists()) {
        destino.mkdirs();  // Crear el directorio si no existe
    }

    if (isMultipart) {
        // Configuraciones para subir los archivos
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = items.iterator();

        // Recorrer los elementos del formulario
        while (iterador.hasNext()) {
            FileItem item = iterador.next();
            if (item.isFormField()) {
                // Si es un campo de formulario, almacenar en el mapa
                variables.put(item.getFieldName(), item.getString());
            } else {
                // Si es un archivo, manejar la subida del archivo
                String nombreArchivo = item.getName();
                if (!nombreArchivo.isEmpty()) {
                    File archivoGuardado = new File(destino, nombreArchivo);
                    item.write(archivoGuardado);
                    variables.put(item.getFieldName(), nombreArchivo);  // Almacenar el nombre del archivo
                    subioArchivo = true;
                }
            }
        }
    } else {
        // No es un formulario de tipo multipart, manejar los datos regulares
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacionAdoptante", request.getParameter("identificacionAdoptante"));
    }

    // Capturar valores del formulario
    String accion = variables.get("accion");
    String identificacionAdoptante = variables.get("identificacionAdoptante");
    String codigoMascota = variables.get("codigoMascota");
    String ocupacion = variables.get("ocupacion");
    String tiempoLibre = variables.get("tiempoLibre");
    String espacio = variables.get("espacio");
    String compromiso = variables.get("compromiso");
    String ninos = variables.get("ninos");  // Dejar como String
    String habitantes = variables.get("habitantes");  // Dejar como String
    String responsables = variables.get("responsables");  // Dejar como String
    String otrasMascotas = variables.get("otrasMascotas");
    String propietario = variables.get("propietario");
    String motivacion = variables.get("motivacion");
    String fechaVisitaDia = variables.get("fechaVisitaDia");
    String fechaVisitaHora = variables.get("fechaVisitaHora");
    String descripcion = variables.get("descripcion");
    String autorizacionDatos = variables.get("autorizacion");

    // Fotos subidas
    String fotoVivienda = variables.get("fotoVivienda");
    String fotoRecibo = variables.get("fotoRecibo");
    String fotoCedula = variables.get("fotoCedula");

    // Crear una instancia de FormularioDeInformacion y asignar valores
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();
    formularioDeInformacion.setIdentificacionAdoptante(identificacionAdoptante);
    formularioDeInformacion.setCodigoMascota(codigoMascota);
    formularioDeInformacion.setOcupacion(ocupacion);
    formularioDeInformacion.setTiempoLibre(tiempoLibre);
    formularioDeInformacion.setEspacio(espacio);
    formularioDeInformacion.setCompromiso(compromiso);
    formularioDeInformacion.setNinos(ninos);  // Asignado como String
    formularioDeInformacion.setHabitantes(habitantes);  // Asignado como String
    formularioDeInformacion.setResponsables(responsables);  // Asignado como String
    formularioDeInformacion.setOtrasMascotas(otrasMascotas);
    formularioDeInformacion.setPropietario(propietario);
    formularioDeInformacion.setMotivacion(motivacion);
    formularioDeInformacion.setFechaVisitaDia(fechaVisitaDia);
    formularioDeInformacion.setFechaVisitaHora(fechaVisitaHora);
    formularioDeInformacion.setDescripcion(descripcion);
    formularioDeInformacion.setAutorizacionDatos(autorizacionDatos);

    // Asignar archivos subidos
    formularioDeInformacion.setFotoVivienda(fotoVivienda);
    formularioDeInformacion.setFotoRecibo(fotoRecibo);
    formularioDeInformacion.setFotoCedula(fotoCedula);

    // Acciones del formulario
    switch (accion) {
        case "Adicionar":
            formularioDeInformacion.grabar();
            break;
        case "Modificar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.modificar();
            break;
        case "Eliminar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.eliminar();
            break;
    }
%>

<script type="text/javascript">
    // Redirigir despu�s de completar la acci�n
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=inicio.jsp";
</script>
