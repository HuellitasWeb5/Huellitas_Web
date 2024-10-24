<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8"%>

<%
    // Recibir el código del formulario desde el request
    String codigoFormulario = request.getParameter("codigoFormulario");

    // Cargar un único formulario de información usando el código
    FormularioDeInformacion formulario = new FormularioDeInformacion(codigoFormulario);

    // Cargar la información relacionada del adoptante y de la mascota
    Persona persona = new Persona(formulario.getIdentificacionAdoptante());
    Mascota mascota = new Mascota(formulario.getCodigoMascota());

    try {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"formularioInformacion.pdf\"");

        OutputStream os = response.getOutputStream();
        Document documento = new Document();
        PdfWriter.getInstance(documento, os);

        documento.open();

        // Agregar los logos (Fundación Villa Esperanza y Huellitas Web)
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);

        String relativeWebPath1 = "/presentacion/imagenes/Logo-Fundacion.png";
        String absoluteDiskPath1 = application.getRealPath(relativeWebPath1);
        Image logo1 = Image.getInstance(absoluteDiskPath1);
        logo1.scaleToFit(60, 60);

        PdfPCell cell1 = new PdfPCell(logo1);
        cell1.setBorder(PdfPCell.NO_BORDER);
        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(cell1);

        String relativeWebPath2 = "/presentacion/imagenes/Logo.png";
        String absoluteDiskPath2 = application.getRealPath(relativeWebPath2);
        Image logo2 = Image.getInstance(absoluteDiskPath2);
        logo2.scaleToFit(50, 50);

        PdfPCell cell2 = new PdfPCell(logo2);
        cell2.setBorder(PdfPCell.NO_BORDER);
        cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.addCell(cell2);

        documento.add(table);

        // Título del documento
        Paragraph title = new Paragraph("FUNDACIÓN VILLA ESPERANZA\n");
        title.setAlignment(Element.ALIGN_CENTER);
        documento.add(title);

        Paragraph title2 = new Paragraph("Formulario de Adopción\n\n");
        title2.setAlignment(Element.ALIGN_CENTER);
        documento.add(title2);

        // Información del adoptante
        documento.add(new Paragraph("Adoptante:\n\n"));
        PdfPTable tablaAdoptante = new PdfPTable(2);
        tablaAdoptante.addCell("Identificación:");
        tablaAdoptante.addCell(formulario.getIdentificacionAdoptante());
        tablaAdoptante.addCell("Nombre:");
        tablaAdoptante.addCell(persona.getNombre());
        tablaAdoptante.addCell("Teléfono:");
        tablaAdoptante.addCell(persona.getTelefono());
        tablaAdoptante.addCell("Dirección:");
        tablaAdoptante.addCell(persona.getDireccion());
        tablaAdoptante.addCell("Residencia:");
        tablaAdoptante.addCell(persona.getResidencia());
        documento.add(tablaAdoptante);
        documento.add(new Paragraph("\n"));

        // Información de la mascota
        documento.add(new Paragraph("Mascota:\n\n"));
        PdfPTable tablaMascota = new PdfPTable(2);
        tablaMascota.addCell("Código:");
        tablaMascota.addCell(mascota.getCodigo());
        tablaMascota.addCell("Nombre:");
        tablaMascota.addCell(mascota.getNombre());
        tablaMascota.addCell("Fecha de Nacimiento Aproximada:");
        tablaMascota.addCell(mascota.getFechaNacimientoAproximada());
        tablaMascota.addCell("Género:");
        tablaMascota.addCell(mascota.getGenero());
        tablaMascota.addCell("Cuidados Especiales:");
        tablaMascota.addCell(mascota.getCuidadosEspeciales());
        documento.add(tablaMascota);
        documento.add(new Paragraph("\n"));

        // Contenido del formulario (detalles de adopción)
        documento.add(new Paragraph("Detalles del Formulario de Adopción:\n\n"));

        PdfPTable tablaFormulario = new PdfPTable(2); // Tabla con dos columnas

        tablaFormulario.addCell("¿Cuál es su ocupación?");
        tablaFormulario.addCell(formulario.getOcupacion());

        tablaFormulario.addCell("¿Cuenta con tiempo de calidad para el cuidado de la mascota?");
        tablaFormulario.addCell(formulario.getTiempoLibre().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Cuenta con un espacio adecuado para el cuidado de la mascota?");
        tablaFormulario.addCell(formulario.getEspacio().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Está dispuesto a esterilizar a la mascota y proporcionarle atención médica regular?");
        tablaFormulario.addCell(formulario.getCompromiso().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿En el hogar viven niños? ¿Cuántos?");
        tablaFormulario.addCell(String.valueOf(formulario.getNinos()));

        tablaFormulario.addCell("¿Cuántas personas conforman su hogar?");
        tablaFormulario.addCell(String.valueOf(formulario.getHabitantes()));

        tablaFormulario.addCell("¿Cuántas personas estarán al cuidado de la mascota?");
        tablaFormulario.addCell(String.valueOf(formulario.getResponsables()));

        tablaFormulario.addCell("¿Tiene otras mascotas a su cargo?");
        tablaFormulario.addCell(formulario.getOtrasMascotas().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Es propietario de la vivienda en la que reside?");
        tablaFormulario.addCell(formulario.getPropietario().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Cuál es el motivo por el cuál desea adoptar a la mascota?");
        tablaFormulario.addCell(formulario.getMotivacion());

        tablaFormulario.addCell("Días disponibles para recibir la visita de seguimiento:");
        tablaFormulario.addCell(formulario.getFechaVisitaDia());

        tablaFormulario.addCell("Hora estimada de visita:");
        tablaFormulario.addCell(formulario.getFechaVisitaHora());

        tablaFormulario.addCell("Descripción adicional:");
        tablaFormulario.addCell(formulario.getDescripcion());

        documento.add(tablaFormulario);
        documento.add(new Paragraph("\n"));

        // Cierre del documento
        documento.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al generar el PDF: " + e.getMessage());
    }
%>
