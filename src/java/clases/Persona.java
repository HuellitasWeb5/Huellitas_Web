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
public class Persona {
    
    private String identificacion; //
    private String nombre; //
    private String genero; //
    private String fechaNacimiento; // 
    private String email;
    private String telefono;
    private String direccion;
    private String residencia;
    private String foto;
    private String tipo;
    private String clave;

    public Persona() {

    }

    public Persona(String identificacion) {
        String cadenaSQL = "select identificacion,nombre,genero,fechaNacimiento,email,telefono,direccion,residencia,foto,tipo,clave from persona where identificacion=" + identificacion;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.identificacion = identificacion;
                nombre = resultado.getString("nombre");
                genero = resultado.getString("genero");
                fechaNacimiento = resultado.getString("fechaNacimiento");
                email = resultado.getString("email");
                telefono = resultado.getString("telefono");
                direccion = resultado.getString("direccion");
                residencia = resultado.getString("residencia");
                foto = resultado.getString("foto");
                tipo = resultado.getString("tipo");
                clave = resultado.getString("clave");

            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar la identificacion" + ex.getMessage());
        }
    }

    public String getIdentificacion() {
        String resultado = identificacion;
        if (identificacion == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
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

    public GeneroPersona getGeneroEnObjeto() {
        return new GeneroPersona(genero);
    }
    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEmail() {
     String resultado = email;
        if (email == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
       String resultado = telefono;
        if (telefono == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
       String resultado = direccion;
        if (direccion== null) {
            resultado = "";
        }
        return resultado;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getResidencia() {
     String resultado = residencia;
        if (residencia == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setResidencia(String residencia) {
        this.residencia = residencia;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

  public String getTipo() {
        if (tipo == null) {
            tipo = "";
        }
        return tipo;
    }

    public TipoPersona getTipoEnObjeto() {
        if (tipo == null) {
            tipo = "";
        }
        return new TipoPersona(tipo);
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getClave() {
        if (clave == null || clave.trim().length() == 0) {
            clave = identificacion;
        }
        if (clave.length() < 32) {
            this.clave = "md5('" + clave + "')";
        } else {
            this.clave = "'" + clave + "'";
        }
        return clave;
    }

    public void setClave(String clave) {
            this.clave = clave;
    }
    public GeneroPersona getGeneroPersona() {
        return new GeneroPersona(genero);
    }

    @Override
    public String toString() {

        String datos="";
        if (identificacion!=null){
            datos=identificacion+" - "+nombre;
        }
        return datos;
    }


    public boolean grabar() {
 
        String cadenaSQL = "insert into Persona(identificacion,nombre,genero,fechaNacimiento,email,telefono,direccion,residencia,foto,tipo,clave) "
                + "values ('" + identificacion + "', '" + nombre + "','" + genero + "','" + fechaNacimiento + "', '" + email + "',"

                + " '" + telefono + "','" + direccion + "','" + residencia + "','" + foto + "','" + tipo + "',"+ this.getClave()  + ")";
        System.out.println(cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar(String identificacionAnterior) {

        String cadenaSQL = " update persona set identificacion='" + identificacion + "',nombre='" + nombre + "', "
                + "genero='" + genero + "',fechaNacimiento='" + fechaNacimiento + "',email='" + email + "',telefono='" + telefono + "',"
                + " direccion='" + direccion + "',residencia='" + residencia + "',foto='" + foto + "',tipo='" + tipo + "',clave=" + this.getClave() + "  where identificacion=" +identificacionAnterior;
        System.out.println("Modificar"+cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
       String cadenaSQL = "delete from Persona where identificacion=" + identificacion;
        System.out.println("Eliminar " + cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !"".equals(filtro)) {
            filtro = " where " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && !"".equals(orden)) {
            orden = " order by  " + orden;
        } else {
            orden = " ";
            
        }
        String cadenaSQL = "select identificacion,nombre,genero,fechaNacimiento,email,telefono,direccion,residencia,foto,tipo,clave from persona " + filtro + orden;
      //   System.out.println(cadenaSQL); // prueba para revisar como esta iniciando en sesion
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<Persona> getListaEnObjetos(String filtro, String orden) {
        List<Persona> lista = new ArrayList<>();
        ResultSet datos = Persona.getLista(filtro, orden);
        if (datos != null) {
            try {
                while(datos.next()){
                    Persona persona = new Persona();
                    persona.setIdentificacion(datos.getString("identificacion"));
                    persona.setNombre(datos.getString("nombre"));
                    persona.setGenero(datos.getString("genero"));
                    persona.setFechaNacimiento(datos.getString("fechaNacimiento"));
                    persona.setEmail(datos.getString("email"));
                    persona.setTelefono(datos.getString("telefono"));
                    persona.setDireccion(datos.getString("direccion"));
                    persona.setResidencia(datos.getString("residencia"));
                    persona.setFoto(datos.getString("foto"));
                    persona.setTipo(datos.getString("tipo"));
                    persona.setClave(datos.getString("clave"));

                    lista.add(persona);
                    System.out.println(persona); 
                }
            } catch (SQLException ex) {
                Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
  public static Persona validar(String identificacion, String clave) {
        Persona persona = null;
        List<Persona> lista = Persona.getListaEnObjetos("identificacion='" + identificacion
                + "' and clave=md5('" + clave + "')", null);
        if (lista.size() > 0) {
            persona = lista.get(0); // get devuelve el primer elemento de la lista
        }
        return persona;
    }
}