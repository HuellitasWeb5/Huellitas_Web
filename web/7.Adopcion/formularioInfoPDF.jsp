import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GenerarPDF")
public class GenerarPDF extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configurar el tipo de respuesta como PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=formulario_adopcion.pdf");

        // Crear un documento PDF
        Document document = new Document();
        try {
            // Obtener el flujo de salida para escribir el PDF
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);
            document.open();

            // Agregar contenido al PDF
            document.add(new Paragraph("Formulario de Adopción"));
            document.add(new Paragraph("Identificación del Adoptante: " + request.getParameter("identificacionAdoptante")));
            document.add(new Paragraph("Código de Mascota: " + request.getParameter("codigoMascota")));
            document.add(new Paragraph("Ocupación: " + request.getParameter("ocupacion")));
            document.add(new Paragraph("Tiempo Libre: " + request.getParameter("tiempoLibre")));
            document.add(new Paragraph("Espacio: " + request.getParameter("espacio")));
            document.add(new Paragraph("Compromiso: " + request.getParameter("compromiso")));
            document.add(new Paragraph("Niños: " + request.getParameter("ninos")));
            document.add(new Paragraph("Habitantes: " + request.getParameter("habitantes")));
            document.add(new Paragraph("Responsables: " + request.getParameter("responsables")));
            document.add(new Paragraph("Otras Mascotas: " + request.getParameter("otrasMascotas")));
            document.add(new Paragraph("Propietario: " + request.getParameter("propietario")));
            document.add(new Paragraph("Motivación: " + request.getParameter("motivacion")));
            document.add(new Paragraph("Descripción: " + request.getParameter("descripcion")));
            document.add(new Paragraph("Fecha de Visita: " + request.getParameter("fechaVisitaDia")));
            document.add(new Paragraph("Hora de Visita: " + request.getParameter("fechaVisitaHora")));
            document.add(new Paragraph("Autorización de Datos: " + request.getParameter("autorizacion")));

            document.close();
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        }
    }
}
