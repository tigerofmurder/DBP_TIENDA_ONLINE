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
	String email=request.getParameter("email");
	String password=request.getParameter("password");

	String select_value = "SELECT * FROM "+ tabla_nombre + " WHERE email= '" + email + "'";
	Statement st=conexion.createStatement();
	ResultSet rs= st.executeQuery(select_value);
	while(rs.next()){
		if(rs.getObject("password").equals(password)){
			session.setAttribute("loggedin","true");
			response.sendRedirect("formSubirImagen.jsp");
			return;
		}
	}
	out.print("<script>alert('Usuario o contraseña incorrectos!');window.location.replace('login.html');</script>");
	conexion.close();
}catch(Exception ex){
	out.println(ex.toString());
}
%>