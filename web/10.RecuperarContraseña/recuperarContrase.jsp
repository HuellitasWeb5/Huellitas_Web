<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeMultipart" %>
<%@ page import="javax.mail.Multipart" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Authenticator" %>
<link rel="stylesheet" href="../presentacion/styleContra.css"> <!-- Verifica la ruta -->

<html>
<head>
    <meta charset="UTF-8">
    <title>Recuperar Contraseña</title>
</head>
<body>
    
<form action="" method="post">
    <h1>RECUPERAR CONTRASEÑA</h1>
    <h2 class="subtitulo">Por favor, ingrese su número de identificación y se enviará </h2> <!-- Subtítulo con clase CSS -->
    <h2 class="subtitulo">un código al correo electrónico asociado a su cuenta.</h2> <!-- Subtítulo con clase CSS -->
    <label for="identificacion">Número de Identificación:</label>
    <input type="text" id="identificacionD" name="identificacion" required><br>

    <input type="submit" value="Recuperar Contraseña">
</form>
<a href='../index-InicioSesion.jsp'>Regresar al inicio</a>



<% 
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String identificacion = request.getParameter("identificacion");
        
        // Consulta a la base de datos para obtener el correo y la contraseña asociada al identificacion
        String correoDestino = null;
        String clave = null;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/huellitasweb?characterEncoding=utf8";
            conn = DriverManager.getConnection(url, "adso", "utilizar");
            
            String sql = "SELECT email, clave FROM persona WHERE identificacion = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, identificacion);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                correoDestino = rs.getString("email");
                clave = rs.getString("clave"); // La clave debe estar almacenada sin encriptar
            } else {
                out.println("<div class='notification-message'>Número de identificación no encontrado en la base de datos.</div>");
            }
        } catch (Exception e) {
            out.println("<div class='notification-message'>Error en la base de datos: " + e.getMessage() + "</div>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }

        // Si se encontró el correo y la clave, enviar el correo
        if (correoDestino != null && clave != null) {
            final String correoEnvia = "huellitasweb5@gmail.com";
            final String claveCorreo = "qfle glhu pqie lhlt";
            String asunto = "Recuperación de contraseña";
            String mensaje = "Tu contraseña es: " + clave;

            // Configuración del servidor SMTP
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.auth", "true");

            // Autenticación
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(correoEnvia, claveCorreo);
                }
            };

            // Crear la sesión de correo con autenticación
            Session mailSession = Session.getInstance(properties, auth);

            try {
                MimeMessage mimeMessage = new MimeMessage(mailSession);
                mimeMessage.setFrom(new InternetAddress(correoEnvia, "Recuperación de contraseña"));
                mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correoDestino));
                mimeMessage.setSubject(asunto);

                MimeBodyPart mimeBodyPart = new MimeBodyPart();
                mimeBodyPart.setText(mensaje);

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(mimeBodyPart);

                mimeMessage.setContent(multipart);

                // Enviar el correo
                Transport.send(mimeMessage);
                
                // Mostrar el correo con algunos caracteres en asteriscos
                String correoVisible = correoDestino.replaceAll("(?<=.{4}).(?=.@)", "*"); // Reemplaza todos menos los primeros cuatro y los caracteres después del '@'
                out.println("<div class='notification-message'>Correo enviado exitosamente a " + correoVisible + ".</div>");
            } catch (MessagingException e) {
                out.println("<div class='notification-message'>Error al enviar el correo: " + e.getMessage() + "</div>");
            }
        }
    }
%>
</body>
</html>