<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Connection conexion=null;
Statement sql=null;
String mensaje="";
String driver="com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/tienda_online?serverTimezone=UTC";
String tabla_nombre="usuarios";
String usuario = "root";
String clave = "";
try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);
	sql=conexion.createStatement();
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
		String text = " INSERT INTO " + tabla_nombre +"(nombre,apellidos,email,password) VALUES ('"+nombre+"','"+apellidos+"','"+email+"','"+password+"')";
		sql.executeUpdate(text);
		out.print("REGISTRO");
		session.setAttribute("loggedin","true");
		response.sendRedirect("home_login.html");
	}
	conexion.close();
}catch(Exception ex){
	out.println(ex.toString());
}
%>