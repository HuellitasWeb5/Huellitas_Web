
<%@page import="clases.Adopcion"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Inicializar variables
    boolean subioArchivo = false;
    Map<String, String> variables = new HashMap<String, String>();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    String rutaArchivos = getServletContext().getRealPath("/") + "uploads/";
    File destino = new File(rutaArchivos);

    if (!destino.exists()) {
        destino.mkdirs();
    }

    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
        Iterator<FileItem> iterador = items.iterator();

        // Recorrer los elementos del formulario
        while (iterador.hasNext()) {
            FileItem item = iterador.next();
            if (item.isFormField()) {
                variables.put(item.getFieldName(), item.getString());
            } else {
                String nombreArchivo = item.getName();
                if (!nombreArchivo.isEmpty()) {
                    File archivoGuardado = new File(destino, nombreArchivo);
                    item.write(archivoGuardado);
                    variables.put(item.getFieldName(), nombreArchivo);
                    subioArchivo = true;
                }
            }
        }
    } else {
        variables.put("accion", request.getParameter("accion"));
        variables.put("identificacion", request.getParameter("identificacion"));
    }

    // Capturar valores del formulario
    String accion = variables.get("accion");
    String identificacion = variables.get("identificacion");
    String codigoMascota = variables.get("codigoMascotas");
    String estadoCivil = variables.get("estadoCivil");
    String ocupacion = variables.get("ocupacion");
    String motivacion = variables.get("motivacion");
    String otrasMascotas = variables.get("otrasMascotas");
    String otrasMascotasR = variables.get("otrasMascotasR");
    String esterilizados = variables.get("esterilizados");
    String esterilizadosR = variables.get("esterilizadosR");
    String anteriorMascotas = variables.get("anteriorMascotas");
    String anteriorMascotasR = variables.get("anteriorMascotasR");
    String habitantes = variables.get("habitantes");
    String habitantesR = variables.get("habitantesR");
    String ninos = variables.get("ninos");
    String ninosR = variables.get("ninosR");
    String alergias = variables.get("alergias");
    String vivienda = variables.get("vivienda");
    String permiteMascotas = variables.get("permiteMascotas");
    String cambiarDomicilio = variables.get("cambiarDomicilio");
    String rupturaFamiliar = variables.get("rupturaFamiliar");
    String proyeccionFutura = variables.get("proyeccionFutura");
    String espacio = variables.get("espacio");
    String responsables = variables.get("responsables");
    String compromiso = variables.get("compromiso");
    String autorizaVisitas = variables.get("autorizaVisitas");
    String autorizaVisitasR = variables.get("autorizaVisitasR");
    String fechaVisitaDia = variables.get("fechaVisitaDia");
    String fechaVisitaHora = variables.get("fechaVisitaHora");
    String refNombre1 = variables.get("refNombre1");
    String refCedula1 = variables.get("refCedula1");
    String refDireccion1 = variables.get("refDireccion1");
    String refCelular1 = variables.get("refCelular1");
    String refNombre2 = variables.get("refNombre2");
    String refCedula2 = variables.get("refCedula2");
    String refDireccion2 = variables.get("refDireccion2");
    String refCelular2 = variables.get("refCelular2");
    String refNombre3 = variables.get("refNombre3");
    String refCedula3 = variables.get("refCedula3");
    String refDireccion3 = variables.get("refDireccion3");
    String refCelular3 = variables.get("refCelular3");
    String refNombre4 = variables.get("refNombre4");
    String refCedula4 = variables.get("refCedula4");
    String refDireccion4 = variables.get("refDireccion4");
    String refCelular4 = variables.get("refCelular4");
    String descripcion = variables.get("descripcion");
    String autorizacionDatos = variables.get("autorizacion");

// Fotos subidas
    String fotoVivienda = variables.get("fotoVivienda");
    String fotoRecibo = variables.get("fotoRecibo");
    String fotoCedula = variables.get("fotoCedula");

// Crear una instancia de FormularioDeInformacion y asignar valores
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();
    Adopcion adopcion = new Adopcion();
    adopcion.setIdentificacionAdoptante(identificacion);
    adopcion.setCodigoMascota(codigoMascota);

    formularioDeInformacion.setIdentificacionAdoptante(identificacion);
    formularioDeInformacion.setCodigoMascota(codigoMascota);
    formularioDeInformacion.setEstadoCivil(estadoCivil);
    formularioDeInformacion.setOcupacion(ocupacion);
    formularioDeInformacion.setMotivacion(motivacion);
    formularioDeInformacion.setOtrasMascotas(otrasMascotas);
    formularioDeInformacion.setOtrasMascotasR(otrasMascotasR);
    formularioDeInformacion.setEsterilizados(esterilizados);
    formularioDeInformacion.setEsterilizadosR(esterilizadosR);
    formularioDeInformacion.setAnteriorMascotas(anteriorMascotas);
    formularioDeInformacion.setAnteriorMascotasR(anteriorMascotasR);
    formularioDeInformacion.setHabitantes(habitantes);
    formularioDeInformacion.setHabitantesR(habitantesR);
    formularioDeInformacion.setNinos(ninos);
    formularioDeInformacion.setNinosR(ninosR);
    formularioDeInformacion.setAlergias(alergias);
    formularioDeInformacion.setVivienda(vivienda);
    formularioDeInformacion.setPermiteMascotas(permiteMascotas);
    formularioDeInformacion.setCambiarDomicilio(cambiarDomicilio);
    formularioDeInformacion.setRupturaFamiliar(rupturaFamiliar);
    formularioDeInformacion.setProyeccionFutura(proyeccionFutura);
    formularioDeInformacion.setEspacio(espacio);
    formularioDeInformacion.setResponsables(responsables);
    formularioDeInformacion.setCompromiso(compromiso);
    formularioDeInformacion.setAutorizaVisitas(autorizaVisitas);
    formularioDeInformacion.setAutorizaVisitasR(autorizaVisitasR);
    formularioDeInformacion.setFechaVisitaDia(fechaVisitaDia);
    formularioDeInformacion.setFechaVisitaHora(fechaVisitaHora);
    formularioDeInformacion.setRefNombre1(refNombre1);
    formularioDeInformacion.setRefCedula1(refCedula1);
    formularioDeInformacion.setRefDireccion1(refDireccion1);
    formularioDeInformacion.setRefCelular1(refCelular1);
    formularioDeInformacion.setRefNombre2(refNombre2);
    formularioDeInformacion.setRefCedula2(refCedula2);
    formularioDeInformacion.setRefDireccion2(refDireccion2);
    formularioDeInformacion.setRefCelular2(refCelular2);
    formularioDeInformacion.setRefNombre3(refNombre3);
    formularioDeInformacion.setRefCedula3(refCedula3);
    formularioDeInformacion.setRefDireccion3(refDireccion3);
    formularioDeInformacion.setRefCelular3(refCelular3);
    formularioDeInformacion.setRefNombre4(refNombre4);
    formularioDeInformacion.setRefCedula4(refCedula4);
    formularioDeInformacion.setRefDireccion4(refDireccion4);
    formularioDeInformacion.setRefCelular4(refCelular4);
    formularioDeInformacion.setDescripcion(descripcion);
    formularioDeInformacion.setAutorizacionDatos(autorizacionDatos);
    formularioDeInformacion.setFotoVivienda(fotoVivienda);
    formularioDeInformacion.setFotoRecibo(fotoRecibo);
    formularioDeInformacion.setFotoCedula(fotoCedula);

    String nombreCliente = request.getParameter("cliente");
    // Asignar archivos subidos
    formularioDeInformacion.setFotoVivienda(fotoVivienda);
    formularioDeInformacion.setFotoRecibo(fotoRecibo);
    formularioDeInformacion.setFotoCedula(fotoCedula);

    String FormularioInfo = variables.get("formularioInfo");

    // Acciones del formulario
    switch (accion) {
        case "Adicionar":
            formularioDeInformacion.grabar();
            formularioDeInformacion.grabarFormularioConProcedimientoAlmacenado(FormularioInfo);

            break;
        case "Modificar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.modificar();
            break;
        case "Eliminar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.eliminar();
            break;
        case "Aceptar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.aceptarFormulario();
            adopcion.setIdentificacionAdoptante(request.getParameter("identificacion"));
            adopcion.setCodigoMascota(request.getParameter("codigoMascota"));
            adopcion.grabar();

            break;
    }
%>

<script type="text/javascript">
    if ("<%= accion %>" === "Adicionar" && "<%= nombreCliente %>" === "cliente") {
        document.location = "principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp";  
    } else if ("<%= accion %>" !== "Aceptar") {
        document.location = "principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp&estado=Pendiente";  
    } else {
        document.location = "principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp";  
    }
</script>
