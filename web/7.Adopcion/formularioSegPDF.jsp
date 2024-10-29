<%@page import="com.itextpdf.text.FontFactory"%>
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

        PdfPTable headerTable = new PdfPTable(3);
        headerTable.setWidthPercentage(100);
        headerTable.setWidths(new float[]{1, 3, 1});

        // LOGO FUNDACION 
        
        String relativeWebPath1 = "/presentacion/imagenes/Logo-Fundacion.png";
        String absoluteDiskPath1 = application.getRealPath(relativeWebPath1);
        Image logo1 = Image.getInstance(absoluteDiskPath1);
        logo1.scaleToFit(70, 70);
        PdfPCell cellLogo1 = new PdfPCell(logo1);
        cellLogo1.setBorder(PdfPCell.NO_BORDER);
        cellLogo1.setHorizontalAlignment(Element.ALIGN_LEFT);
        headerTable.addCell(cellLogo1);

        // INFORMACION FUNDACION 
        
        PdfPCell cellText = new PdfPCell();
        cellText.setBorder(PdfPCell.NO_BORDER);
        cellText.setHorizontalAlignment(Element.ALIGN_CENTER);
        cellText.setVerticalAlignment(Element.ALIGN_MIDDLE);
        Paragraph title1 = new Paragraph("FUNDACIÓN DE LA PATA CON LOS PELUDOS", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12));
        title1.setAlignment(Element.ALIGN_CENTER); // Centrar el texto
        Paragraph title2 = new Paragraph("ALBERGUE VILLA ESPERANZA", FontFactory.getFont(FontFactory.HELVETICA, 10));
        title2.setAlignment(Element.ALIGN_CENTER);
        Paragraph title3 = new Paragraph("NIT: 901128925-7", FontFactory.getFont(FontFactory.HELVETICA, 10));
        title3.setAlignment(Element.ALIGN_CENTER);
        Paragraph title4 = new Paragraph("FORMULARIO DE SEGUIMIENTO", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12));
        title4.setAlignment(Element.ALIGN_CENTER);
        cellText.addElement(title1);
        cellText.addElement(title2);
        cellText.addElement(title3);
        cellText.addElement(title4);
        headerTable.addCell(cellText);
        
        // LOGO HUELLITAS WEB
        
        String relativeWebPath2 = "/presentacion/imagenes/Logo.png";
        String absoluteDiskPath2 = application.getRealPath(relativeWebPath2);
        Image logo2 = Image.getInstance(absoluteDiskPath2);
        logo2.scaleToFit(60, 60);
        PdfPCell cellLogo2 = new PdfPCell(logo2);
        cellLogo2.setBorder(PdfPCell.NO_BORDER);
        cellLogo2.setHorizontalAlignment(Element.ALIGN_RIGHT);
        headerTable.addCell(cellLogo2);

        documento.add(headerTable);
        documento.add(new Paragraph("\n"));

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
