<%@page import="java.util.Locale"%>
<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
</head>
<%
    // Obtener los datos de calificaciones por año
    List<String[]> datos = FormularioDeSeguimiento.getCalificacionXAnio();
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        
        // Añadir el enlace al año que lleva a 'calificacionXMes.jsp' pasando el año y el código de mascota como parámetros
        lista.append("<td><a href='principal.jsp?CONTENIDO=indicadores/calificacionesXMes.jsp?anio=")
             .append(registro[0]) // Año
             .append("&codigoMascota=").append(registro[1]) // Código de Mascota
             .append("'>").append(registro[0]).append("</a></td>"); // Año como texto del enlace
        
        lista.append("<td>").append(registro[1]).append("</td>"); // Código de mascota
        lista.append("<td>").append(registro[2]).append("</td>"); // Total Calificaciones
        
        // Representar calificaciones con estrellas
        double calificacion = Double.parseDouble(registro[3]); // Convertir la calificación a double
        lista.append("<td>");
        for (int j = 0; j < 5; j++) {
            if (j < calificacion) {
                lista.append("★"); // Estrella llena
            } else {
                lista.append("☆"); // Estrella vacía
            }
        }
        lista.append(" (").append(registro[3]).append(")"); // Promedio como decimal
        lista.append("</td>");
        lista.append("</tr>");

        if (i > 0) {
            datosGraficos.append(", ");
        }
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append(" - ").append(registro[1]).append("\",");
        datosGraficos.append("\"value\": ").append(registro[3]); // Promedio calificaciones para la gráfica
        
        // Añadir las estrellas al tooltip
        StringBuilder estrellasTooltip = new StringBuilder();
        for (int j = 0; j < 5; j++) {
            if (j < calificacion) {
                estrellasTooltip.append("★"); // Estrella llena
            } else {
                estrellasTooltip.append("☆"); // Estrella vacía
            }
        }
        datosGraficos.append(", \"tooltip\": \"").append(estrellasTooltip.toString()).append(" (").append(registro[3]).append(")\""); // Tooltip
        datosGraficos.append("}");
    }
    datosGraficos.append("]");
%>

<h3>INDICADOR DE CALIFICACIONES POR AÑO</h3>
<p></p>
<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr>
                    <th>Año</th>
                    <th>Código de Mascota</th>
                    <th>Total Calificaciones</th>
                    <th>Promedio Calificaciones</th>
                </tr>
                <%= lista.toString() %>
            </table>
        </td>
        <td>
            <!-- Contenedor para la gráfica -->
            <div id="chartdivAnio" style="width: 50vw; height: 500px; max-width: 900px; margin: auto;"></div>
        </td>
    </tr>
</table>

<script type="text/javascript">
    am5.ready(function() {
        // Crear la raíz para la gráfica
        var root = am5.Root.new("chartdivAnio");

        // Aplicar tema animado
        root.setThemes([am5themes_Animated.new(root)]);

        // Crear el gráfico XY
        var chart = root.container.children.push(am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            pinchZoomX: true,
            paddingLeft: 0,
            paddingRight: 15
        }));

        // Crear el cursor de la gráfica
        var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
        cursor.lineY.set("visible", false);

        // Configurar el eje X (categoría)
        var xRenderer = am5xy.AxisRendererX.new(root, {
    minGridDistance: 50 // Aumenta este valor si es necesario
});


        xRenderer.labels.template.setAll({
            rotation: -45,
            centerY: am5.p50,
            centerX: am5.p100,
            paddingRight: 15
        });

        var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
            categoryField: "category",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        // Configurar el eje Y (valor) del 0 al 5
        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0,
            max: 5, // Máximo del eje Y
            strictMinMax: true, // Respetar los límites
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        // Crear la serie de columnas
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Calificaciones",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{tooltip}" // Mostrar estrellas en el tooltip
            })
        }));

        // Configurar las columnas
        series.columns.template.setAll({
            cornerRadiusTL: 5,
            cornerRadiusTR: 5,
            strokeOpacity: 0,
            fill: am5.color("#7fbc95") // Color de las columnas
        });

        // Asignar los datos de la gráfica
        var data = <%= datosGraficos.toString() %>;
        xAxis.data.setAll(data);
        series.data.setAll(data);

        // Animaciones de aparición
        series.appear(1000);
        chart.appear(1000, 100);
    });
</script>