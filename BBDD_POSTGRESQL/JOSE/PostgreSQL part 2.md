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