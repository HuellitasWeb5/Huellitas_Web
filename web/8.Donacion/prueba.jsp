    <%@page import="clases.DonacionDetalle"%>
<%-- 
        Document   : ventasActualizar
        Created on : 25/06/2024, 08:18:47 AM
        Author     : Luis Eraso
    --%>


    <%@page import="java.util.List"%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        String accion = request.getParameter("accion");
        DonacionDetalle donacionDetalle = new DonacionDetalle();
        switch (accion) {
            case "Adicionar":
                String identificacion = request.getParameter("cliente").substring(0, request.getParameter("cliente").indexOf("-")).trim();
                String cadenaCatalogos = request.getParameter("productosComprados");

                String cadenaMediosDePago = "";
                
                for (int i = 0; i < datosMediosDePago.size(); i++) {
                    MedioDePago medioPago = datosMediosDePago.get(i);
                    if (request.getParameter("valor" + medioPago.getId()) != null) {
                        int valor = Integer.parseInt(request.getParameter("valor" + medioPago.getId()));
                        if (valor > 0) {
                            if (!cadenaMediosDePago.equals("")) {
                                cadenaMediosDePago += "||";
                            }
                            cadenaMediosDePago += medioPago.getId() + "|" + valor;
                        }
                    }
                }

                out.print("Identificacion: " + identificacion + "|");
                out.print("Identificacion: " + cadenaCatalogos);
                out.print("Identificacion: " + cadenaMediosDePago);
                donacionDetalle.setIdentificacionCliente(identificacion);
                donacionDetalle.grabarProcedimientoAlmacenado(cadenaCatalogos, cadenaMediosDePago);
                break;
            case "Eliminar":
                donacionDetalle.setNumero(request.getParameter("numero"));
                donacionDetalle.eliminar();
                break;
        }
    %>
    <script type="text/javascript">
        document.location = "principal.jsp?CONTENIDO=ventas.jsp";
    </script>