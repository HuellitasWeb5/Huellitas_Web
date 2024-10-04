<%-- 
    Document   : verFormularioInformacion
    Created on : 28 sept 2024, 17:58:05
    Author     : Angie
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    
    <meta charset="UTF-8">
    <title>FORMULARIOS DE INFORMACIÓN</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .formulario-card {
            border: 1px solid black;
            width: 300px;
            margin: 10px;
            padding: 15px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        }
        .header {
            font-size: 1.2em;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .info-section {
            margin-bottom: 10px;
        }
        .info-section p {
            margin: 5px 0;
        }
        .mascota-section {
            margin-bottom: 10px;
        }
        .mascota-item {
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 5px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .buttons button, .buttons a {
            padding: 5px 10px;
            text-decoration: none;
            border: 1px solid black;
            background-color: #f8f8f8;
            cursor: pointer;
        }
        .mascota-check {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 1px solid black;
            vertical-align: middle;
        }
        .profile-photo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 1px solid #ccc;
        }
        .center {
            text-align: center;
        }
    </style>
<body>

    <h1 class="center"><h3>FORMULARIOS DE INFORMACIÓN</h3></h1>

    <div class="container">
        <!-- Formulario 001 -->
        <div class="formulario-card">
            <div class="header">Código De Formulario: 001</div>
            <div class="info-section">
                <div class="center">
                    <img class="profile-photo" src="path_to_photo_1" alt="Foto del adoptante">
                </div>
                <p><strong>Adoptante:</strong> Carlos Fernando Narvaez</p>
                <p><strong>Tel:</strong> 333678896</p>
                <p><strong>Dir:</strong> Mz 5 Casa 2 B/E. Pasto Nariño</p>
            </div>
            <div class="mascota-section">
                <div class="mascota-item">
                    <p><strong>Canela</strong> <span class="mascota-check"></span></p>
                    <p><strong>Código:</strong> 023</p>
                    <p><strong>Condiciones Especiales:</strong> Sarna</p>
                    <p><strong>Fecha:</strong> 25/07/2024</p>
                </div>
                <div class="mascota-item">
                    <p><strong>Sam</strong> <span class="mascota-check"></span></p>
                    <p><strong>Código:</strong> 014</p>
                    <p><strong>Condiciones Especiales:</strong> Ninguna</p>
                    <p><strong>Fecha:</strong> 25/07/2024</p>
                </div>
            </div>
            <div class="buttons">
                <a href="download_path_001" target="_blank">Descargar Formulario</a>
                <button>Aceptar</button>
                <button>Rechazar</button>
            </div>
        </div>

        <!-- Formulario 002 -->
        <div class="formulario-card">
            <div class="header">Código De Formulario: 002</div>
            <div class="info-section">
                <div class="center">
                    <img class="profile-photo" src="path_to_photo_2" alt="Foto del adoptante">
                </div>
                <p><strong>Adoptante:</strong> Laura Noemi Lopez</p>
                <p><strong>Tel:</strong> 3195528744</p>
                <p><strong>Dir:</strong> Cl 18 34-87 Pasto Nariño</p>
            </div>
            <div class="mascota-section">
                <div class="mascota-item">
                    <p><strong>Manchas</strong> <span class="mascota-check"></span></p>
                    <p><strong>Código:</strong> 013</p>
                    <p><strong>Condiciones Especiales:</strong> Sarna</p>
                    <p><strong>Fecha:</strong> 25/07/2024</p>
                </div>
                <div class="mascota-item">
                    <p><strong>Susy</strong> <span class="mascota-check"></span></p>
                    <p><strong>Código:</strong> 034</p>
                    <p><strong>Condiciones Especiales:</strong> Ninguna</p>
                    <p><strong>Fecha:</strong> 25/07/2024</p>
                </div>
            </div>
            <div class="buttons">
                <a href="download_path_002" target="_blank">Descargar Formulario</a>
                <button>Aceptar</button>
                <button>Rechazar</button>
            </div>
        </div>

        <!-- Formulario 003 -->
        <div class="formulario-card">
            <div class="header">Código De Formulario: 003</div>
            <div class="info-section">
                <div class="center">
                    <img class="profile-photo" src="path_to_photo_3" alt="Foto del adoptante">
                </div>
                <p><strong>Adoptante:</strong> Luisa Maria Eraso</p>
                <p><strong>Tel:</strong> 3147553811</p>
                <p><strong>Dir:</strong> Mz 5 Casa 2 B/E. Pasto Nariño</p>
            </div>
            <div class="mascota-section">
                <div class="mascota-item">
                    <p><strong>Max</strong> <span class="mascota-check"></span></p>
                    <p><strong>Código:</strong> 003</p>
                    <p><strong>Condiciones Especiales:</strong> Sarna</p>
                    <p><strong>Fecha:</strong> 25/07/2024</p>
                </div>
            </div>
            <div class="buttons">
                <a href="download_path_003" target="_blank">Descargar Formulario</a>
                <button>Aceptar</button>
                <button>Rechazar</button>
            </div>
        </div>
    </div>
    <div class="btn-container">
    <input class="btn-eliminar" type="button" value="Regresar" onClick="window.history.back()">
    </div>
</body>
</html>
