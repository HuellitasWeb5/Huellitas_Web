<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Phrase"%>
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

<%!
    public PdfPCell createTitleCell(String text) {
        PdfPCell cell = new PdfPCell(new Phrase(text, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setPadding(5);
        cell.setBorderWidth(1);
        return cell;
    }

    public PdfPCell createContentCell(String text) {
        PdfPCell cell = new PdfPCell(new Phrase(text, FontFactory.getFont(FontFactory.HELVETICA, 12)));
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setPadding(5);
        cell.setBorderWidth(1);
        return cell;
    }

    public PdfPTable createStyledTable(int numColumns) {
        PdfPTable table = new PdfPTable(numColumns);
        table.setWidthPercentage(90);
        return table;
    }
%>

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

        Paragraph fechaParrafo = new Paragraph();
        fechaParrafo.add(new Phrase("Fecha de visita: ", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));  // Título en negrita
        fechaParrafo.add(new Phrase(formulario.getFecha(), FontFactory.getFont(FontFactory.HELVETICA, 12)));  // Contenido en texto normal
        documento.add(fechaParrafo);
        documento.add(new Paragraph("\n"));

        // Información del adoptante
        documento.add(new Paragraph("Adoptante:\n\n",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));

        PdfPTable tablaAdoptante = createStyledTable(2);
        tablaAdoptante.addCell(createTitleCell("Identificación:"));
        tablaAdoptante.addCell(createContentCell(formulario.getIdentificacionAdoptante()));
        tablaAdoptante.addCell(createTitleCell("Nombre:"));
        tablaAdoptante.addCell(createContentCell(persona.getNombre()));
        tablaAdoptante.addCell(createTitleCell("Teléfono:"));
        tablaAdoptante.addCell(createContentCell(persona.getTelefono()));
        tablaAdoptante.addCell(createTitleCell("Dirección:"));
        tablaAdoptante.addCell(createContentCell(persona.getDireccion()));
        tablaAdoptante.addCell(createTitleCell("Residencia:"));
        tablaAdoptante.addCell(createContentCell(persona.getResidencia()));
        documento.add(tablaAdoptante);
        documento.add(new Paragraph("\n"));

        // Información de la mascota
        documento.add(new Paragraph("Mascota:\n\n",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));

        PdfPTable tablaMascota = createStyledTable(2);
        tablaMascota.addCell(createTitleCell("Código:"));
        tablaMascota.addCell(createContentCell(mascota.getCodigo()));
        tablaMascota.addCell(createTitleCell("Nombre:"));
        tablaMascota.addCell(createContentCell(mascota.getNombre()));
        tablaMascota.addCell(createTitleCell("Fecha de Nacimiento Aproximada:"));
        tablaMascota.addCell(createContentCell(mascota.getFechaNacimientoAproximada()));
        String generoTexto = mascota.getGenero().equals("M") ? "Macho" : "Hembra";
        tablaMascota.addCell(createTitleCell("Género:"));
        tablaMascota.addCell(createContentCell(generoTexto));
        tablaMascota.addCell(createTitleCell("Cuidados Especiales:"));
        tablaMascota.addCell(createContentCell(mascota.getCuidadosEspeciales()));

        documento.add(tablaMascota);
        documento.add(new Paragraph("\n"));

        // Contenido del formulario (evaluaciones)
        documento.add(new Paragraph("Evaluación del estado y bienestar de la Mascota:\n\n",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));;

        PdfPTable tablaPreguntas = createStyledTable(2);

        tablaPreguntas.addCell(createTitleCell("¿Cómo describirías el estado actual de la salud de la mascota?"));
        tablaPreguntas.addCell(createContentCell(formulario.getEvolucionMedica()));
        tablaPreguntas.addCell(createTitleCell("¿Cómo describirías el estado actual de la salud de la mascota?"));
        tablaPreguntas.addCell(createContentCell(formulario.getEvolucionMedica()));
        tablaPreguntas.addCell(createTitleCell("¿Cómo ha sido la evolución del peso de la mascota desde la adopción?"));
        tablaPreguntas.addCell(createContentCell(formulario.getMasaCorporal()));
        tablaPreguntas.addCell(createTitleCell("¿Cómo describirías el estado emocional de la mascota?"));
        tablaPreguntas.addCell(createContentCell(formulario.getEstadoEmocional()));
        tablaPreguntas.addCell(createTitleCell("¿Cómo se ha adaptado la mascota en su nuevo hogar?"));
        tablaPreguntas.addCell(createContentCell(formulario.getAdaptacion()));
        tablaPreguntas.addCell(createTitleCell("¿Cómo es la relación del dueño con la mascota?"));
        tablaPreguntas.addCell(createContentCell(formulario.getVinculo()));
        tablaPreguntas.addCell(createTitleCell("Fecha de la próxima visita:"));
        tablaPreguntas.addCell(createContentCell(formulario.getFechaProximaVisita()));
        tablaPreguntas.addCell(createTitleCell("Descripción general del seguimiento:"));
        tablaPreguntas.addCell(createContentCell(formulario.getDescripcion()));
        tablaPreguntas.addCell(createTitleCell("Calificación del bienestar del animal en su nuevo hogar:"));
        String calificacion = formulario.getCalificacion();
        tablaPreguntas.addCell(createContentCell((calificacion + " estrellas")));

        documento.add(tablaPreguntas);
        documento.add(new Paragraph("\n",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));
        
        Paragraph tituloFoto = new Paragraph("FOTO DEL PELUDITO",
        FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)); 
        tituloFoto.setAlignment(Element.ALIGN_CENTER);
        tituloFoto.setSpacingBefore(20);
        tituloFoto.setSpacingAfter(20);
        documento.add(tituloFoto);

        // Imagen de la mascota
        if (formulario.getFoto() != null) {
            String rutaMascota = application.getRealPath("/uploads/" + formulario.getFoto());
            Image imagenMascota = Image.getInstance(rutaMascota);
            imagenMascota.scaleToFit(500, 480);
            documento.add(imagenMascota);
            documento.newPage();
        }

        documento.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al generar el PDF: " + e.getMessage());
    }
%>