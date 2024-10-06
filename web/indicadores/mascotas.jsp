<%-- 
    Document   : mascotas
    Created on : 5/10/2024, 05:23:49 PM
    Author     : URB
--%>

<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Obtén los datos de las mascotas por fecha de ingreso
    List<String[]> datos = Mascota.getMascotasPorFechaIngreso();
    String lista = "";
    String datosGraficos = "[";
    for (int i = 0; i < datos.size(); i++) {
        String[] registro = datos.get(i);
        lista += "<tr>";
        lista += "<td><a href='principal.jsp?CONTENIDO=indicadores/mascotasPorFechaIngreso.jsp&fechaIngreso="+registro[0]+"'>"+registro[0]+"</a></td>";
        lista += "<td>" + registro[1] + "</td>";
        lista += "</tr>";

        if (i > 0) datosGraficos += ", ";
        datosGraficos += "{";
        datosGraficos += "country: '" + registro[0] + "',";
        datosGraficos += "value: " + registro[1];
        datosGraficos += "}";
    }
    datosGraficos += "]";
%>

<h3>INDICADOR DE MASCOTAS POR FECHA DE INGRESO</h3>
<p></p>
<table border="0">
    <tr>
        <td>
            <table border="1">
                <tr><th>Fecha de Ingreso</th><th>Cantidad de Mascotas</th></tr>
                <%=lista%>
            </table>
        </td>
        <td id="chartdiv">          
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
        paddingLeft:0,
        paddingRight:1
    }));            

    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);

    var xRenderer = am5xy.AxisRendererX.new(root, {
      minGridDistance: 30,
      minorGridEnabled: true
    });

    xRenderer.labels.template.setAll({
     rotation: -90,
     centerY: am5.p50,
     centerX: am5.p100,
     paddingRight: 15
   });

   xRenderer.grid.template.setAll({
     location: 1
   });

   var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
     maxDeviation: 0.3,
     categoryField: "country",
     renderer: xRenderer,
     tooltip: am5.Tooltip.new(root, {}
   }));

   var yRenderer = am5xy.AxisRendererY.new(root, {
     strokeOpacity: 0.1
   });

   var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
     maxDeviation: 0.3,
     renderer: yRenderer
   }));

    var series = chart.series.push(am5xy.ColumnSeries.new(root, {
      name: "Series 1",
      xAxis: xAxis,
      yAxis: yAxis,
      valueYField: "value",
      sequencedInterpolation: true,
      categoryXField: "country",
      tooltip: am5.Tooltip.new(root, {
        labelText: "{valueY}"
      })
    }));

    // Definir colores para las columnas
    series.columns.template.setAll({
      cornerRadiusTL: 5,
      cornerRadiusTR: 5,
      strokeOpacity: 0,
      fill: am5.color("#67b7dc") // Aquí puedes definir el color que prefieras para las columnas
    });

    var data = <%=datosGraficos%>;

    xAxis.data.setAll(data);
    series.data.setAll(data);

    series.appear(1000);
    chart.appear(1000, 100);

    }); // end am5.ready()
</script>