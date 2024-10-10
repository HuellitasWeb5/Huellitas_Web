<%@page import="clases.Donacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    // Obtén los datos de las donaciones por año
    List<String[]> datos = Donacion.getDonacionesPorAnio();
    StringBuilder lista = new StringBuilder();
    StringBuilder datosGraficos = new StringBuilder("[");

    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);

        lista.append("<tr>");
        lista.append("<td><a href='principal.jsp?CONTENIDO=indicadores/donacionesXMes.jsp&anio=")
                .append(registro[0])  // Año
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
<h3>INDICADOR DE DONACIONES POR AÑO</h3>
<p></p>


<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Año</th><th>Cantidad Donada</th></tr>
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

        root.setThemes([am5themes_Animated.new(root)]);

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
            categoryField: "category",  // Año
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            min: 0,
            renderer: am5xy.AxisRendererY.new(root, {})
        }));

        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Cantidad Donada",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            categoryXField: "category",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY} unidades"  // Mostrar cantidad donada en el tooltip
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
    });

    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const rows = document.querySelectorAll('table tr:not(:first-child)'); // Ignora la primera fila (encabezados)

        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const yearCell = cells[0];
            if (yearCell && yearCell.textContent.toLowerCase().indexOf(filter) > -1) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }
</script>