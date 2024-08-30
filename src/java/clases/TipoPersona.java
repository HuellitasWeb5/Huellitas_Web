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
            case "A":
                nombre = "AdministradorSistema";
                break;
            case "F":
                nombre = "AdministradorFundacion";
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
            case "A":
                menu += "<a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a>";
                menu += "<a href='principal.jsp?CONTENIDO=mascotas.jsp'>Mascotas</a>";
                menu += "<a href='principal.jsp?CONTENIDO=adopciones.jsp'>Adopciones</a>";
                menu += "<a href='principal.jsp?CONTENIDO=donaciones.jsp'>Donaciones</a>";
                menu += "<a href='principal.jsp?CONTENIDO=administradores.jsp'>Administradores</a>";
                menu += "<a href='index.jsp'>Salir</a>";
                //  menu+="<a>Reportes</a>";
                
                break;

            case "F":
                menu += "<li><a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
                menu += "<li><a href='principal.jsp?CONTENIDO=clientes.jsp'>Clientes</a></li>";
                menu += "<li><a href='principal.jsp?CONTENIDO=ventas.jsp'>Ventas</a></li>";
                menu += "<li><a href='index.jsp'>Salir</a></li>";
                break;
        }

        menu += "</ul>";
        return menu;
    }

    public String getListaEnOptions() {
        String lista = "";
        switch (codigo) {
            case "A":
                lista = "<option value='A' selected>AdministradorSistema</option><option value='F'>AdministradorFundacion</option>";
                break;
            case "F":
                lista = "<option value='A'> AdministradorSistema</option><option value='F' selected>AdministradorFundacion</option>";
                break;
            default:
                lista = "<option value='A' selected> AdministradorSistema</option><option value='F'>AdministradorFundacion</option>";
                break;
        }
        return lista;

    }
}