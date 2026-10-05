██████████████████████████████████

███ Funciones & Procedimientos ███

 • Tipos de Datos
	— Campos en tablas que corresponden a ese tipo de dato.


				+-----------+---------------------+
Tipo de dato:	|   Contacto    | OTHER TEXT INFO |
				+-----------+---------------------+
				| NOMBRE	    |                 |
				| APELLIDO	    |                 |
				| TELEFONO	    |                 |
				| CORREO	    |                 |
				+-----------+---------------------+
				
Declaracion de tabla.
 • Emergencia
Trabajadores_id		INTEGER
Persona				Contacto
Direccion			TEXT
Alergias			TEXT
Notas				TEXT

 • Trabajadores
id					SERIAL
Nombre				VARCHAR 40
Apellido			VARCHAR 40
Cargo				TEXT
Fecha_Ingreso		DATE
	






















██████████████████████████████████████████████████████████████████████████████

███ Entidad Relacion ███

PgAdmin: Tools, ERD

Tienda Virtual

           █                                        █
      CATEGORIA1			 ◆                 CATEGORIA2
	  
	  
                        CORRESPONDE
					   
				 
      █      █               ◆            █         █          █
      ID  NOMBRE                        NOMBRE   PRECIO   DESCRIPTION
                                                    █
                                               CALIFICACION

                                                   ◆

                                                    █
                                                IMAGENES
                                          █         █          █
                                         ID      ARCHIVO   PRODUCTO_ID
											 
                                                   ◆
											 
                                                    █
                                                ETIQUETAS
                                         █         █           █ 
                                         ID   PRODUCTO_ID  DESCRIPCION




							   █
							USUARIOS
             █     █       █        █        █        █
            ID  CEDULA  NOMBRE  APELLIDO  TELEFONO CORREO	

			                   ◆
							   
							   █
					    USUARIOS_ROLES
						  █          █
                      USUARIO_ID  ROLE_ID
					  
					           ◆
							   
							   █
							 ROLES
						  █         █
						  ID   DESCRIPCION	 
							 



















█████████████████████████████

███ Consola de PostgreSQL ███

 • Interface Grafica
 • PgAdmin
	— Inicio PgAdmin
	• Seleccionar BBDD
	
	█████████████████████████████
	██
	██	Clave de Conexion a BBDD
	██
	█████████████████████████████
	

	+-----------+-----------------+
	|   BBDD    | OTHER TEXT INFO |
	+-----------+-----------------+
	| ELEMENTOS |                 |
	| ASOCIADOS |                 |
	| A LA      |                 |
	| BBDD      |                 |
	+-----------+-----------------+
	
	Funciones		{
	Vistas			{		Elementos que
	Schemas			{		conforman
	...				{		La BBDD
	Otros			{

 • Tareas:
	— Definicion			{		Elementos en la
	— Modificacion			{		     BBDD

███████████████

███ Schemas ███

Agrupamiento de tablas en funcion de un area de aplicacion.

 • e.g.:
	— public		←		(default)
	— recursos_humanos
	— finanzas
	— inventario
	— presupuesto
	— desarrollo
	
	— recursos_humanos.personas		←		Tres entidades diferentes
	— presupuesto.personas			←				   con
	— public.personas				←		el mismo nombre de tabla
		↓
		
	(
	campo1,
	campo2,
	telefono varchar(20)
	telefono varchar[](20)		→		Almacenamiento de varios registros
	)


	+--------------------+-------------+-------------+-------------+
	| TELEFONO varchar[] |     HAB     |     CEL     |     OFI     |
	+--------------------+-------------+-------------+-------------+
	| persona1           | 212-******* | 212-******* | 212-******* |
	| persona2           | 212-******* |             | 212-******* |
	| persona3           |             | 212-******* |             |
	+--------------------+-------------+-------------+-------------+


	+---------------+           +----------------+
	| proveedores_1 |           |  productos_1   |
	+---------------+           +----------------+
	| ...           |           | ...            |
	| id            |     →     | proveedores_id |
	| ...           |           | ...            |
	+---------------+           +----------------+












████████████████████████████████████

███ Manejador de BBDD PostgreSQL ███

	Consola		| 		Interface Grafica
	PSQL		|		pgAdmin
	
Proceso de instalacion — Ambas quedan disponibles
Fuente de instalacion:
www.postgresql.com

 1	• Descargar instalador — Ejecutar — Elegir sistema operativo
 2	• Pasos del proceso de instalacion:
		— Asignar contrasena de BBDD
		— Puerto de ejecucion 5432 (opcional)
	
	• Ejecucion
		— Inicio, psql, levanta consola:
			— Servidor [localhost]	↓
			— Usuario [postgres]	←	↓
			— Base de Datos [postgres]	←	↓
			— Password: 123456				←
			
Nota: El SQL que se ejecuta en cualquier manejador de BBDD es el mismo si la base de datos es relacional.
La diferencia son los comandos propios de cada manejador de BBDD.

	PostgresSQL		| 		MySQL
	/c mi_db		|		maridb
					|		use mi_db
	
	






















███ Sistema de Gestion de BBDD : MySQL/MariaDB ███

									↑	↑
							(MySQL)
							Version
							administrada
							y mantenida
							por ORACLE
						
										↑
										(MariaDB)
										Version a
										cargo de
										MariaDB
										Foundation
									
█ Entorno de Ejecucion █

ENGINE	→	Aplicaciones Propias
			Interface Grafica : PHPADMIN
			Terminal de Comandos
			SGBD : MySQL/MariaDB
			Sistema Operativo
			
█ Instalacion █
 • Con proposito de desarrollo Web
 • Con proposito de desarrollo Client/Server

██████████████████████

███ Desarrollo Web ███
1 — XAMPP
	• Apache
	• MySQL/MariaDB
	• PHP
	• PERL
2 — WAMP
	• Apache
	• MySQL/MariaDB
	• PHP
3 — AppSer
	• Apache
	• MySQL
	• PHP

████████████████████████

███ Panel de Control ███

— Seccion a la derecha
 • Funcionalidades o Acciones
 — SHELL
	 • Accesso a la terminal de comandos MySQL

Log de mensajes, resultado de los comandos

███████████████████████████████████
	
███ Base de Datos : Repositorio ███

 • Permite la persistencia de los datos
 
    ████
   ██████
   ██████
   ██████
   ██████
   ██████
    ████
   
	 ↑
	
CONTIENE	→	 • Tablas
				 • Indices
				 • Vistas
				 • Funciones
				 • Procedimientos
				 • Disparadores
				 • Usuarios

███████████

███ SQL ███
 • Lenguaje Estructurado de Consultas
 (Structured Query Language)
 • Pilar principal de los sistemas de gestion de BBDD relacionales
 (SQL)

█████████████

███ Extra ███

ASCII

0 ... 255

1 byte