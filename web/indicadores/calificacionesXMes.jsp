<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    String anio = request.getParameter("anio");
    String codigoMascota = request.getParameter("codigoMascota");

    if (anio == null || anio.isEmpty()) {
        anio = "2024"; // Valor predeterminado si no se proporciona el año
    }

    // Obtén los datos de calificaciones por mes filtrando por código de mascota y año
    List<String[]> datos = FormularioDeSeguimiento.getCalificacionesPorMes(anio, codigoMascota);
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);

        // Generar estrellas para la calificación
        int calificacion = Integer.parseInt(registro[2]);
        StringBuilder estrellas = new StringBuilder();
        for (int j = 0; j < calificacion; j++) {
            estrellas.append("★");  // Estrellas llenas
        }
        for (int j = calificacion; j < 5; j++) {
            estrellas.append("☆");  // Estrellas vacías
        }

        lista.append("<tr>");
        lista.append("<td>").append(registro[0]).append("</td>"); // Mes
        lista.append("<td>").append(registro[1]).append("</td>"); // Código de Mascota
        lista.append("<td>").append(estrellas.toString()).append("</td>"); // Calificación con estrellas
        lista.append("<td>").append(registro[3]).append("</td>"); // Total Calificaciones
        lista.append("</tr>");

        if (i > 0) datosGraficos.append(", ");
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append("\","); // Mes
        datosGraficos.append("\"value\": ").append(calificacion); // Calificación total
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
                    <th>Calificación</th>
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
            categoryField: "category",  // Año - Código de Mascota
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

        // Serie para el total de calificaciones (calificación por estrellas)
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Calificación",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY} estrellas"  // Mostrar número de estrellas en el tooltip
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