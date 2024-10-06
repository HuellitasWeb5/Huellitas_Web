/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
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
    private String tamano;
    private String foto;
    private String cuidadosEspeciales;
    private String fechaNacimientoAproximada;
    private String fechaIngreso;
    private String estado;
    private String descripcion;

    public Mascota() {
    }

    public Mascota(String codigo) {
        String cadenaSQL="select codigo, nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado, descripcion from mascota where codigo=" +codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if(resultado.next()){
             this.codigo = codigo;
             nombre=resultado.getString("nombre");
             genero=resultado.getString("genero");
             tamano=resultado.getString("tamano");
             foto=resultado.getString("foto");
             cuidadosEspeciales=resultado.getString("cuidadosEspeciales");
             fechaNacimientoAproximada=resultado.getString("fechaNacimientoAproximada");
             fechaIngreso=resultado.getString("fechaIngreso");
             estado=resultado.getString("estado");
             descripcion=resultado.getString("descripcion");
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

    public String getTamano() {
       String resultado = tamano;
        if (tamano == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setTamano(String tamano) {
        this.tamano = tamano;
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
    
    public String getDescripcion() {
        String resultado = descripcion;
        if (descripcion == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public int getEdad() {
        LocalDate fechaNacimiento = LocalDate.parse(this.getFechaNacimientoAproximada());
        LocalDate fechaActual = LocalDate.now();
        return Period.between(fechaNacimiento, fechaActual).getYears();
    }
    
    public String toString() {
        String datos="";
        if (codigo!=null){
            datos=nombre+" - "+codigo;
        }
        return datos;
    }
    
   public boolean grabar(){

       String cadenaSQL="insert into mascota (nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado, descripcion) "
               + " values ('"+nombre+"','"+genero+"','"+tamano+"','"+foto+"','"+cuidadosEspeciales+"','"+fechaNacimientoAproximada+"','"+fechaIngreso+"','"+estado+"','"+descripcion+"')";
       System.out.println(cadenaSQL);
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    // falta el to String con el override
   public boolean modificar(){
       String cadenaSQL="update mascota set nombre='"+nombre+"',genero='"+genero+"',tamano='"+tamano+"',foto='"+foto+"',cuidadosEspeciales='"+cuidadosEspeciales+"',"
               + "fechaNacimientoAproximada='"+fechaNacimientoAproximada+"',fechaIngreso='"
               +fechaIngreso+"',estado='"+estado+"',descripcion='"+descripcion+"' where codigo="+codigo+";";
       System.out.println(cadenaSQL);
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
       String cadenaSQL="Select codigo, nombre, genero, tamano, foto, cuidadosEspeciales, fechaNacimientoAproximada, fechaIngreso, estado, descripcion from mascota" +filtro+orden;
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
                   mascota.setTamano(datos.getString("tamano"));
                   mascota.setFoto(datos.getString("foto"));      
                   mascota.setCuidadosEspeciales(datos.getString("cuidadosEspeciales"));
                   mascota.setFechaNacimientoAproximada(datos.getString("fechaNacimientoAproximada"));
                   mascota.setFechaIngreso(datos.getString("fechaIngreso"));
                   mascota.setEstado(datos.getString("estado"));
                   mascota.setDescripcion(datos.getString("descripcion"));
                   
                   lista.add(mascota);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
   
    public static String getListaCompletaEnArregloJS(String filtro, String orden) {
        String lista = "[";
        List<Mascota> datos = Mascota.getListaEnObjetos(filtro, orden);
        for (int i = 0; i < datos.size(); i++) {
            Mascota mascota = datos.get(i);
            if (i > 0) {
                lista += ", ";
            }
            lista += "[";
            lista += "'" + mascota.getCodigo() + "',";
            lista += "'" + mascota.getNombre()+ "',";
            lista += "'" + mascota.getGenero()+ "',";
            lista += "'" + mascota.getTamano()+ "',";
            lista += "'" + mascota.getFoto()+ "',";
            lista += "'" + mascota.getCuidadosEspeciales()+ "',";
            lista += "'" + mascota.getFechaNacimientoAproximada()+ "',";
            lista += "'" + mascota.getFechaIngreso()+ "',";
            lista += "'" + mascota.getEstado()+ "',";
            lista += "'" + mascota.getDescripcion()+ "',";
            lista += "]";
        }
        lista += "];";
        return lista;
    }
public static List<String[]> getMascotasPorFechaIngreso() {
    List<String[]> lista = new ArrayList<>(); // Se inicializa una lista que almacenará arrays de Strings, cada uno con los datos de cada año y su cantidad de mascotas.
    
    // Consulta SQL que selecciona el año de la fecha de ingreso (fechaIngreso) y cuenta cuántas mascotas ingresaron en ese año.
    String cadenaSQL = "SELECT YEAR(fechaIngreso) AS anio, COUNT(*) AS cantidad "
            + "FROM Mascota GROUP BY YEAR(fechaIngreso);";
    
    ResultSet resultado = ConectorBD.consultar(cadenaSQL); // Ejecuta la consulta y guarda los resultados en un ResultSet.
    
    try {
        // Itera sobre el ResultSet para obtener los datos.
        while (resultado.next()) {
            String[] registro = new String[2]; // Crea un array de Strings para almacenar el año y la cantidad.
            
            // Obtiene el año de la columna 'anio' de la consulta.
            registro[0] = resultado.getString("anio");
            
            // Obtiene la cantidad de la columna 'cantidad' de la consulta.
            registro[1] = resultado.getString("cantidad");
            
            // Agrega el registro (año, cantidad) a la lista.
            lista.add(registro);
        }
    } catch (SQLException ex) {
        // Captura cualquier error que pueda ocurrir al procesar el ResultSet.
        System.out.println("Error en getMascotasPorFechaIngreso. \nCadenaSQL: " + cadenaSQL + "\nError: " + ex.getMessage());
    }
    
    return lista; // Retorna la lista con los resultados.
}

}
