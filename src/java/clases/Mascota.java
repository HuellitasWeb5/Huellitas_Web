/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private String fechaIngreso;
    private String estado;

    public Mascota() {
    }

    public Mascota(String codigo) {
        String cadenaSQL="select codigo, nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado from mascota where codigo=" +codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if(resultado.next()){
             this.codigo = codigo;
             nombre=resultado.getString("nombre");
             genero=resultado.getString("genero");
             tamaño=resultado.getString("tamano");
             foto=resultado.getString("foto");
             cuidadosEspeciales=resultado.getString("cuidadosEspeciales");
             fechaNacimientoAproximada=resultado.getString("fechaNacimientoAproximada");
             fechaIngreso=resultado.getString("fechaIngreso");
             estado=resultado.getString("estado");
            }
        } catch (Exception ex) {
             System.out.println("Error al consultar el id" + ex.getMessage());
        }
       
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        String resultado = nombre;
        if (nombre == null) {
            resultado = "";
        }
        return resultado;
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
    
    public GeneroMascota getGeneroEnObjeto() {
        return new GeneroMascota(genero);
    }

    public String getTamaño() {
       String resultado = tamaño;
        if (tamaño == null) {
            resultado = "";
        }
        return resultado;
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
        String resultado = cuidadosEspeciales;
        if (cuidadosEspeciales == null) {
            resultado = "";
        }
        return resultado;
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
    
    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getEstado() {
        String resultado = estado;
        if (estado == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
        @Override
    
    public String toString(){
        return nombre;
    }

   public boolean grabar(){

       String cadenaSQL="insert into mascota (nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado) "
               + " values ('"+nombre+"','"+genero+"','"+tamaño+"','"+foto+"','"+cuidadosEspeciales+"','"+fechaNacimientoAproximada+"','"+fechaIngreso+"','"+estado+"')";
       System.out.println(cadenaSQL);
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean modificar(){
       String cadenaSQL="update mascota set nombre='"+nombre+"',genero='"+genero+"',tamano='"+tamaño+"',foto='"+foto+"',cuidadosEspeciales='"+cuidadosEspeciales+"',"
               + "fechaNacimientoAproximada='"+fechaNacimientoAproximada+"',fechaIngreso='"+fechaIngreso+"',estado='"+estado+"' where codigo="+codigo;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean eliminar(){
       String cadenaSQL="delete from mascota where codigo="+codigo;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
   
   public static ResultSet getLista(String filtro, String orden){
       if(filtro != null && filtro != ""){
           filtro = " where " + filtro;
       }else{
           filtro= " ";
       }
       if (orden != null && orden != ""){
           orden = " orden by " +orden;
       }else {
           orden = " ";
       }
       String cadenaSQL="Select codigo, nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado from mascota" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
   
   public static List<Mascota> getListaEnObjetos(String filtro, String orden){
       List<Mascota> lista=new ArrayList<>();
       ResultSet datos= Mascota.getLista(filtro, orden);
       if (datos != null){
           try {
               while(datos.next()){
                   Mascota mascota =new Mascota();
                   mascota.setCodigo(datos.getString("codigo"));
                   mascota.setNombre(datos.getString("nombre"));             
                   mascota.setGenero(datos.getString("genero"));
                   mascota.setTamaño(datos.getString("tamano"));
                   mascota.setFoto(datos.getString("foto"));      
                   mascota.setCuidadosEspeciales(datos.getString("cuidadosEspeciales"));
                   mascota.setFechaNacimientoAproximada(datos.getString("fechaNacimientoAproximada"));
                   mascota.setFechaIngreso(datos.getString("fechaIngreso"));
                   mascota.setEstado(datos.getString("estado"));
                   
                   lista.add(mascota);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
    
}
