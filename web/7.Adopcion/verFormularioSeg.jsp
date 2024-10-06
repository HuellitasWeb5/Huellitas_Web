<%-- 
    Document   : verFormularioSeguimiento
    Created on : 28 sept 2024, 17:58:41
    Author     : Angie
--%>

<%@page import="java.util.List"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.listarFormularios();
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formularios De Información</title>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>
<body>
    <h1>Formularios De Información</h1>

    <div class="contenedor-formularios">
        <% for (FormularioDeInformacion formulario : formularios) { %>
        <div class="tarjeta-formulario">
            <!-- Código del Formulario -->
            <div class="codigo-formulario">
                Código de Formulario: <strong><%= formulario.getCodigoFormulario() %></strong>
            </div>

            <!-- Datos del Adoptante -->
            <div class="adoptante-info">
                <h2>Adoptante</h2>
                <div class="datos-con-foto">
                    <div class="foto-adoptante-container">
                        <img src="<%= formulario.getFotoAdoptante() %>" alt="Foto del Adoptante" class="foto-adoptante">
                    </div>
                    <div class="datos-adoptante">
                        <p><strong><%= formulario.getNombreAdoptante() %></strong></p>
                        <p><i class="fa fa-id-card"></i> <%= formulario.getIdentificacionAdoptante() %></p>
                        <p><i class="fa fa-phone"></i> <%= formulario.getTelefono() %></p>
                        <p><i class="fa fa-home"></i> <%= formulario.getDireccion() %></p>
                        <p><i class="fa fa-map-marker"></i> <%= formulario.getResidencia() %></p>
                    </div>
                </div>
            </div>

            <!-- Datos de las Mascotas -->
            <div class="mascotas-info">
                <h2>Mascotas</h2>
                <% List<Mascota> mascotas = formulario.getMascotas(); %>
                <% for (Mascota mascota : mascotas) { %>
                    <div class="mascota">
                        <div class="datos-con-foto">
                            <div class="foto-mascota-container">
                                <img src="<%= mascota.getFoto() %>" alt="Foto de la Mascota" class="foto-mascota">
                            </div>
                            <div class="datos-mascota">
                                <p><strong><%= mascota.getNombre() %></strong> <i class="fa fa-paw"></i></p>
                                <p>Código: <%= mascota.getCodigo() %></p>
                                <p>C. Especiales: <%= mascota.getCuidadosEspeciales() %></p>
                                <p>Fecha Nacimiento: <%= mascota.getFechaNacimiento() %></p>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>

            <!-- Botones de Acción -->
            <div class="acciones">
                <form action="descargarFormulario.jsp" method="post">
                    <input type="hidden" name="codigoFormulario" value="<%= formulario.getCodigoFormulario() %>">
                    <button type="submit" class="btn-descargar">Descargar Formulario</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>

    <script>
        function aceptarFormulario(codigoFormulario) {
            alert("Formulario " + codigoFormulario + " aceptado");
        }

        function rechazarFormulario(codigoFormulario) {
            alert("Formulario " + codigoFormulario + " rechazado");
        }
    </script>
</body>
</html>
