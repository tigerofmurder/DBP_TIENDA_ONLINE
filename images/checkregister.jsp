<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Connection conexion=null;
String mensaje="";
String driver="com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/tienda_online?serverTimezone=UTC";
String tabla_nombre="usuarios";
String usuario = "root";
String clave = "";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);
	String nombre=request.getParameter("nombre");
	String apellidos=request.getParameter("apellidos");
	String email=request.getParameter("email");
	String password=request.getParameter("password");

	String resultado = "SELECT * FROM "+ tabla_nombre + " WHERE email= '" + email + "'";
	Statement st=conexion.createStatement();
	ResultSet rs= st.executeQuery(resultado);
	if (rs.next()){
		out.print("<script>alert('E-mail ya esta Registrado');window.location.replace('register.html');</script>");
	}
	else{
		String insert_value = " INSERT INTO " + tabla_nombre +"(nombre,apellidos,email,password) VALUES ('"+nombre+"','"+apellidos+"','"+email+"','"+password+"')";
		out.println(insert_value);
		Statement sta=conexion.createStatement();
		ResultSet rsa= sta.executeQuery(insert_value);
		if (!rsa.next()) {
			out.print("<script>alert('E-mail ya esta Registrado');window.location.replace('register.html');</script>");
		}
		response.sendRedirect("formSubirImagen.jsp");
			return;
	}
	conexion.close();
}catch(Exception ex){
	out.println(ex.toString());
}
%>