<%@page import="java.util.List"%>
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
<%@page import="clases.FormularioDeSeguimiento"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8"%>

<%
    // Obtener el código del formulario desde el request
    String codigoFormulario = request.getParameter("codigoFormulario");

    // Cargar un único formulario de seguimiento usando el código
    FormularioDeSeguimiento formulario = new FormularioDeSeguimiento(codigoFormulario);

    // Cargar la información relacionada del adoptante y de la mascota
    Persona persona = new Persona(formulario.getIdentificacionAdoptante());
    Mascota mascota = new Mascota(formulario.getCodigoMascota());

    try {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"formularioSeguimiento.pdf\"");

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

        Paragraph title2 = new Paragraph("Formulario de Seguimiento\n\n");
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

        // Contenido del formulario (evaluaciones)
        documento.add(new Paragraph("Evaluación del estado y bienestar de la Mascota:\n\n"));

        PdfPTable tablaPreguntas = new PdfPTable(2);
        tablaPreguntas.setWidthPercentage(100);

        tablaPreguntas.addCell("¿Cómo describirías el estado actual de la salud de la mascota?");
        tablaPreguntas.addCell(formulario.getEvolucionMedica());

        tablaPreguntas.addCell("¿Cómo ha sido la evolución del peso de la mascota desde la adopción?");
        tablaPreguntas.addCell(formulario.getMasaCorporal());

        tablaPreguntas.addCell("¿Cómo describirías el estado emocional de la mascota?");
        tablaPreguntas.addCell(formulario.getEstadoEmocional());

        tablaPreguntas.addCell("¿Cómo se ha adaptado la mascota en su nuevo hogar?");
        tablaPreguntas.addCell(formulario.getAdaptacion());

        tablaPreguntas.addCell("¿Cómo es la relación del dueño con la mascota?");
        tablaPreguntas.addCell(formulario.getVinculo());

        tablaPreguntas.addCell("Fecha de la próxima visita:");
        tablaPreguntas.addCell(formulario.getFechaProximaVisita());

        tablaPreguntas.addCell("Descripción general del seguimiento:");
        tablaPreguntas.addCell(formulario.getDescripcion());

        tablaPreguntas.addCell("Calificación del bienestar del animal en su nuevo hogar:");
        String calificacion = formulario.getCalificacion();
        tablaPreguntas.addCell(calificacion + " estrellas");

        documento.add(tablaPreguntas);
        documento.add(new Paragraph("\n"));

        documento.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al generar el PDF: " + e.getMessage());
    }
%>
