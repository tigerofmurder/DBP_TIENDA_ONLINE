<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Connection conexion=null;
String mensaje="";
String driver="com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/tienda_online?serverTimezone=UTC";
String tabla_nombre="tienda_online";
String usuario = "root";
String clave = "";
int inicio;
int impresos;
int anterior,proximo;
int pos;
if(request.getParameter("pos") !=  null){
	String aux=request.getParameter("pos");
	inicio=Integer.parseInt(aux);
}
else{
	inicio=0;
}
try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);


	String select_value = "SELECT * FROM productos limit " + inicio + ",10";
	Statement st=conexion.createStatement();
	ResultSet rs= st.executeQuery(select_value);

	impresos=0;

	while(rs.next()){
		String escritura=rs.getString("nombre");
		impresos=impresos+1;
		out.print("<a href='./detalles.jsp?name="+escritura+"'><article style='float: left'><center><img src='" + rs.getString("img_producto") + "' width='200px' height='200px' alt='' /><br>");
		out.println(rs.getString("nombre")+"</a><br>");
		out.println("S/. "+rs.getString("precio")+"<br>");
		out.println("<br></center></article>");
	}
	conexion.close();
	out.print("<footer id='pie'>");
	if (inicio==0) {
		out.print("ANTERIOR - ");
	}
	else{
		anterior=inicio-10;
		out.print("<a href='obtenerDatos.jsp?pos="+anterior+"' id='ant'>ANTERIOR - </a>");
	}
	if (impresos==10){
		proximo=inicio+10;
		out.print("<a href='obtenerDatos.jsp?pos="+proximo+"' id='sig'>SIGUIENTE</a>");
	}
	else{
		out.print("SIGUIENTE");
	}
	out.print("</footer>");
}catch(Exception ex){
	out.println(ex.toString());
}
%>