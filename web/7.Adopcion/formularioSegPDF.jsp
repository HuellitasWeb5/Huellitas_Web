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
    List<FormularioDeSeguimiento> formularios = FormularioDeSeguimiento.getListaEnObjetos(null, null); // Ajusta el método según tu implementación
    response.reset();
    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeSeguimiento formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());
        try {

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"formularioDeSeguimiento.pdf\"");

            OutputStream os = response.getOutputStream();
            Document documento = new Document();
            PdfWriter.getInstance(documento, os);

            documento.open();

            try {

                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(100);

                // Logo Fundación Villa Esperanza
                String relativeWebPath1 = "/presentacion/imagenes/Logo-Fundacion.png";
                String absoluteDiskPath1 = application.getRealPath(relativeWebPath1);
                Image logo1 = Image.getInstance(absoluteDiskPath1);
                logo1.scaleToFit(60, 60);

                PdfPCell cell1 = new PdfPCell(logo1);
                cell1.setBorder(PdfPCell.NO_BORDER);
                cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(cell1);

                // Logo Huellitas Web
                String relativeWebPath2 = "/presentacion/imagenes/Logo.png";
                String absoluteDiskPath2 = application.getRealPath(relativeWebPath2);
                Image logo2 = Image.getInstance(absoluteDiskPath2);
                logo2.scaleToFit(50, 50);

                PdfPCell cell2 = new PdfPCell(logo2);
                cell2.setBorder(PdfPCell.NO_BORDER);
                cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell2);

                documento.add(table);

            } catch (Exception e) {
                documento.add(new Paragraph("Error al cargar el logo: " + e.getMessage()));
            }

            // Título del documento
            Paragraph title = new Paragraph("Formulario de Seguimiento\n\n");
            title.setAlignment(Element.ALIGN_CENTER);
            documento.add(title);

            // Simulación de datos del formulario
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

            documento.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error al generar el PDF: " + e.getMessage());
        }
    }
%>
