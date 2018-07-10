<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%
	String proyecto = "proyecto_final";
	String carpeta = "/productos";
	String direccionReal;
	if(application.getRealPath("/").contains(proyecto)){
		direccionReal=application.getRealPath(carpeta);
	}
	else{
		direccionReal=application.getRealPath(proyecto + carpeta);
	}
	DiskFileItemFactory dfif = new DiskFileItemFactory();
	ServletFileUpload cargador = new ServletFileUpload(dfif);

	try{
		List items = cargador.parseRequest(request);
		Iterator iterator = items.iterator();

		while( iterator.hasNext()){
			FileItem item = (FileItem) iterator.next();
			if(!item.isFormField()){
				File file = new File(direccionReal, item.getName());
				item.write( file );
				response.sendRedirect("formSubirImagen.jsp");	
			}
		}
	}
	catch( FileUploadException e ){
		out.write( "<p>FileUploadException was thrown..." + e.getMessage() + "</p>" );
	}
%>