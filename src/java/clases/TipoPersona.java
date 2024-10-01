/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
            case "S":
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
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=1.TipoDonacion/unidadesDeMedida.jsp'>Medidas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=1.TipoDonacion/tiposDonaciones.jsp'>Tipos Donacion</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesPadrinos.jsp'>Planes Padrinos</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp'>Mascotas</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=4.Clientes/clientes.jsp'>Clientes</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=5.Administradores/administradores.jsp'>Administradores</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=6.PadriPets/padripets.jsp'>Padripet</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp'>Adopciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='principal.jsp?CONTENIDO=8.Donacion/donaciones.jsp'>Donaciones</a></li>";
                menu += "<li class='nav-item'><a class='nav-link' href='index.jsp'>Salir</a></li>";

                menu += "</ul>";
                menu += "</div>";
                menu += "</div>";
                menu += "</nav>";

                break;

            case "F":
                menu += "<li><a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
                menu += "<li><a href='index.jsp'>Salir</a></li>";
                break;

            case "C":
                menu += "<li><a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
                menu += "<li><a href='index.jsp'>Salir</a></li>";
                break;
        }

        menu += "</ul>";
        return menu;
    }

    public String getListaEnOptions() {
        String lista = "";
        switch (codigo) {
            case "S":
                lista = "<option value='S' selected>Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option><option value='C'>Cliente</option>";
                break;
            case "F":
                lista = "<option value='S'> Administrador  Sistema</option><option value='F' selected>Administrador  Fundacion</option><option value='C'>Cliente</option>";
                break;
            case "C":
                lista = "<option value='S'> Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option><option value='C' selected>Cliente</option>";
                break;
            default:
                lista = "<option value='S' selected> Administrador  Sistema</option><option value='F'>Administrador  Fundacion</option><option value='C'>Cliente</option>";
                break;
        }
        return lista;

    }
}
