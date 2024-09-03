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
public class GeneroPersona {
    private String codigo;

    public GeneroPersona(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
   
    public String getOpcion(){
        String opcion=null;
        switch(codigo){
            case "M": opcion="Masculino"; break;
            case "F": opcion="Femenino"; break;
            default: opcion="No Especificado"; break;
        }
        return opcion;
    }

    @Override
    public String toString() {
        return getOpcion();
    }
   
    public String getRadioButtons(){
    String lista="";
    if(codigo==null) codigo="";
    switch(codigo){
        case "M":
            lista="<input type='radio' name='genero' value='M' checked>Masculino"
                    + "<input type='radio' name='genero' value='F'>Femenino";
            break;
        case "F":
             lista="<input type='radio' name='genero' value='M' >Masculino"
                    + "<input type='radio' name='genero ' value='F' checked>Femenino";
             break;
        default:
            lista="<input type='radio' name='genero' value='M' checked>Masculino"
                    + "<input type='radio' name='genero' value='F'>Femenino";
            break;
    }
    return lista;
    }
}
