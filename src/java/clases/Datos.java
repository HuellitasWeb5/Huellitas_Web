/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
 * @author URB
 */
public class Datos {
    private String id;
    private String titulo1;
    private String titulo2;
    private String informacion;
    private String foto;

    public Datos() {
    }

    public Datos(String id) {
        String cadenaSQL="select id, titulo1, titulo2, informacion, foto from datos where codigo ='"+id+"';";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()){
                this.id = id;
                titulo1=resultado.getString("titulo1");
                titulo2=resultado.getString("titulo2");
                informacion=resultado.getString("informacion");
                foto=resultado.getString("foto");
            }
        } catch (SQLException ex) {
             System.out.println("Error al consultar el id de datos: " + ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitulo1() {
        String resultado = titulo1;
        if (titulo1 == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setTitulo1(String titulo1) {
        this.titulo1 = titulo1;
    }

    public String getTitulo2() {
        String resultado = titulo2;
        if (titulo2 == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setTitulo2(String titulo2) {
        this.titulo2 = titulo2;
    }

    public String getInformacion() {
        String resultado = informacion;
        if (informacion == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setInformacion(String informacion) {
        this.informacion = informacion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return "datos{" + "id=" + id + '}';
    }
    
    public boolean grabar(){

       String cadenaSQL="inser into datos (titulo1, titulo2, informacion, foto)values('"+titulo1+"','"+titulo2+"','"+informacion+"','"+foto+"');";
       System.out.println(cadenaSQL);
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean modificar(){
       String cadenaSQL="update datos set titulo1='"+titulo1+"',titulo1='"+titulo2+"',informacion='"+informacion+"',foto='"+foto+"' where id="+id+";";
       System.out.println(cadenaSQL);
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean eliminar(){
       String cadenaSQL="delete from datos where id="+id;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
   
   public static ResultSet getLista(String filtro, String orden){
       if(filtro != null && filtro != ""){
           filtro = " where " + filtro;
       }else{
           filtro= " ";
       }
       if (orden != null && orden != ""){
           orden = " order by " +orden;
       }else {
           orden = " ";
       }
       String cadenaSQL="Select id, titulo1, titulo2, informacion, foto from datos" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
   
   public static List<Datos> getListaEnObjetos(String filtro, String orden){
       List<Datos> lista=new ArrayList<>();
       ResultSet datos= Datos.getLista(filtro, orden);
       if (datos != null){
           try {
               while(datos.next()){
                   Datos dato =new Datos();
                   dato.setId(datos.getString("id"));
                   dato.setTitulo1(datos.getString("titulo1"));             
                   dato.setTitulo2(datos.getString("titulo2"));
                   dato.setInformacion(datos.getString("informacion"));
                   dato.setFoto(datos.getString("foto"));
                   
                   lista.add(dato);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
    
}
