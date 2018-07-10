addEventListener('load',inicializarEventos,false);
function inicializarEventos() {
	cargarPagina('obtenerDatos.jsp');
}
function presionEnlace(e){
	e.preventDefault();
	var url=e.target.getAttribute('href');
	cargarPagina(url);
}
var conexion_ajax;
function cargarPagina(url){
	if (url=='') {
		return;
	}
	conexion_ajax=new XMLHttpRequest();
	conexion_ajax.onreadystatechange = procesarEventos;
	conexion_ajax.open("GET",url,true);
	conexion_ajax.send(null);
}
function procesarEventos() {
	var detalles = document.getElementById("detalles");
	if (conexion_ajax.readyState == 4) {
		detalles.innerHTML = conexion_ajax.responseText;
		var sig=document.getElementById('sig');
		if (sig!=null) {
			sig.addEventListener('click',presionEnlace,false);
		}
		var ant=document.getElementById('ant');
		if (ant!=null) {
			ant.addEventListener('click',presionEnlace,false);
		}
	} 
	else {
		detalles.innerHTML = '<img src="img/cargando.gif">';
	}
}