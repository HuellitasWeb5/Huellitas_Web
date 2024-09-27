<%@ page import="clases.Donacion, clases.DonacionDetalle" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Donación Adicionar</title>
    <style>
        /* Añade estilos CSS según sea necesario */
        .donacion-card {
            border: 1px solid #000;
            padding: 10px;
            margin: 10px;
            display: inline-block;
            width: 250px;
        }
        .donacion-card button {
            margin-top: 10px;
        }
        .total {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Donación Adicionar</h1>
    
    <form method="POST" action="procesarDonacion.jsp">
      
        
        <label>Codigo</label> 
        <input type="text" name="codigo" id="codigo"  value="<%= request.getAttribute("codigo") %>"/> <br/>
        
        <label>Donante: </label> 
        <input type="text" name="donante" value="<%= request.getAttribute("nombreDonante") %>" readonly/> <br/>
        
        <label>Fecha: </label>
        <input type="date" name="fecha" value="<%= request.getAttribute("fechaDonacion") %>" readonly/> <br/>
        
        <label>Descripción: </label> 
        <input type="text" name="descripcion" value="<%= request.getAttribute("descripcionDonacion") %>"/><br/><br/>

        <div class="donacion-container">
            <%
                List<DonacionDetalle> detallesDonacion = (List<DonacionDetalle>) request.getAttribute("detallesDonacion");
                double total = 0;
                for (DonacionDetalle detalle : detallesDonacion) {
                    double subtotal = Double.parseDouble(detalle.getValorUnitarios()) * Double.parseDouble(detalle.getCantidad());
                    total += subtotal;
            %>
            <div class="donacion-card">
                <p><strong>Tipo:</strong> <%= detalle.getIdConcepto() %></p>
                <p><strong>Valor Unitario:</strong> <%= detalle.getValorUnitarios() %></p>
                <p><strong>Cantidad:</strong> <%= detalle.getCantidad() %></p>
                <p><strong>Subtotal:</strong> <%= subtotal %></p>
                
                <button type="button" onclick="modificarDonacion('<%= detalle.getId() %>')">Modificar</button>
                <button type="button" onclick="eliminarDonacion('<%= detalle.getId() %>')">Eliminar</button>
            </div>
            <% } %>
        </div>
        
        <div class="total">
            <label>Total:</label> <%= total %>
        </div>

        <button type="submit">Adicionar</button>
        <button type="button" onclick="cancelarDonacion()">Cancelar</button>
    </form>
    
    <script>
        function modificarDonacion(idDetalle) {
            window.location.href = 'modificarDonacion.jsp?id=' + idDetalle;
        }

        function eliminarDonacion(idDetalle) {
            if (confirm('¿Está seguro de que desea eliminar este detalle de donación?')) {
                window.location.href = 'eliminarDonacion.jsp?id=' + idDetalle;
            }
        }

        function cancelarDonacion() {
            window.location.href = 'cancelarDonacion.jsp';
        }
    </script>
</body>
</html>
