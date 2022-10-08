/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import java.util.HashSet;
import java.util.Set;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Josue
 */
public class Estudiante extends Persona {
    private String carne,correoE;
    private int sangre;
    private Conexion cn;
    
    public Estudiante(){
    }
    
    public Estudiante(String carne, String correoE, int sangre, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_n) {
        super(id, nombres, apellidos, direccion, telefono, fecha_n);
        this.carne = carne;
        this.correoE = correoE;
        this.sangre = sangre;
    }
    
    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public String getCorreoE() {
        return correoE;
    }

    public void setCorreoE(String correoE) {
        this.correoE = correoE;
    }

    public int getSangre() {
        return sangre;
    }

    public void setSangre(int sangre) {
        this.sangre = sangre;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_con();
            String query = "select e.id_estudiante as id, e.carne,e.nombre, e.apellido,e.direccion,e.telefono,e.correo_electronico,e.fecha_nacimiento,ts.sangre,ts.id_tipos_sangre from estudiantes as e inner join tipos_sangre as ts on e.id_tipo_sangre=ts.id_tipos_sangre;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","codigo","nombres","apellidos","direccion","telefono","correo_electronico","nacimiento","sangre","id_tipos_sangre"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[10];
            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("carne");
                datos[2] = consulta.getString("nombre");
                datos[3] = consulta.getString("apellido");
                datos[4] = consulta.getString("direccion");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("fecha_nacimiento");
                datos[8] = consulta.getString("sangre");
                datos[9] = consulta.getString("id_tipos_sangre");
                tabla.addRow(datos);
            }
            cn.cerrar_con();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return tabla;
    }
    
    @Override
    public int agregar(){
        int retorno = 0;
        try{
            
            PreparedStatement parametro;
            cn = new Conexion();
            String query="INSERT INTO estudiantes(carne,nombre,apellido,direccion,telefono,correo_electronico,id_tipo_sangre,fecha_nacimiento)VALUES(?,?,?,?,?,?,?,?);";
            cn.abrir_con();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getCarne());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreoE());
            parametro.setInt(7, getSangre());
            parametro.setString(8, getFecha_n());
            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_con();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno =0;
        }
        return retorno;
        
    }
    
    @Override
    public int modificar(){
        int retorno = 0;
        try{
            
            PreparedStatement parametro;
            cn = new Conexion();
            String query="update estudiantes set carne=?,nombre=?,apellido=?,direccion=?,telefono=?,correo_electronico=?,id_tipo_sangre=?,fecha_nacimiento=? where id_estudiante=?;";
            cn.abrir_con();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getCarne());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreoE());
            parametro.setInt(7, getSangre());
            parametro.setString(8, getFecha_n());
            parametro.setInt(9, getId());
            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_con();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno =0;
        }
        return retorno;
        
    }
    @Override
    public int eliminar(){
        int retorno = 0;
        try{
            
            PreparedStatement parametro;
            cn = new Conexion();
            String query="delete from estudiantes  where id_estudiante=?;";
            cn.abrir_con();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_con();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno =0;
        }
        return retorno;
        
    }
}
