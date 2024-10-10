<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    // Obtén los datos de las calificaciones por año
    List<String[]> datos = FormularioDeSeguimiento.getCalificacionesPorAnio();
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
        lista.append("<td><a href='principal.jsp?CONTENIDO=indicadores/calificacionesXMes.jsp&anio=")
                .append(registro[0])  // Año
                .append("'>").append(registro[0]).append("</a></td>");  // Año con enlace
        lista.append("<td>").append(registro[1]).append("</td>");  // Código de Mascota
        lista.append("<td>").append(estrellas.toString()).append("</td>");  // Calificación con estrellas
        lista.append("<td>").append(registro[3]).append("</td>");  // Total de Calificaciones
        lista.append("</tr>");

        if (i > 0) {
            datosGraficos.append(", ");
        }

        // Modificar el valor de la gráfica para que muestre la calificación (el número de estrellas)
        datosGraficos.append("{");
        datosGraficos.append("\"category\": \"").append(registro[0]).append(" - ").append(registro[1]).append("\",");  // Año - Código de Mascota
        datosGraficos.append("\"value\": ").append(calificacion);  // Usar la calificación como el valor de la gráfica
        datosGraficos.append("}");
    }
    datosGraficos.append("]");
%>
<h3>INDICADOR DE CALIFICACIONES POR AÑO</h3>
<p></p>

<form id="searchForm">
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Buscar codigo de mascota" onkeyup="filterNames()">
        <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
    </div>
    <ul id="nameList"></ul>
</form>

<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Año</th><th>Código de Mascota</th><th>Calificación</th><th>Total de Calificaciones</th></tr>
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

    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const slides = document.getElementsByClassName('swiper-slide');
        const datosOriginales = <%=datosGraficos.toString()%>; // Almacena los datos originales

        // Recorre cada slide y oculta o muestra dependiendo del filtro
        for (let i = 0; i < slides.length; i++) {
            const cardCodeElement = slides[i].getElementsByClassName('card-code')[0]; 
            const textValue = cardCodeElement.textContent || cardCodeElement.innerText;

            if (textValue.toLowerCase().indexOf(filter) > -1) {
                slides[i].style.display = "";
                // Aquí se puede agregar lógica para actualizar la gráfica
                updateChartForCode(textValue);
            } else {
                slides[i].style.display = "none";
            }
        }
    }

    function updateChartForCode(codigoMascota) {
        // Filtrar los datos originales por el código de mascota
        const filteredData = datosOriginales.filter(data => data.category.includes(codigoMascota));

        // Actualiza la gráfica con los datos filtrados
        const xAxis = chart.xAxes.getIndex(0);
        const series = chart.series.getIndex(0);
        
        xAxis.data.setAll(filteredData);
        series.data.setAll(filteredData);
    }
</script>