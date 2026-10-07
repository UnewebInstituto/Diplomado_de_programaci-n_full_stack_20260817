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
						  
						  