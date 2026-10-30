█ — •

████████████████████
███ JavaScript 3 ███

document.getElementByid("nombreID")
	— Devuelve un Objeto
	
document.getElementByClassName("nombreClass")
	— Devuelve una Coleccion
	
document.getElementByName("nombreName")
	
document.getElementByTagName("nombreTag")
	
	████
	████ Objeto
	████

	— Atributos
	— Metodos

         Coleccion
	██	██	██	██	██
    ██  ██  ██  ██	██
	0	1	2	...	n
	— Se puede recorrer porque son iterables

Expresion Regular



















████████████████████
███ JavaScript 2 ███

[Navegador Web] 						Node.JS

	— Acceder al DOM
	(Modelo de Objetos
	del Documento)

		 HTML
		<html>
	<head>	<body>

	— Cada etiqueta HTML es un Objetos
	— Etiquetas tienen   atributos   y   metodos
				       (propiedades)   (funciones)
	
Navegador Web 						[Node.JS]
									
									Terminal
									node --version
									npm --version
									
									Ejecuta Javascript Puro

	 Navegador Web
	+======+======+
	| XML  | JSON |
	+------+------+	 —	Entrada desde el
	| CSS  | JS   |		Mundo Exterior
	+------+------+
	|     HTML    |
	+------+------+

	+=========+
	| App     |	      —  "  "  "
	+---------+
	| Node.js |
	+---------+
	| S.O.    |
	+---------+

document.getElementByid("a");
document.getElementsByTagName(""); — Nombre asignado al atributo "name"

Function name(){
			 •
		"ARGUMENTOS"
}
Arrow Function:
              •
const nombre = () => {

}

Anonymous Function:
() => {
}

Objeto:
<button id="calcular">
	calcular
</button>

const btnCalcular = document.getElementByid("calcular")
addEventListened("click", function)








██████████████████
███ JavaScript ███

2 Entornos de ejecicion
	
	— Navegador Web
	— Servidor Instalacion de Node.js
	
Conceptos basicos de lenguajes de programacion:

	— Variables
	— Tipos de Datos
	— Estructuras de Control:
		• Condicional
		• Repetitivas
		
	— Declaracion de funciones
	— Declaraciones de classes (Poo?)
	— Persistencia:
		• Archivos
		• BBDD
		
	+======+======+
	| XML  | JSON |
	+------+------+				<script>
	| CSS  | JS   |		→	{	codigo
	+------+------+				</script>
	|     HTML    |
	+------+------+

Declaracion de js:

	1 — A traves de los atributos ON. Contenidos de cada etiqueta html
		
		
DOM: Modelo de objetos del documento
	2 — Carga en memoria del contenido del HTML
	+=====  
	|     █
	|      |	<head>
	| HTML |	<script>
	|      |	</script>
	+------+	</head>
	
	3 — Archivo externo con declaracion de codigo.js
		<script src="./carpeta/nombre.js">
		</script>