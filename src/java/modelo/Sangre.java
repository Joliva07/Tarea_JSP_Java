/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
/**
 *
 * @author Josue
 */
public class Sangre {
    private String sangre;
    private int id_sangre;
    private Conexion cn;
    
    public Sangre(){
    }
    public Sangre(String sangre, int id_sangre) {
        this.sangre = sangre;
        this.id_sangre = id_sangre;
    }
    
    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }
    
    public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            cn = new Conexion();
            String query = "SELECT id_tipos_sangre as id,sangre FROM tipos_sangre;";
            cn.abrir_con();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while(consulta.next()){
                drop.put(consulta.getString("id"), consulta.getString("sangre"));
            }
            cn.cerrar_con();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    
}
