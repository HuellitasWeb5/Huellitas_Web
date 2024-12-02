<%-- 
    Document   : Recuperar Contrase�a
    Created on : 24/10/2024, 14:22:31
    Author     : Angie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<link rel="stylesheet" href="../presentacion/styleContra.css"> <!-- Verifica la ruta -->

<%
    String mensaje = "";
    String correoVisible = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String identificacion = request.getParameter("identificacion");

        // Consulta a la base de datos para obtener el correo y la contrase�a asociada al identificacion
        String correoDestino = null;
        String clave = null;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/HuellitasWeb?characterEncoding=utf8";
            conn = DriverManager.getConnection(url, "adso", "utilizar");

            String sql = "SELECT email, clave FROM persona WHERE identificacion = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, identificacion);
            rs = stmt.executeQuery();

            if (rs.next()) {
                correoDestino = rs.getString("email");
                clave = rs.getString("clave"); 
            } else {
                mensaje = "N�mero de identificaci�n no encontrado en la base de datos.";
            }
        } catch (Exception e) {
            mensaje = "Error en la base de datos: " + e.getMessage();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (Exception e) {
            }
            if (stmt != null) try {
                stmt.close();
            } catch (Exception e) {
            }
            if (conn != null) try {
                conn.close();
            } catch (Exception e) {
            }
        }

        // Si se encontr� el correo y la clave, enviar el correo
        if (correoDestino != null && clave != null) {
            final String correoEnvia = "huellitasweb5@gmail.com";
            final String claveCorreo = "qfle glhu pqie lhlt";
            String asunto = "Recuperaci�n de contrase�a";
            String mensajeCorreo = "�Hola! Tu c�digo para iniciar sesi�n es: " + clave + "\n\n"
            + "Recuerda que tu contrase�a est� encriptada para mayor seguridad. "
            + "Por favor, aseg�rate de copiarla exactamente como aparece para evitar problemas al iniciar sesi�n."
            + "\n\n"
            + "IMPORTANTE:Debes cambiar tu contrase�a tan pronto como inicies sesi�n, para garantizar a�n m�s tu seguridad."
            + "\n\n"
            + "�Gracias por confiar en nosotros!";


            // Configuraci�n del servidor SMTP
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.auth", "true");

            // Autenticaci�n
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(correoEnvia,claveCorreo);
                }
            };

            // Crear la sesi�n de correo con autenticaci�n
            Session mailSession = Session.getInstance(properties,auth);

            try {
                MimeMessage mimeMessage = new MimeMessage(mailSession);
                mimeMessage.setFrom(new InternetAddress(correoEnvia, "Recuperaci�n de contrase�a"));
                mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correoDestino));
                mimeMessage.setSubject(asunto);

                MimeBodyPart mimeBodyPart = new MimeBodyPart();
                mimeBodyPart.setText(mensajeCorreo);

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(mimeBodyPart);

                mimeMessage.setContent(multipart);

                // Enviar el correo
                Transport.send(mimeMessage);

                // Mostrar el correo con algunos caracteres en asteriscos
                correoVisible = correoDestino.replaceAll("(?<=.{4}).(?=.@)", "");
                mensaje = "Correo enviado exitosamente a " + correoVisible + ".";
            } catch (MessagingException e) {
                mensaje = "Error al enviar el correo: " + e.getMessage();
            }
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Recuperar Contrase�a</title>
        <link rel="stylesheet" href="../presentacion/styleContra.css">
    </head>
    <body>
        <div class="fondo-container">
            <img src="../presentacion/imagenes/fondoVillaEsperanza.jpg" class="fondoVE">
        </div>
        <div class="logo-container">
            <img src="../presentacion/imagenes/Logo-Fundacion.png" alt="Logo Izquierdo" class="logo logo-left">
            <img src="../presentacion/imagenes/Logo.png" alt="Logo Derecho" class="logo logo-right">
        </div>
        <div class="container">
            <h1 class="title">Recuperar Contrase�a</h1>

            <!-- Formulario de recuperaci�n -->
            <form action="" method="post">
                <p class="subtitulo">Por favor, ingrese su n�mero de identificaci�n.</p>
                <p class="subtitulo">Le enviaremos un c�digo de recuperaci�n al correo electr�nico asociado a su cuenta.</p>
                <div class="input-box">
                    <label for="usuario">N�mero de identificaci�n:</label>
                    <div class="icon-input">
                        <input type="text" name="identificacion" id="usuario" required>
                    </div>
                </div>

                <% if (!mensaje.isEmpty()) { %>
                    <p id="mensaje" class="mensaje-error"><%= mensaje %></p>
                <% } %>

                <input type="submit" value="Recuperar Contrase�a">
            </form>

            <div class="volver">
                <a href="../index-InicioSesion.jsp">Regresar al inicio</a>
            </div>
        </div>
    </body>
</html>
