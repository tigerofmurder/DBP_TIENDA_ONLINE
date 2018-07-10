<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="css/estilos.css"/>
	<link rel="stylesheet" href="css/style.css">
	<script src="funciones.js"></script>
</head>
<a href="login.html" style="float: right">LOGIN</a>
<p style="float: right"> - </p>
<a href="register.html" style="float: right">REGISTRATE</a>
<body background= "images/Camisas_2.jpg">
	
	<div id="agrupar">
	<header id="cabecera">
		<h1 id="titulo1"><center>GALERY L.A. COMPANY</center>	</h1>
	</header>

	<nav id="menu">
		<ul class="nav">
			<li><a href="">CATEGORÍA</a>
				<ul>
					<li><a href="subpage.jsp?categoria=categoria&tipo='manga_larga'">MANGA LARGA</a></li>
					<li><a href="subpage.jsp?categoria=categoria&tipo='manga_corta'">MANGA CORTA</a></li>
				</ul>
			</li>
			<li><a href="">COLOR</a>
				<ul>
					<li><a href="subpage.jsp?categoria=color&tipo='azul marino'">AZUL MARINO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='gris medio'">GRIS MEDIO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='gris claro'">GRIS CLARO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='verde ocuro'">VERDE OSCURO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='verde'">VERDE </a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='blanco'">BLANCO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='negro'">NEGRO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='rojo'">ROJO</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='rosa'">ROSA</a></li>
					<li><a href="subpage.jsp?categoria=color&tipo='celeste claro'">CELESTE CLARO</a></li>
				</ul>
			</li>
			<li><a href="">CALCE</a>
				<ul>
					<li><a href="subpage.jsp?categoria=categoria&tipo='regular'">REGULAR</a></li>
					<li><a href="subpage.jsp?categoria=categoria&tipo='slim_fit'">SLIM FIT</a></li>
				</ul>
			</li>
			<li><a href="">MARCA</a>
				<ul>
					<li><a href="subpage.jsp?categoria=marca&tipo='Ts'">Ts</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Zambesi'">Zambesi</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Zanone'">Zanone</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='All-Basic'">All-Basic</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Palm-Angels'">Palm-Angels</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Paul&Joe'">Paul&Joe</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Pierre-Balmain'">Pierre-Balmain</a></li>
					<li><a href="subpage.jsp?categoria=marca&tipo='Poan'">Poan</a></li>
				</ul>
			</li>
			<li><a href="">PRECIO</a>
				<ul>
					<li><a href="precio.jsp?categoria=precio&tipo='99.99'&sign=<">$0 - $99.99</a></li>
					<li><a href="precio.jsp?categoria=precio&tipo='99.99'&sign=>">$100 Y MÁS</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Connection conexion=null;
String mensaje="";
String driver="com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/tienda_online?serverTimezone=UTC";
String tabla_nombre="tienda_online";
String usuario = "root";
String clave = "";
String param1 = request.getParameter ("name");

try{
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection(url,usuario,clave);


	String select_value = "SELECT * FROM productos WHERE nombre='"+param1+"'";
	Statement st=conexion.createStatement();
	ResultSet rs= st.executeQuery(select_value);

	

	while(rs.next()){
		out.print("<div style='float: left'><center><img src='" + rs.getString("img_producto") + "' width='500px' height='500px' alt='' /><br></div><div style='background: #fff'>");
		out.println("<br><br>"+rs.getString("nombre")+"</a><br><br>");
		
		out.println("Descripcion:<br><br>"+rs.getString("descripcion")+"<br><br>");
		out.println("Color:<br><br>"+rs.getString("color")+"<br><br>");
		out.println("Marca:<br><br>"+rs.getString("marca")+"<br><br>");
		out.println("S/. "+rs.getString("precio")+"<br><br>");
		out.println("<br></center></div>");
	}
	conexion.close();
}catch(Exception ex){
	out.println(ex.toString());
}
%>
