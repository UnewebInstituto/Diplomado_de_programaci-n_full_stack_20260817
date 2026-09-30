SELECT public.alumnos.nombre as "Nombre",
       public.alumnos.apellido as "Apellido",
	   public.asignaturas.nombre as "Asignatura",
	   public.alumnos_asignaturas_inscripcion.periodo as "Período"
	   from public.alumnos,
	        public.asignaturas,
			public.alumnos_asignaturas_inscripcion
	   where public.alumnos_asignaturas_inscripcion.alumno_id = public.alumnos.id and 
	   	     public.alumnos_asignaturas_inscripcion.asignatura_id = public.asignaturas.id;
	   