<%-- 
    Document   : index
    Created on : Sep 5, 2022, 6:38:27 PM
    Author     : Josue
--%>
<%@page import="modelo.Sangre" %>
<%@page import="modelo.Estudiante" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Estudiantes</h1>
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button>
        <div class="container">
            
            
            <div class="modal fade" id="modal_estudiante" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Estudiantes</h4>
        </div>
        <div class="modal-body">
            <p>
                
                <form action="sr_estudiante" method="post" class="form-group">
            <label for="lbl_id"><b>ID</b></label>
            <input type="text" name="txt_id" id="txt_id" value="0" class="form-control" readonly>
            
            <label for="lbl_codigo"><b>Carne</b></label>
            <input type="text" name="txt_carne" id="txt_carne" placeholder="Ejemplo: E001" class="form-control" required>
            
            <label for="lbl_nombre"><b>Nombres</b></label>
            <input type="text" name="txt_nombre" id="txt_nombre" placeholder="Ejemplo: Juan" class="form-control" required>
            
            <label for="lbl_apellidos"><b>Apellidos</b></label>
            <input type="text" name="txt_apellido" id="txt_apellido" placeholder="Ejemplo: Perez" class="form-control" required>
            
            <label for="lbl_direccion"><b>Direccion</b></label>
            <input type="text" name="txt_direccion" id="txt_direccion" placeholder="Ejemplo: Guatemala" class="form-control" required>
            
            <label for="lbl_telefono"><b>Telefono</b></label>
            <input type="number" name="txt_telefono" id="txt_telefono" placeholder="Ejemplo: 12345678" class="form-control" required>
            
            <label for="lbl_telefono"><b>Correo Electronico</b></label>
            <input type="text" name="txt_correoE" id="txt_correoE" placeholder="Ejemplo: nombre@gmail.com" class="form-control" required>
            
            <label for="lbl_sangre"><b>Sangre</b></label>
            <select name="drop_sangre" id="drop_sangre" class="form-control">
                <% 
                    Sangre sangre  = new Sangre();
                    HashMap<String,String> drop = sangre.drop_sangre();
                    for (String i: drop.keySet()){
                    out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                    }
                %>
                
            </select>
                <br>
            <label for="lbl_Fn"><b>Fecha Nacimiento</b></label>
            <input type="date" name="txt_Fn" id="txt_Fn" placeholder="Ejemplo: yyyy-mm-dd" class="form-control" required>
            <br>
            
            <button  name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button>
            <button  name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg">Modificar</button>
            <button  name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
            </form>
                
            </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
                <table class="table">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Correo</th>
        <th>Nacimiento</th>
        <th>Sangre</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
      <% 
      Estudiante estudiante = new Estudiante();
      DefaultTableModel tabla = new DefaultTableModel();
      tabla=estudiante.leer();
      for(int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id="+ tabla.getValueAt(t, 0) +" data-id_s="+ tabla.getValueAt(t, 9) +" >");
            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
            out.println("</tr>");
          }

      %>
      
    </tbody>
  </table>
                
                
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <<script type="text/javascript">
            
            function limpiar(){
                $("#txt_id").val(0);
               $("#txt_carne").val('');
               $("#txt_nombre").val('');
               $("#txt_apellido").val('');
               $("#txt_direccion").val('');
               $("#txt_telefono").val('');
               $("#txt_correoE").val('');
               $("#drop_sangre").val(1);
               $("#txt_Fn").val('');
            }
            
            $('#tbl_estudiantes').on('click','tr td',function(evt){
               var target,id,id_s,carne,nombres,apellidos,direccion,telefono,correo,nacimiento;
               target = $(event.target);
               id=target.parent().data('id');
               id_s=target.parent().data('id_s');
               carne=target.parent("tr").find("td").eq(0).html();
               nombres=target.parent("tr").find("td").eq(1).html();
               apellidos=target.parent("tr").find("td").eq(2).html();
               direccion=target.parent("tr").find("td").eq(3).html();
               telefono=target.parent("tr").find("td").eq(4).html();
               correo=target.parent("tr").find("td").eq(5).html();
               nacimiento=target.parent("tr").find("td").eq(6).html();
               
               $("#txt_id").val(id);
               $("#txt_carne").val(carne);
               $("#txt_nombre").val(nombres);
               $("#txt_apellido").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_correoE").val(correo);
               $("#drop_sangre").val(id_s);
               $("#txt_Fn").val(nacimiento);
               $("#modal_estudiante").modal('show');
               
            });   
        </script>
    
    </body>
</html><%-- 
    Document   : index
    Created on : Oct 7, 2022, 8:40:46 PM
    Author     : Josue
--%>

