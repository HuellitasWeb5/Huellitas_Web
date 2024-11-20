<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.FontFactory"%>
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
    String codigoFormulario = request.getParameter("codigoFormulario");

    FormularioDeInformacion formulario = new FormularioDeInformacion(codigoFormulario);
    Persona persona = new Persona(formulario.getIdentificacionAdoptante());
    Mascota mascota = new Mascota(formulario.getCodigoMascota());

    try {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"formularioInformacion.pdf\"");

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
        Paragraph title4 = new Paragraph("FORMULARIO DE PRE-ADOPCIÓN", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12));
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
        fechaParrafo.add(new Phrase("Fecha de solicitud: ", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));  // Título en negrita
        fechaParrafo.add(new Phrase(formulario.getFecha(), FontFactory.getFont(FontFactory.HELVETICA, 12)));  // Contenido en texto normal
        documento.add(fechaParrafo);
        
        Paragraph estado = new Paragraph();
        estado.add(new Phrase("Estado: ", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));  // Título en negrita
        estado.add(new Phrase(formulario.getEstado(), FontFactory.getFont(FontFactory.HELVETICA, 12)));  // Contenido en texto normal
        documento.add(estado);
        documento.add(new Paragraph("\n"));

        // Información del adoptante

        documento.add(new Paragraph("Adoptante:\n\n"));

        PdfPTable tablaAdoptante = createStyledTable(2);
        tablaAdoptante.addCell(createTitleCell("Identificación:"));
        tablaAdoptante.addCell(createContentCell(formulario.getIdentificacionAdoptante()));
        tablaAdoptante.addCell(createTitleCell("Nombre:"));
        tablaAdoptante.addCell(createContentCell(persona.getNombre()));
        tablaAdoptante.addCell(createTitleCell("Teléfono:"));
        tablaAdoptante.addCell(createContentCell(persona.getTelefono()));
        tablaAdoptante.addCell(createTitleCell("Estado Civil:"));
        tablaAdoptante.addCell(createContentCell(formulario.getEstadoCivil()));
        tablaAdoptante.addCell(createTitleCell("Ocupación:"));
        tablaAdoptante.addCell(createContentCell(formulario.getOcupacion()));
        tablaAdoptante.addCell(createTitleCell("Dirección:"));
        tablaAdoptante.addCell(createContentCell(persona.getDireccion()));
        tablaAdoptante.addCell(createTitleCell("Residencia:"));
        tablaAdoptante.addCell(createContentCell(persona.getResidencia()));
        documento.add(tablaAdoptante);
        documento.add(new Paragraph("\n"));

        // Información de la mascota
        documento.add(new Paragraph("Mascota:\n\n"));

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

        documento.add(new Paragraph("Referencias Familiares:\n\n"));

        PdfPTable tablaRefFamiliares = createStyledTable(2);
        tablaRefFamiliares.addCell(createTitleCell("Nombre:"));
        tablaRefFamiliares.addCell(createContentCell(formulario.getRefNombre1()));
        tablaRefFamiliares.addCell(createTitleCell("Cédula:"));
        tablaRefFamiliares.addCell(createContentCell(formulario.getRefCedula1()));
        tablaRefFamiliares.addCell(createTitleCell("Dirección:"));
        tablaRefFamiliares.addCell(createContentCell(formulario.getRefDireccion1()));
        tablaRefFamiliares.addCell(createTitleCell("Celular:"));
        tablaRefFamiliares.addCell(createContentCell(formulario.getRefCelular1()));
        documento.add(tablaRefFamiliares);
        documento.add(new Paragraph("\n"));

        PdfPTable tablaRefFamiliares2 = createStyledTable(2);
        tablaRefFamiliares2.addCell(createTitleCell("Nombre:"));
        tablaRefFamiliares2.addCell(createContentCell(formulario.getRefNombre2()));
        tablaRefFamiliares2.addCell(createTitleCell("Cédula:"));
        tablaRefFamiliares2.addCell(createContentCell(formulario.getRefCedula2()));
        tablaRefFamiliares2.addCell(createTitleCell("Dirección:"));
        tablaRefFamiliares2.addCell(createContentCell(formulario.getRefDireccion2()));
        tablaRefFamiliares2.addCell(createTitleCell("Celular:"));
        tablaRefFamiliares2.addCell(createContentCell(formulario.getRefCelular2()));
        documento.add(tablaRefFamiliares2);
        documento.add(new Paragraph("\n"));

        documento.add(new Paragraph("Referencias Personales:\n\n"));

        PdfPTable tablaRefPersonales = createStyledTable(2);
        tablaRefPersonales.addCell(createTitleCell("Nombre:"));
        tablaRefPersonales.addCell(createContentCell(formulario.getRefNombre3()));
        tablaRefPersonales.addCell(createTitleCell("Cédula:"));
        tablaRefPersonales.addCell(createContentCell(formulario.getRefCedula3()));
        tablaRefPersonales.addCell(createTitleCell("Dirección:"));
        tablaRefPersonales.addCell(createContentCell(formulario.getRefDireccion3()));
        tablaRefPersonales.addCell(createTitleCell("Celular:"));
        tablaRefPersonales.addCell(createContentCell(formulario.getRefCelular3()));
        documento.add(tablaRefPersonales);
        documento.add(new Paragraph("\n"));

        PdfPTable tablaRefPersonales2 = createStyledTable(2);
        tablaRefPersonales2.addCell(createTitleCell("Nombre:"));
        tablaRefPersonales2.addCell(createContentCell(formulario.getRefNombre4()));
        tablaRefPersonales2.addCell(createTitleCell("Cédula:"));
        tablaRefPersonales2.addCell(createContentCell(formulario.getRefCedula4()));
        tablaRefPersonales2.addCell(createTitleCell("Dirección:"));
        tablaRefPersonales2.addCell(createContentCell(formulario.getRefDireccion4()));
        tablaRefPersonales2.addCell(createTitleCell("Celular:"));
        tablaRefPersonales2.addCell(createContentCell(formulario.getRefCelular4()));
        documento.add(tablaRefPersonales2);
        documento.add(new Paragraph("\n"));

        documento.add(new Paragraph("Detalles del formulario:\n\n"));

        PdfPTable tablaFormulario = createStyledTable(2);

        // DETALLES DEL FORMULARIO
        tablaFormulario.addCell(createTitleCell("¿Por qué desea adoptar al peludito?"));
        tablaFormulario.addCell(createContentCell(formulario.getMotivacion()));
        tablaFormulario.addCell(createTitleCell("¿Tiene alguna mascota actualmente?"));
        tablaFormulario.addCell(createContentCell(formulario.getOtrasMascotas().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Qué tipo de animalitos son?"));
        tablaFormulario.addCell(createContentCell(formulario.getOtrasMascotasR()));
        tablaFormulario.addCell(createTitleCell("¿Están esterilizados?"));
        tablaFormulario.addCell(createContentCell(formulario.getEsterilizados().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Por qué no están esterilizadas?"));
        tablaFormulario.addCell(createContentCell(formulario.getEsterilizadosR()));
        tablaFormulario.addCell(createTitleCell("¿Ha tenido otras mascotas anteriormente?"));
        tablaFormulario.addCell(createContentCell(formulario.getAnteriorMascotas().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Qué tipo de animalitos eran?"));
        tablaFormulario.addCell(createContentCell(formulario.getAnteriorMascotasR()));
        tablaFormulario.addCell(createTitleCell("¿Cuántas personas conforman su hogar?"));
        tablaFormulario.addCell(createContentCell(String.valueOf(formulario.getHabitantes())));
        tablaFormulario.addCell(createTitleCell("¿Están de acuerdo en adoptar?"));
        tablaFormulario.addCell(createContentCell(formulario.getHabitantesR().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Hay niños en el hogar?"));
        tablaFormulario.addCell(createContentCell(formulario.getNinos().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Qué edad(es) tiene(n)?"));
        tablaFormulario.addCell(createContentCell(formulario.getNinosR()));
        tablaFormulario.addCell(createTitleCell("¿Alguien de su hogar es alérgico a los animalitos o sufre de asma?"));
        tablaFormulario.addCell(createContentCell(formulario.getAlergias().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("La casa y/o apartamento donde vive actualmente es:"));
        tablaFormulario.addCell(createContentCell(formulario.getVivienda()));
        tablaFormulario.addCell(createTitleCell("¿El propietario permite animalitos?"));
        tablaFormulario.addCell(createContentCell(formulario.getPermiteMascotas().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("Si por algún motivo tuviera que cambiar de domicilio, ¿Qué pasaría con el peludito?"));
        tablaFormulario.addCell(createContentCell(formulario.getCambiarDomicilio()));
        tablaFormulario.addCell(createTitleCell("En caso de una ruptura en la familia (divorcio, fallecimiento) o la llegada de un nuevo integrante ¿Cuáles serían los cambios en el trato hacia el peludito adoptado?"));
        tablaFormulario.addCell(createContentCell(formulario.getRupturaFamiliar()));
        tablaFormulario.addCell(createTitleCell("¿Cómo se ve con el peludito que desea adoptar dentro de 5 años?"));
        tablaFormulario.addCell(createContentCell(formulario.getProyeccionFutura()));
        tablaFormulario.addCell(createTitleCell("¿En qué área de la casa dormirá el peludito?"));
        tablaFormulario.addCell(createContentCell(formulario.getEspacio()));
        tablaFormulario.addCell(createTitleCell("¿Con quién permanecerá el peludito durante el día?"));
        tablaFormulario.addCell(createContentCell(formulario.getResponsables()));
        tablaFormulario.addCell(createTitleCell("Si el comportamiento del peludito no es el que usted desea (juguetón, mordelón, inquieto, mimado, rebelde), ¿Qué medidas tomaría?"));
        tablaFormulario.addCell(createContentCell(formulario.getCompromiso().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Está de acuerdo en que se haga una visita periódica a su domicilio para ver cómo se encuentra el peludito adoptado?"));
        tablaFormulario.addCell(createContentCell(formulario.getAutorizaVisitas().equals("S") ? "Sí" : "No"));
        tablaFormulario.addCell(createTitleCell("¿Por qué motivo no desea que se realicen visitas de seguimiento?"));
        tablaFormulario.addCell(createContentCell(formulario.getAutorizaVisitasR()));
        tablaFormulario.addCell(createTitleCell("Días disponibles para recibir la visita de seguimiento:"));
        tablaFormulario.addCell(createContentCell(formulario.getFechaVisitaDia()));
        tablaFormulario.addCell(createTitleCell("¿A qué hora le gustaría programar la visita para el día seleccionado?"));
        tablaFormulario.addCell(createContentCell(formulario.getFechaVisitaHora()));
        tablaFormulario.addCell(createTitleCell("Descripción adicional:"));
        tablaFormulario.addCell(createContentCell(formulario.getDescripcion()));
        tablaFormulario.addCell(createTitleCell("Autorización de uso de los datos personales:"));
        tablaFormulario.addCell(createContentCell(formulario.getAutorizacionDatos().equals("S") ? "Sí" : "No"));

        documento.add(tablaFormulario);
        documento.add(new Paragraph("\n"));

        documento.newPage();

        documento.add(new Paragraph("Imágenes del formulario:\n\n"));

        // Imagen de la cédula
        if (formulario.getFotoCedula() != null) {
            String rutaCedula = application.getRealPath("/uploads/" + formulario.getFotoCedula());
            Image imagenCedula = Image.getInstance(rutaCedula);
            imagenCedula.scaleToFit(500, 480);
            documento.add(new Paragraph("Foto de la cédula de ciudadanía:"));
            documento.add(imagenCedula);
            documento.newPage();
        }

        // Imagen del recibo
        if (formulario.getFotoRecibo() != null) {
            String rutaRecibo = application.getRealPath("/uploads/" + formulario.getFotoRecibo());
            Image imagenRecibo = Image.getInstance(rutaRecibo);
            imagenRecibo.scaleToFit(500, 480);
            documento.add(new Paragraph("Foto del recibo de servicios públicos:"));
            documento.add(imagenRecibo);
            documento.newPage();
        }

        // Imagen de la vivienda
        if (formulario.getFotoVivienda() != null) {
            String rutaVivienda = application.getRealPath("/uploads/" + formulario.getFotoVivienda());
            Image imagenVivienda = Image.getInstance(rutaVivienda);
            imagenVivienda.scaleToFit(500, 480);
            documento.add(new Paragraph("Foto adicional:"));
            documento.add(imagenVivienda);
            documento.newPage();
        }

        documento.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al generar el PDF: " + e.getMessage());
    }
%>

