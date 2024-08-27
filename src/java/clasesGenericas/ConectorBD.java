/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesGenericas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luis Eraso
 */
public class ConectorBD {
     private String servidor;
    private String puerto;
    private String usuario;
    private String clave;
    private String baseDatos;
    
    private Connection conexion;//lleva la conexion de la base de datos

    public ConectorBD() {
        servidor="localhost";
        puerto="3306";
        usuario="ADSO";
        clave="1302";
        baseDatos="huellitasweb";
    }
    
    public boolean conectar(){
        boolean conectado=false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // System.out.println("Driver: ok");
            String cadenaConexion="jdbc:mysql://"+servidor+":"+puerto+"/"+baseDatos+"?characterEncoding=utf8";
            conexion= (Connection)DriverManager.getConnection(cadenaConexion, usuario, clave);
            // System.out.println("Conectado a la base de datos");
            conectado=true;
        } catch (ClassNotFoundException ex) {
            //Logger.getLogger(ConectorBD.class.getName()).log(Level.SEVERE, null, ex);
            // System.out.println("Error en el controlador de la base de datos "+ex.getMessage());
        } catch (SQLException ex) {
           // System.out.println("Error al conectarse a la base de datos" +ex.getMessage());
            
            //Logger.getLogger(ConectorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conectado;
    }
    
    public void desconectar(){
        try {
            conexion.close();
           // System.out.println("Desconexion de la base de datos completada");
        } catch (SQLException ex) {
            ///Logger.getLogger(ConectorBD.class.getName()).log(Level.SEVERE, null, ex);
            // System.out.println("Error al desconectarse de la base de datos: "+ex.getMessage());
        }
    }
    
    public static ResultSet consultar(String cadenaSQL){ //getDatos de Archivo
        ResultSet resultado = null;
        ConectorBD conector= new ConectorBD();
        if (!conector.conectar()) {
            System.out.println("Error al conectarse a la base de datos");
        }
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL, ResultSet.TYPE_SCROLL_SENSITIVE,0);
            resultado=sentencia.executeQuery();
        } catch (SQLException ex) {
         //   Logger.getLogger(ConectorBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la cadena SQL: "+cadenaSQL+". "+ex.getMessage());
        }
        //conector.desconectar();
        return resultado;
    }
    
    public static boolean ejecutarQuery(String cadenaSQL){
        boolean resultado= false;
        ConectorBD conector=new ConectorBD();
        if (!conector.conectar()) System.out.println("Error al conectarse a la base de datos");
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
            resultado=sentencia.execute();
            resultado= true;
        } catch (SQLException ex) {
            //Logger.getLogger(ConectorBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la cadena SQL: "+cadenaSQL+": "+ex.getMessage());
        }
        conector.desconectar();
        return resultado;
    }
}
