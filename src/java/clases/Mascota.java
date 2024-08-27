/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;

/**
 *
 * @author Luis Eraso
 */
public class Mascota {
   
    private String codigo;
    private String nombre;
    private String genero;
    private String tamaño;
    private String foto;
    private String cuidadosEspeciales;
    private String fechaNacimientoAproximada;
    private String estado;

    public Mascota() {
    }

    public Mascota(String codigo) {
        String cadenaSQL="select codigo,nombre,genero,tamaño,foto,cuidadosEspeciales,fechaNacimientoAproximada,estado from mascota";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
             this.codigo = codigo;
             nombre=resultado.getString("nombre");
             genero=resultado.getString("genero");
             tamaño=resultado.getString("tamaño");
             foto=resultado.getString("foto");
             cuidadosEspeciales=resultado.getString("cuidadosEspeciales");
             fechaNacimientoAproximada=resultado.getString("fechaNacimientoAproximada");
             estado=resultado.getString("estado");
        } catch (Exception e) {
        }
       
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTamaño() {
        return tamaño;
    }

    public void setTamaño(String tamaño) {
        this.tamaño = tamaño;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }


    public String getCuidadosEspeciales() {
        return cuidadosEspeciales;
    }

    public void setCuidadosEspeciales(String cuidadosEspeciales) {
        this.cuidadosEspeciales = cuidadosEspeciales;
    }

    public String getFechaNacimientoAproximada() {
        return fechaNacimientoAproximada;
    }

    public void setFechaNacimientoAproximada(String fechaNacimientoAproximada) {
        this.fechaNacimientoAproximada = fechaNacimientoAproximada;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
        @Override
    
    public String toString(){
        return nombre;
    }


   public boolean grabar(){
       String cadenaSQL="insert into mascota (nombre,genero,tamaño,foto,cuidadosEspeciales,fechaNacimientoAproximada,estado) "
               + " values ('"+nombre+"','"+genero+"','"+tamaño+"','"+foto+"','"+cuidadosEspeciales+"','"+fechaNacimientoAproximada+"','"+estado+"')";
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean modificar(){
       String cadenaSQL="update mascota set nombre='"+nombre+"',genero='"+genero+"',tamaño='"+tamaño+"',foto='"+foto+"',cuidadosEspeciales='"+cuidadosEspeciales+"',"
               + "fechaNacimientoAproximada='"+fechaNacimientoAproximada+"',estado='"+estado+"' where codigo="+codigo;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean eliminar(){
       String cadenaSQL="delete from mascota where codigo="+codigo;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    
}
