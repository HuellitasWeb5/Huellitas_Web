<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adopciones</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            width: 600px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
            height: 100px;
        }
        .button-group {
            margin-top: 20px;
        }
        .button-group button {
            padding: 10px 15px;
            margin-right: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Registro de Adopciones</h1>
        <form action="procesarAdopcion.jsp" method="post">
            <div class="form-group">
                <label for="codigoDonacion">Código de Donación:</label>
                <input type="text" id="codigoDonacion" name="codigoDonacion" required>
            </div>
            <div class="form-group">
                <label for="nombreAdoptante">Nombre del Adoptante:</label>
                <input type="text" id="nombreAdoptante" name="nombreAdoptante" required>
            </div>
            <div class="form-group">
                <label for="cedulaAdoptante">Cédula del Adoptante:</label>
                <input type="text" id="cedulaAdoptante" name="cedulaAdoptante" required>
            </div>
            <div class="form-group">
                <label for="celularAdoptante">Celular del Adoptante:</label>
                <input type="text" id="celularAdoptante" name="celularAdoptante" required>
            </div>
            <div class="form-group">
                <label for="direccionAdoptante">Dirección del Adoptante:</label>
                <input type="text" id="direccionAdoptante" name="direccionAdoptante" required>
            </div>
            <h2>Datos de la(s) Mascota(s)</h2>
            <div class="form-group">
                <label for="codigoMascota">Código de la Mascota:</label>
                <input type="text" id="codigoMascota" name="codigoMascota" required>
            </div>
            <div class="form-group">
                <label for="nombreMascota">Nombre de la Mascota:</label>
                <input type="text" id="nombreMascota" name="nombreMascota" required>
            </div>
            <div class="form-group">
                <label for="cuidadosEspeciales">Cuidados Especiales:</label>
                <textarea id="cuidadosEspeciales" name="cuidadosEspeciales"></textarea>
            </div>
            <div class="form-group">
                <label for="fechaAdopcion">Fecha de Adopción:</label>
                <input type="date" id="fechaAdopcion" name="fechaAdopcion" required>
            </div>

            <div class="button-group">
                <button type="submit">Guardar Adopción</button>
            </div>
        </form>
        
        <h2>Acciones</h2>
        <div class="button-group">
            <button onclick="window.location.href='verFormulario.jsp?codigoDonacion=<c:out value="${codigoDonacion}"/>'">Ver Formulario de Información Registrado</button>
            <button onclick="window.location.href='verSeguimiento.jsp?codigoDonacion=<c:out value="${codigoDonacion}"/>'">Ver Formulario de Seguimiento</button>
            <button onclick="window.location.href='verContrato.jsp?codigoDonacion=<c:out value="${codigoDonacion}"/>'">Ver Contrato de Adopción</button>
            <button onclick="window.location.href='generarWord.jsp?codigoDonacion=<c:out value="${codigoDonacion}"/>'">Generar en Word</button>
            <button onclick="window.location.href='generarPdf.jsp?codigoDonacion=<c:out value="${codigoDonacion}"/>'">Generar en PDF</button>
        </div>
    </div>
</body>
</html>
