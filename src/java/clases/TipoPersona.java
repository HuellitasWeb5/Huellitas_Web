package clases;

/**
 *
 * @author Luis Eraso
 */
public class TipoPersona {

    private String codigo;

    public TipoPersona(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        String nombre = null;
        switch (codigo) {
            case "S":
                nombre = "AdministradorSistema";
                break;
            case "F":
                nombre = "AdministradorFundacion";
                break;
            case "C":
                nombre = "Cliente";
                break;

            default:
                nombre = "Desconocido";
                break;
        }
        return nombre;
    }

    @Override
    public String toString() {
        return getNombre();
    }

    public String getMenu() {
        String menu = "<ul>";

        switch (this.codigo) {

            case "F":
                menu += "<nav class='navbar navbar-expand-lg navbar-light bg-light'>";
                menu += "<div class='container-fluid'>";

                // Botón para colapsar el menú en pantallas pequeñas
                menu += "<button class='navbar-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>";
                menu += "<span class='navbar-toggler-icon'></span>";
                menu += "</button>";

                // Menú desplegable y alineado a la derecha
                menu += "<div class='collapse navbar-collapse justify-content-end' id='navbarNav'>"; // justify-content-end alinea a la derecha
                menu += "<ul class='navbar-nav'>";
                menu += "<li class='nav-item'><a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=1.TipoDonacion/unidadesDeMedida.jsp'>Medidas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=1.TipoDonacion/tiposDonaciones.jsp'>Tipos Donacion</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesPadrinos.jsp'>Planes Padrinos</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" + getNombre() + "'>Mascotas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=4.Clientes/clientes.jsp&nombre=" + getNombre() + "'>Clientes</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp'>Padripet</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp'>Adopciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=8.Donacion/donaciones.jsp'>Donaciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=91.PerfilAdministradorF/perfil.jsp'>Perfil</a></li>";
                menu += "<li class='nav-item'><a href='index.jsp'>Salir</a></li>";

                menu += "</ul>";
                menu += "</div>";
                menu += "</div>";
                menu += "</nav>";
                break;

            case "S":
                menu += "<nav class='navbar navbar-expand-lg navbar-light bg-light'>";
                menu += "<div class='container-fluid'>";

                menu += "<img src='presentacion/imagenes/Logo-Fundacion.png' alt='Logo' width='90' height='90' class='d-inline-block align-text-top'>"; // Aquí se agrega el logo

                // Botón para colapsar el menú en pantallas pequeñas
                menu += "<button class='navbar-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>";
                menu += "<span class='navbar-toggler-icon'></span>";
                menu += "</button>";

                // Menú desplegable y alineado a la derecha
                menu += "<div class='collapse navbar-collapse justify-content-center' id='navbarNav'>"; // Cambiado a justify-content-center para centrar el contenido
                menu += "<ul class='navbar-nav'>";

                menu += "<li class='nav-item'><a class='dropdown-item' href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";

                // Menú de Donaciones
                menu += "<li class='nav-item dropdown'>";
                menu += "<a class='nav-link dropdown-toggle' href='#' id='donacionesDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='false'>Donaciones</a>";
                menu += "<ul class='dropdown-menu' aria-labelledby='donacionesDropdown'>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=8.Donacion/donaciones.jsp'>Donaciones</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=1.TipoDonacion/unidadesDeMedida.jsp'>Unidades de Medida</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=1.TipoDonacion/tiposDonaciones.jsp'>Tipos de Donación</a></li>";
                menu += "</ul></li>";

                // Menú de Padripets
                menu += "<li class='nav-item dropdown'>";
                menu += "<a class='nav-link dropdown-toggle' href='#' id='padripetsDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='false'>Padripets</a>";
                menu += "<ul class='dropdown-menu' aria-labelledby='padripetsDropdown'>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp'>Padripets</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesPadrinos.jsp'>Tipos de Padripet</a></li>"; // Asegúrate de tener la ruta correcta
                menu += "</ul></li>";
                // Menú de Adopciones con submenús
                menu += "<li class='nav-item dropdown'>";
                menu += "<a class='nav-link dropdown-toggle' href='#' id='adopcionesDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='false'>Adopciones</a>";
                menu += "<ul class='dropdown-menu' aria-labelledby='adopcionesDropdown'>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp'>Adopciones</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar'>Realizar Adopción</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=7.Adopcion/formularioSeguimiento.jsp&accion=Adicionar'>Realizar Seguimiento</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp'>Formulario de Adopción</a></li>";
                menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=7.Adopcion/verFormularioSeg.jsp'>Formulario de Seguimientos</a></li>";
                menu += "</ul></li>";

                // Menú de Mascotas y Apadrinamientos
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" + getNombre() + "'>Mascotas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=4.Clientes/clientes.jsp&nombre=" + getNombre() + "'>Clientes</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=5.Administradores/administradores.jsp'>Administradores</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=9.Perfil/perfilF.jsp'>Perfil</a></li>";

                // Menú de Indicadores
                 menu += "<li class='nav-item dropdown'>";
            menu += "<a class='nav-link dropdown-toggle' href='#' id='indicadoresDropdown' role='button' data-bs-toggle='dropdown' aria-expanded='false'>Indicadores</a>";
            menu += "<ul class='dropdown-menu' aria-labelledby='indicadoresDropdown'>";
            menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=indicadores/mascotas.jsp'>Mascotas</a></li>";
            menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=indicadores/apadrinamientoXAnio.jsp'>Apadrinamientos</a></li>"; // Asegúrate de tener la ruta correcta
            menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=indicadores/donaciones.jsp'>Donaciones</a></li>";
            menu += "<li><a class='dropdown-item' href='principal.jsp?CONTENIDO=indicadores/calificacionesXAnio.jsp'>Cuidados</a></li>"; // Asegúrate de tener la ruta correcta
            menu += "</ul></li>";

                menu += "<li class='nav-item'><a class='dropdown-item' href='index.jsp'>Salir</a></li>";
                menu += "</ul>";
                menu += "</div>";
                menu += "<img src='presentacion/imagenes/Logo.png' alt='Logo' width='80' height='80' class='d-inline-block align-text-top'>"; // Aquí se agrega el logo
                menu += "</div>";
                menu += "</nav>";
                break;

            case "C":
                menu += "<nav class='navbar navbar-expand-lg navbar-light bg-light'>";
                menu += "<div class='container-fluid'>";

                // Botón para colapsar el menú en pantallas pequeñas
                menu += "<button class='navbar-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>";
                menu += "<span class='navbar-toggler-icon'></span>";
                menu += "</button>";

                // Menú desplegable y alineado a la derecha
                menu += "<div class='collapse navbar-collapse justify-content-end' id='navbarNav'>"; // justify-content-end alinea a la derecha
                menu += "<ul class='navbar-nav'>";

                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" + getNombre() + "'>Mascotas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp'>Padripet</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=9.Perfil/formularioInformacion.jsp&accion=Adicionar'>Adopciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=8.Donacion/donaciones.jsp'>Donaciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=9.Perfil/perfil.jsp'>Perfil</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='index.jsp'>Salir</a></li>";

                menu += "</ul>";
                menu += "</div>";
                menu += "</div>";
                menu += "</nav>";
                break;
        }

        menu += "</ul>";
        return menu;
    }

    public String getListaEnOptions() {
        String lista = "";
        switch (codigo) {
            case "S":
                lista = "<option value='S' selected>Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option>";
                break;
            case "F":
                lista = "<option value='S'> Administrador  Sistema</option><option value='F' selected>Administrador  Fundacion</option>";
                break;
            case "C":
                lista = "<option value='S'> Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option>";
                break;
            default:
                lista = "<option value='S' selected> Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option>";
                break;
        }
        return lista;

    }

}
