<%-- 
    Document   : adopcionesXMes
    Created on : 10/10/2024, 08:19:47 AM
    Author     : URB
--%>
<%@page import="java.util.List"%>
<%@page import="clases.FormularioDeInformacion"%>


<head>
    
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<%
    // Obt�n el a�o como par�metro desde la URL o usa un valor predeterminado
    String anio = request.getParameter("anio");
    if (anio == null || anio.isEmpty()) {
        anio = "2024"; // Valor predeterminado si no se proporciona el a�o
    }

    // Obt�n los datos de los formularios de adopci�n por mes para el a�o especificado
    List<String[]> datos = FormularioDeInformacion.getAdopcionesPorMes(anio);
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista.append("<tr>");
        lista.append("<td>").append(registro[0]).append("</td>"); // Mes y a�o
        lista.append("<td>").append(registro[1]).append("</td>"); // Cantidad de formularios
        lista.append("</tr>");

        if (i > 0) datosGraficos.append(", ");
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append("\",");
        datosGraficos.append("\"value\": ").append(registro[1]);
        datosGraficos.append("}");
    }
    datosGraficos.append("]");
%>

<h3>Indicador de Formularios de Adopci�n por Mes para el A�o <%= anio %></h3>

<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Mes de Solicitud</th><th>Cantidad de Formularios</th></tr>
                <%= lista.toString() %>
            </table>
        </td>
        <td>
            <!-- Contenedor para la gr�fica -->
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
            categoryField: "category",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0, // Asegura que el eje Y comience en 0
            strictMinMax: false, // Permite que el eje Y se ajuste autom�ticamente al valor m�ximo
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Formularios",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY}"
            })
        }));

        // Ajustar el ancho de las columnas para hacer la gr�fica m�s delgada
        series.columns.template.setAll({
            width: am5.percent(40), // Reduce el ancho de las barras para hacer la gr�fica m�s delgada
            cornerRadiusTL: 5,
            cornerRadiusTR: 5,
            strokeOpacity: 0,
            fill: am5.color("#7fbc95")
        });

        // Verifica los datos enviados al gr�fico
        console.log("Datos para la gr�fica:", <%=datosGraficos.toString()%>);

        var data = <%=datosGraficos.toString()%>;

        xAxis.data.setAll(data);
        series.data.setAll(data);

        series.appear(1000);
        chart.appear(1000, 100);
    }); // end am5.ready()
</script>

