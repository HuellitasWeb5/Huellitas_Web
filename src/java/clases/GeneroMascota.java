/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author URB
 */
public class GeneroMascota {

     public String codigo;

    public GeneroMascota(String codigo) {
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
            case "H":
                nombre = "Hembra";
                break;
            case "M":
                nombre = "Macho";
                break;
            default:
                nombre = "No registrado";
        }
        return nombre;
    }

    public String getRadioButtons() {
        String lista = "";
        if (codigo == null) {
            codigo = "";
        }
        switch (codigo) {
            case "M":
                lista = "<input type='radio' name='genero' value='M' checked>Macho"
                        + "<input type='radio' name='genero' value='H'>Hembra";
                break;
            case "H":
                lista = "<input type='radio' name='genero' value='M'>Macho"
                        + "<input type='radio' name='genero' value='H' checked>Hembra";
                break;
            default:
                lista = "<input type='radio' name='genero' value='M' checked>Macho"
                        + "<input type='radio' name='genero' value='H'>Hembra";
                break;
        }
        return lista;
    }

    @Override
    public String toString() {
        return getNombre();
    }
}
