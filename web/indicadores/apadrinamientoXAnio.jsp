<%@page import="clases.Apadrinamiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
</head>
<%
    // Obtener los datos de apadrinamientos por año
    List<String[]> datos = Apadrinamiento.getApadrinamientosPorAnio();
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        
        // Añadir el enlace al año que lleva a 'apadrinamientoXMes.jsp' pasando el año como parámetro
        lista.append("<td><a href='principal.jsp?CONTENIDO=indicadores/apadrinamientoXMes.jsp?anio=")
             .append(registro[0]) // Año
             .append("'>").append(registro[0]).append("</a></td>"); // Añadir el año como texto del enlace
        
        lista.append("<td>").append(registro[1]).append("</td>"); // Total Apadrinamientos
        lista.append("</tr>");

        if (i > 0) {
            datosGraficos.append(", ");
        }
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append("\",");
        datosGraficos.append("\"value\": ").append(registro[1]);
        datosGraficos.append("}");
    }
    datosGraficos.append("]");
%>

<h3>INDICADOR DE APADRINAMIENTOS POR AÑO</h3>
<p></p>
<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Año</th><th>Total Apadrinamientos</th></tr>
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
            minGridDistance: 30
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

        // Configurar el eje Y (valor)
        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0,
            strictMinMax: false,
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        // Crear la serie de columnas
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Apadrinamientos",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY}"
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