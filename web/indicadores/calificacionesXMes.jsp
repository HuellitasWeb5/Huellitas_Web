<%@page import="java.util.Locale"%>
<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
</head>

<%
    // Obtener el año desde la solicitud
    String anio = request.getParameter("anio");
    String codigoMascota = request.getParameter("codigoMascota"); // Puedes modificar esto si tienes el parámetro

    // Obtener los datos de calificaciones por mes y mascota
    List<String[]> datos = FormularioDeSeguimiento.getCalificacionesXMes(anio, codigoMascota);
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        
        // Mes
        lista.append("<td>").append(registro[0]).append("</td>"); // Mes como texto
        
        // Código de mascota
        lista.append("<td>").append(registro[1]).append("</td>"); // Código de mascota
        
        // Total calificaciones
        lista.append("<td>").append(registro[3]).append("</td>"); // Total calificaciones
        
        // Representar calificaciones con estrellas
        double calificacion = (double) Double.parseDouble(registro[2]); // Convertir el promedio a double
        lista.append("<td>");
        for (int j = 0; j < 5; j++) {
            if (j < calificacion) {
                lista.append("★"); // Estrella llena
            } else {
                lista.append("☆"); // Estrella vacía
            }
        }
        // Añadir el promedio al lado de las estrellas
        lista.append(" (").append(registro[2]).append(")"); // Promedio como decimal
        lista.append("</td>");
        
        lista.append("</tr>");

        // Datos para gráficos
        if (i > 0) {
            datosGraficos.append(", ");
        }
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append(" - ").append(registro[1]).append("\",");
        datosGraficos.append("\"value\": ").append(registro[2]); // Promedio calificaciones para la gráfica
        
        // Añadir las estrellas al tooltip
        StringBuilder estrellasTooltip = new StringBuilder();
        for (int j = 0; j < 5; j++) {
            if (j < calificacion) {
                estrellasTooltip.append("★"); // Estrella llena
            } else {
                estrellasTooltip.append("☆"); // Estrella vacía
            }
        }
        datosGraficos.append(", \"tooltip\": \"").append(estrellasTooltip.toString()).append(" (").append(registro[2]).append(")\""); // Tooltip
        datosGraficos.append("}");
    }
    datosGraficos.append("]");
%>

<h3>INDICADOR DE CUIDADOS POR MES</h3>

<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr>
                    <th>Mes</th>
                    <th>Código de Mascota</th>
                    <th>Promedio Calificación</th>
                    <th>Total Calificaciones</th>
                </tr>
                <%= lista.toString() %>
            </table>
        </td>
        <td>
            <div id="chartdiv" style="width: 60vw; height: 500px; max-width: 900px; margin: auto;"></div>
        </td>
    </tr>

<input type="button" value="Atras" class="btn-otro" onClick="window.history.back()">
</table>

<script type="text/javascript">
    am5.ready(function() {
        var root = am5.Root.new("chartdiv");

        root.setThemes([
            am5themes_Animated.new(root)
        ]);

        var chart = root.container.children.push(am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            pinchZoomX: true,
            paddingLeft: 0,
            paddingRight: 15
        }));

        var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
        cursor.lineY.set("visible", false);

        var xRenderer = am5xy.AxisRendererX.new(root, {
            minGridDistance: 30
        });

        xRenderer.labels.template.setAll({
            rotation: -45,
            centerY: am5.p50,
            centerX: am5.p100,
            paddingRight: 15
        });

        var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
            categoryField: "category",  // Mes
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        // Configuración del eje Y con el rango de 0 a 5
        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0,  // Valor mínimo en el eje Y
            max: 5,  // Valor máximo en el eje Y
            strictMinMax: true,  // Mantener el rango fijo
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        // Serie para el promedio de calificaciones
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Promedio Calificación",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY} estrellas"
            })
        }));

        series.columns.template.setAll({
            cornerRadiusTL: 5,
            cornerRadiusTR: 5,
            strokeOpacity: 0,
            fill: am5.color("#7fbc95")
        });

        // Datos de la gráfica
        var data = <%=datosGraficos.toString()%>;

        xAxis.data.setAll(data);
        series.data.setAll(data);

        series.appear(1000);
        chart.appear(1000, 100);
        
    }); // end am5.ready()

</script>