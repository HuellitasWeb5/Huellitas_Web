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

        // Mantener siempre comentado estas credenciales al subir cambios.
       // usuario = "ADSO";
        //clave = "1302";


        servidor = "localhost";
        puerto = "3306";
        usuario = "adso";
        clave = "utilizar";
        baseDatos = "HuellitasWeb";

    }

    public boolean conectar() {
        boolean conectado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver ok");
            String cadenaConexion = "jdbc:mysql://" + servidor + ":" + puerto + "/" + baseDatos + "?characterEncoding=utf8";
            conexion = (Connection) DriverManager.getConnection(cadenaConexion, usuario, clave);
            System.out.println("Conectado a la BD");
            conectado = true;
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en el controlador en la base de datos" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error al conectarse a la base de datos" + ex.getMessage());
        }
        return conectado;
    }

    public void desconectar() {
        try {
            conexion.close();
            System.out.println("Desconectado de la BD");
        } catch (SQLException ex) {
            System.out.println("Error al desconectar la BD" + ex.getMessage());
        }
    }

    public static ResultSet consultar(String cadenaSQL) {
        ResultSet resultado = null;
        ConectorBD conector = new ConectorBD();
        if (!conector.conectar()) {
            System.out.println("Error al conectarse al bd");
        }
        try {
            PreparedStatement sentencia = conector.conexion.prepareStatement(cadenaSQL, ResultSet.TYPE_SCROLL_SENSITIVE, 0);
            resultado = sentencia.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error en la cadenaSQL. " + cadenaSQL + ". " + ex.getMessage());
        }
        return resultado;
    }

    public static boolean ejecutarQuery(String cadenaSQL) {
        boolean resultado = false;
        ConectorBD conector = new ConectorBD();
        if (!conector.conectar()) {
            System.out.println("Error al conectarse al bd");
        }
        try {
            PreparedStatement sentencia = conector.conexion.prepareStatement(cadenaSQL);
            resultado = sentencia.execute();
            resultado = true;
        } catch (SQLException ex) {
            System.out.println("Error en la cadenaSQL. " + cadenaSQL + ". " + ex.getMessage());
        }
        conector.desconectar();
        return resultado;
    }

}
