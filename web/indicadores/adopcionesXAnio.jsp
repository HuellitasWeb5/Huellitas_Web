<%-- 
    Document   : adopcionesXAnio
    Created on : 10/10/2024, 07:59:16 AM
    Author     : URB
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Adopcion"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="presentacion/style-Tarjetas.css" />

<%
    // Obtén los datos de las adopciones por fecha de solicitud.
    List<String[]> datos = Adopcion.getAdopcionesPorFechaSolicitud();
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        lista.append("<td><a href='principal.jsp?CONTENIDO=indicadores/adopcionesXMes.jsp?anio=")
                .append(registro[0])
                .append("'>").append(registro[0]).append("</a></td>");
        lista.append("<td>").append(registro[1]).append("</td>");
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

<h3>Indicador de Adopciones por Año</h3>
<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Año de Adopción</th><th>Cantidad de Adopciones</th></tr>
                <%=lista.toString()%>
            </table>
        </td>
        <td>
            <!-- Contenedor para la gráfica -->
            <div id="chartdiv" style="width: 50vw; height: 500px; max-width: 900px; margin: auto;"></div>
        </td>
    </tr>
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
            categoryField: "category",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0, // Asegura que el eje Y comience en 0
            strictMinMax: false, // Permite que el eje Y se ajuste automáticamente al valor máximo
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Adopciones",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY}"
            })
        }));

        series.columns.template.setAll({
            cornerRadiusTL: 5,
            cornerRadiusTR: 5,
            strokeOpacity: 0,
            fill: am5.color("#7fbc95")
        });

        var data = <%=datosGraficos.toString()%>;

        xAxis.data.setAll(data);
        series.data.setAll(data);

        series.appear(1000);
        chart.appear(1000, 100);

    }); // end am5.ready()
</script>
