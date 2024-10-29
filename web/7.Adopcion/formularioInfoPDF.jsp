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

        // Información del adoptante
        documento.add(new Paragraph("Adoptante:\n\n"));
        PdfPTable tablaAdoptante = new PdfPTable(2);
        tablaAdoptante.addCell("Identificación:");
        tablaAdoptante.addCell(formulario.getIdentificacionAdoptante());
        tablaAdoptante.addCell("Nombre:");
        tablaAdoptante.addCell(persona.getNombre());
        tablaAdoptante.addCell("Teléfono:");
        tablaAdoptante.addCell(persona.getTelefono());
        tablaAdoptante.addCell("Estado Civil:");
        tablaAdoptante.addCell(formulario.getEstadoCivil());
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
        String generoTexto = mascota.getGenero().equals("M") ? "Macho" : "Hembra";
        tablaMascota.addCell("Género:");
        tablaMascota.addCell(generoTexto);
        tablaMascota.addCell("Cuidados Especiales:");
        tablaMascota.addCell(mascota.getCuidadosEspeciales());
        documento.add(tablaMascota);
        documento.add(new Paragraph("\n"));

        documento.add(new Paragraph("Referencias Familiares:\n\n"));

        PdfPTable tablaRefFamiliares = new PdfPTable(2);

        tablaRefFamiliares.addCell("Nombre:");
        tablaRefFamiliares.addCell(formulario.getRefNombre1());
        tablaRefFamiliares.addCell("Cédula:");
        tablaRefFamiliares.addCell(formulario.getRefCedula1());
        tablaRefFamiliares.addCell("Dirección:");
        tablaRefFamiliares.addCell(formulario.getRefDireccion1());
        tablaRefFamiliares.addCell("Celular:");
        tablaRefFamiliares.addCell(formulario.getRefCelular1());
        documento.add(tablaRefFamiliares);
        documento.add(new Paragraph("\n"));

        PdfPTable tablaRefFamiliares2 = new PdfPTable(2);

        tablaRefFamiliares2.addCell("Nombre:");
        tablaRefFamiliares2.addCell(formulario.getRefNombre2());
        tablaRefFamiliares2.addCell("Cédula:");
        tablaRefFamiliares2.addCell(formulario.getRefCedula2());
        tablaRefFamiliares2.addCell("Dirección:");
        tablaRefFamiliares2.addCell(formulario.getRefDireccion2());
        tablaRefFamiliares2.addCell("Celular:");
        tablaRefFamiliares2.addCell(formulario.getRefCelular2());
        documento.add(tablaRefFamiliares2);
        documento.add(new Paragraph("\n"));

        documento.add(new Paragraph("Referencias Personales:\n\n"));

        PdfPTable tablaRefPersonales = new PdfPTable(2);

        tablaRefPersonales.addCell("Nombre:");
        tablaRefPersonales.addCell(formulario.getRefNombre3());
        tablaRefPersonales.addCell("Cédula:");
        tablaRefPersonales.addCell(formulario.getRefCedula3());
        tablaRefPersonales.addCell("Dirección:");
        tablaRefPersonales.addCell(formulario.getRefDireccion3());
        tablaRefPersonales.addCell("Celular:");
        tablaRefPersonales.addCell(formulario.getRefCelular3());
        documento.add(tablaRefPersonales);
        documento.add(new Paragraph("\n"));

        PdfPTable tablaRefPersonales2 = new PdfPTable(2);

        tablaRefPersonales2.addCell("Nombre:");
        tablaRefPersonales2.addCell(formulario.getRefNombre4());
        tablaRefPersonales2.addCell("Cédula:");
        tablaRefPersonales2.addCell(formulario.getRefCedula4());
        tablaRefPersonales2.addCell("Dirección:");
        tablaRefPersonales2.addCell(formulario.getRefDireccion4());
        tablaRefPersonales2.addCell("Celular:");
        tablaRefPersonales2.addCell(formulario.getRefCelular4());
        documento.add(tablaRefPersonales2);
        documento.add(new Paragraph("\n"));

        documento.add(new Paragraph("Detalles del formulario:\n\n"));

        PdfPTable tablaFormulario = new PdfPTable(2);

        // DETALLES DEL FORMULARIO
        
        tablaFormulario.addCell("Ocupación:");
        tablaFormulario.addCell(formulario.getOcupacion());

        tablaFormulario.addCell("¿Por qué desea adoptar al peludito?");
        tablaFormulario.addCell(formulario.getMotivacion());

        tablaFormulario.addCell("¿Actualmente tiene mascotas?");
        tablaFormulario.addCell(formulario.getOtrasMascotas().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Cúales?:");
        tablaFormulario.addCell(formulario.getOtrasMascotasR());

        tablaFormulario.addCell("¿Las mascotas están esterilizadas?");
        tablaFormulario.addCell(formulario.getEsterilizados().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Por qué no están esterilizadas?");
        tablaFormulario.addCell(formulario.getEsterilizadosR());

        tablaFormulario.addCell("¿Ha tenido otras mascotas anteriormente?");
        tablaFormulario.addCell(formulario.getAnteriorMascotas().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("Mascotas anteriores (especifique):");
        tablaFormulario.addCell(formulario.getAnteriorMascotasR());

        tablaFormulario.addCell("Número de habitantes en el hogar:");
        tablaFormulario.addCell(String.valueOf(formulario.getHabitantes()));

        tablaFormulario.addCell("¿Están de acuerdo en adoptar?");
        tablaFormulario.addCell(formulario.getHabitantesR().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Hay niños en el hogar?");
        tablaFormulario.addCell(formulario.getNinos().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("Edad de los niños (si aplica):");
        tablaFormulario.addCell(formulario.getNinosR());

        tablaFormulario.addCell("¿Alguien tiene alergias o asma?");
        tablaFormulario.addCell(formulario.getAlergias().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("Tipo de vivienda:");
        tablaFormulario.addCell(formulario.getVivienda());

        tablaFormulario.addCell("¿El propietario permite mascotas?");
        tablaFormulario.addCell(formulario.getPermiteMascotas().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Qué pasaría con la mascota si cambia de domicilio?");
        tablaFormulario.addCell(formulario.getCambiarDomicilio());

        tablaFormulario.addCell("Impacto de una ruptura familiar en la mascota:");
        tablaFormulario.addCell(formulario.getRupturaFamiliar());

        tablaFormulario.addCell("Proyección a futuro con la mascota:");
        tablaFormulario.addCell(formulario.getProyeccionFutura());

        tablaFormulario.addCell("Lugar donde dormirá la mascota:");
        tablaFormulario.addCell(formulario.getEspacio());

        tablaFormulario.addCell("Responsable del cuidado de la mascota:");
        tablaFormulario.addCell(formulario.getResponsables());

        tablaFormulario.addCell("Compromiso con la mascota:");
        tablaFormulario.addCell(formulario.getCompromiso().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("¿Autoriza visitas de seguimiento?");
        tablaFormulario.addCell(formulario.getAutorizaVisitas().equals("S") ? "Sí" : "No");

        tablaFormulario.addCell("Razón de autorización de visitas:");
        tablaFormulario.addCell(formulario.getAutorizaVisitasR());

        tablaFormulario.addCell("Días disponibles para la visita de seguimiento:");
        tablaFormulario.addCell(formulario.getFechaVisitaDia());

        tablaFormulario.addCell("Hora para la visita de seguimiento:");
        tablaFormulario.addCell(formulario.getFechaVisitaHora());

        tablaFormulario.addCell("Descripción adicional:");
        tablaFormulario.addCell(formulario.getDescripcion());

        tablaFormulario.addCell("Autorización de uso de datos:");
        tablaFormulario.addCell(formulario.getAutorizacionDatos().equals("S") ? "Sí" : "No");

        documento.add(tablaFormulario);
        documento.add(new Paragraph("\n"));
        // Añadir un título para la sección de imágenes
        documento.add(new Paragraph("Imágenes del formulario:\n\n"));

// Imagen de la vivienda
        if (formulario.getFotoVivienda() != null) {
            String rutaVivienda = application.getRealPath("/uploads/" + formulario.getFotoVivienda());
            Image imagenVivienda = Image.getInstance(rutaVivienda);
            imagenVivienda.scaleToFit(1000, 800);  // Ajusta el tamaño para que ocupe gran parte de la página
            documento.add(new Paragraph("Foto de Vivienda:"));
            documento.add(imagenVivienda);
            documento.newPage(); // Mueve a una nueva página después de esta imagen
        }

// Imagen del recibo
        if (formulario.getFotoRecibo() != null) {
            String rutaRecibo = application.getRealPath("/uploads/" + formulario.getFotoRecibo());
            Image imagenRecibo = Image.getInstance(rutaRecibo);
            imagenRecibo.scaleToFit(400, 400);  // Ajusta el tamaño para que ocupe gran parte de la página
            documento.add(new Paragraph("Foto de Recibo:"));
            documento.add(imagenRecibo);
            documento.newPage(); // Mueve a una nueva página después de esta imagen
        }

// Imagen de la cédula
        if (formulario.getFotoCedula() != null) {
            String rutaCedula = application.getRealPath("/uploads/" + formulario.getFotoCedula());
            Image imagenCedula = Image.getInstance(rutaCedula);
            imagenCedula.scaleToFit(400, 400);  // Ajusta el tamaño para que ocupe gran parte de la página
            documento.add(new Paragraph("Foto de Cédula:"));
            documento.add(imagenCedula);
            documento.newPage(); // Mueve a una nueva página después de esta imagen
        }

        documento.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error al generar el PDF: " + e.getMessage());
    }
%>
