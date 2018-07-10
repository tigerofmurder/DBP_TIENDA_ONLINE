<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>


<%
Connection conexion=null;
Statement sql=null;
String mensaje="";
String driver="com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/tienda_online?serverTimezone=UTC";
String tabla_nombre="productos";
String usuario = "root";
String clave = "";


try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);
	sql=conexion.createStatement();
	String nombre=request.getParameter("nombre");
	String imagen=request.getParameter("imagen");
	String categoria=request.getParameter("categoria");
	String precio=request.getParameter("precio");
	String stock=request.getParameter("stock");
	String descripcion=request.getParameter("descripcion");
	String color=request.getParameter("color");
	String marca=request.getParameter("marca");
	String resultado = "SELECT * FROM "+ tabla_nombre + " WHERE nombre= '" + nombre + "'";
	Statement st=conexion.createStatement();
	ResultSet rs= st.executeQuery(resultado);
		String text = " INSERT INTO " + tabla_nombre +"(nombre,img_producto,categoria,precio,stock,descripcion,color,marca) VALUES ('"+nombre+"','"+imagen+"','"+categoria+"','"+precio+"','"+stock+"','"+descripcion+"','"+color+"','"+marca+"')";
		sql.executeUpdate(text);
		out.print("REGISTRO");
		session.setAttribute("loggedin","true");
		response.sendRedirect("creador.html");
	conexion.close();
}catch(Exception ex){
	out.println(ex.toString());
}
%>

