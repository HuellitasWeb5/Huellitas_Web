<%-- 
    Document   : apadrinamientoXMes
    Created on : 8/10/2024, 06:59:47 AM
    Author     : VALEN
--%>

<%@page import="clases.Apadrinamiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    // Obtén los datos de apadrinamientos por mes
    List<String[]> datos = Apadrinamiento.getApadrinamientosPorMes();
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");
    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        lista.append("<td>").append(registro[0]).append("</td>"); // Mes
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

<h3>INDICADOR DE APADRINAMIENTOS POR MES</h3>
<p></p>
<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Mes</th><th>Total Apadrinamientos</th></tr>
                <%= lista.toString() %>
            </table>
        </td>
        <td>
            <!-- Contenedor para la gráfica -->
            <div id="chartdivMes" style="width: 50vw; height: 500px; max-width: 900px; margin: auto;"></div>
        </td>
    </tr>
        <input type="button" value="Atras" class="btn-otro" onClick="window.history.back()">
</table>

<script type="text/javascript">
    am5.ready(function() {
        var root = am5.Root.new("chartdivMes");
        root.setThemes([am5themes_Animated.new(root)]);

        var chart = root.container.children.push(am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            pinchZoomX: true
        }));

        var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
            categoryField: "category",
            renderer: am5xy.AxisRendererX.new(root, {})
        }));

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0,
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

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

        var data = <%= datosGraficos.toString() %>;
        xAxis.data.setAll(data);
        series.data.setAll(data);
        series.appear(1000);
        chart.appear(1000, 100);
    });
</script>