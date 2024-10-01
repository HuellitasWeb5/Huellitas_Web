    <%-- 
        Document   : mascotas
        Created on : 28/08/2024, 08:37:21 AM
        Author     : URB
    --%>
    <%@page import="clases.Mascota"%>
    <%@page import="java.util.List"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/mascota.css" />
    </head>

    <%
    String lista="";
    List<Mascota> datos=Mascota.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
            Mascota mascotas = datos.get(i);
            lista += "<div class='swiper-slide'>";
            lista += "<div class='card'>";
            lista += "<div class='card-header'>";
            lista += "<div class='card-img'>";
            lista += "<img src='presentacion/mascota/" + mascotas.getFoto() + "' width='auto' height='60'class='profile-image'>";
            lista += "</div>";
            lista += "<h2>" + mascotas.getNombre()+ "</h2>";
            lista += "</div>";
            lista += "<div class='card-body'>";
            lista+="<p><strong>Código:</strong>" + mascotas.getCodigo()+ "</p>";
            lista+="<p><strong>Genero:</strong>" + mascotas.getGeneroEnObjeto()+ "</p>";
            lista+="<p><strong>Tamaño:</strong>" + mascotas.getTamano()+ "</p>";
            lista+="<p><strong>Cuidado:</strong>" + mascotas.getCuidadosEspeciales()+ "</p>";
            lista+="<p><strong>Edad aproximada:</strong>" + mascotas.getEdad()+ "</p>";
            lista+="<p><strong>Fecha de ingreso:</strong>" + mascotas.getFechaIngreso()+ "</p>";
            lista+="<p><strong>Estado:</strong>" + mascotas.getEstado()+ "</p>";
            lista+="<p><strong>Descripción:</strong>" + mascotas.getDescripcion()+ "</p>";
            lista+="<p>";
            lista+="<a href='principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Modificar&codigo=" + mascotas.getCodigo() +
                    " 'title='Modificar'> <button class='btn-modificar'> Modificar </button></a> "; 
            lista+="<button class='btn-apadrinar'>Apadrinar</button></a> "; 
            lista+="<button class='btn-eliminar' onClick='eliminar("+ mascotas.getCodigo()+")'>Eliminar</button>";
            lista+="</p>";
            lista += "</div>";
            lista += "</div>";
            lista += "</div>";
      
      }
    %>

    <h3>MASCOTAS</h3>
     
    <a href="principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Adicionar" title="Adicionar"><button id="Adicionar">Adicionar</button></a>

        <div class="swiper-container">
            <div class="swiper-wrapper">
                <%= lista%>
                <br><br>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>

    <script type="text/javascript">
        function eliminar(codigo){
            resultado=confirm("Realmente desea eliminar la mascota con el codigo: "+codigo+"?");
            if (resultado) {
                document.location="principal.jsp?CONTENIDO=3.Mascotas/mascotasActualizar.jsp&accion=Eliminar&codigo="+codigo;
             }
        }

        function calcularEdad() {
            const fechaNacimiento = document.getElementById("fechaNacimiento").value;
            if (fechaNacimiento) {
                const fechaActual = new Date();
                const nacimiento = new Date(fechaNacimiento);
                let edad = fechaActual.getFullYear() - nacimiento.getFullYear();
                const mes = fechaActual.getMonth() - nacimiento.getMonth();

                if (mes < 0 || (mes === 0 && fechaActual.getDate() < nacimiento.getDate())) {
                    edad--;
                }

                document.getElementById("edad").textContent = edad;
            }
        }

        // Llamar a la función al cargar la página si ya hay una fecha de nacimiento
        window.onload = function() {
            calcularEdad();
        };

     const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 3, // Muestra 4 tarjetas al mismo tiempo
        spaceBetween: 20,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });
  
</script>
