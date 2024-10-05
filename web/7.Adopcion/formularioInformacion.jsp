<%-- 
    Document   : FormularioInformacion
    Created on : 5/10/2024, 02:37:31 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.FormularioDeInformacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();
    formularioDeInformacion.setCodigo("Sin generar");
    if (accion.equals("Modificar")) {
        formularioDeInformacion = new FormularioDeInformacion(codigo);
    }
%>  
<body>
    <h3><%=accion.toUpperCase()%> ADOPCIONES </h3>
    <form action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp" method="post" enctype="multipart/form-data">
        <div class="containerFormulario">
            <table  class="tableFormulario">

                <label for="ocupacion">¿Cuál es su ocupación?</label>
                <input type="text" id="ocupacion" name="ocupacion" maxlength="100" required><br><br>

                <label for="tiempoLibre">¿Cuenta con tiempo de calidad para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="tiempoLibreSi" name="tiempoLibre" value="S">
                    <label for="tiempoLibreSi">Sí</label>
                    <input type="radio" id="tiempoLibreNo" name="tiempoLibre" value="N">
                    <label for="tiempoLibreNo">No</label>
                </fieldset>

                <label for="espacio">¿Cuenta con un espacio adecuado para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="espacioSi" name="espacio" value="S">
                    <label for="espacioSi">Sí</label>
                    <input type="radio" id="espacioNo" name="espacio" value="N">
                    <label for="espacioNo">No</label>
                </fieldset>

                <label for="compromiso">¿Está dispuesto a esterilizar a la mascota y proporcionarle atención médica regular?</label>
                <fieldset>
                    <input type="radio" id="compromisoSi" name="compromiso" value="S">
                    <label for="compromisoSi">Sí</label>
                    <input type="radio" id="compromisoNo" name="compromiso" value="N">
                    <label for="compromisoNo">No</label>
                </fieldset>

                <label for="ninos">¿En el hogar viven niños? ¿Cuántos?</label>
                <input type="number" id="ninos" name="ninos" min="0" required placeholder="0"><br><br>

                <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
                <input type="number" id="habitantes" name="habitantes" min="1" required placeholder="0"><br><br>

                <label for="responsables">¿Cuántas personas estarán al cuidado de la mascota?</label>
                <input type="number" id="responsables" name="responsables" min="1" required placeholder="0"><br><br>

                <label for="otrasMascotas">¿Tiene otras mascotas a su cargo?</label>
                <fieldset>
                    <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="S">
                    <label for="otrasMascotasSi">Sí</label>
                    <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="N">
                    <label for="otrasMascotasNo">No</label>
                </fieldset>

                <label for="propietario">¿Es propietario de la vivienda en la que reside?</label>
                <fieldset>
                    <input type="radio" id="propietarioSi" name="propietario" value="S">
                    <label for="propietarioSi">Sí</label>
                    <input type="radio" id="propietarioNo" name="propietario" value="N">
                    <label for="propietarioNo">No</label>
                </fieldset>

                <label for="motivacion">¿Cuál es el motivo por el cuál desea adoptar a la mascota?</label>
                <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

                <label for="fechaVisitaDia">Por favor, indíquenos los días en los que estaría disponible para recibir la visita de seguimiento con respecto al cuidado de la mascota:</label>
                <br>
                <div style="display: flex; gap: 25px;">
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Lunes"> Lunes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Martes"> Martes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Miércoles"> Miércoles</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Jueves"> Jueves</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Viernes"> Viernes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Sábado"> Sábado</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Domingo"> Domingo</label>
                </div>
                <br>

                <label for="fechaVisitaHora">Selecciona la hora estimada de visita:</label>
                <input type="time" id="fechaVisitaHora" name="fechaVisitaHora" style="width: 120px; text-align: center;">

                <label for="fotoVivienda">Por favor, suba una foto del espacio donde vivirá la mascota (puede incluir foto de la cama, alimento o accesorios):</label>
                <br><input type="file" id="fotoVivienda" name="fotoVivienda" accept="image/*, application/pdf" >
                <br>

                <label for="fotoRecibo">Por favor, cargue una foto del recibo de servicios públicos de su vivienda (gas, energía o agua):</label>
                <br><input type="file" id="fotoRecibo" name="fotoRecibo" accept="image/*, application/pdf">
                <br>

                <label for="fotoCedula">Por favor, cargue una foto de su cédula de ciudadanía:</label>
                <br><input type="file" id="fotoCedula" name="fotoCedula" accept="image/*, application/pdf">
                <br>

                <label for="descripcion">Descripción adicional:</label>
                <br><textarea id="descripcion" name="descripcion" rows="4" cols="88" required></textarea><br><br>

                <div style="display: flex; align-items: center;">
                    <input type="checkbox" id="autorizacion" name="autorizacion" value="S" required>
                    <label for="autorizacion" style="margin-left: 8px;">Autorizo el uso de mis datos personales exclusivamente para fines relacionados con la adopción 
                        y el bienestar de la(s) mascota(s), en cumplimiento con la legislación vigente en materia de protección de datos.</label>
                </div>
                <br><br>
                <div class="btn-container">
                    <input type="hidden" name="id" value="<%=codigo%>">
                    <input class="btn-adicionar"  type="submit" name="accion" value="<%=accion%>">
                    <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">
                </div>
            </table>
        </div>
    </form>
</body>
