

#### Collaborators

DROP procedure IF EXISTS `insert_into_collaborators`;

DELIMITER $$
USE `dev`$$
CREATE PROCEDURE `insert_into_collaborators` (

    IN n_NOMBRE      varchar(45),
    IN n_APELLIDO    varchar(45),
    IN n_DIRECCION   varchar(45),
    IN n_EDAD        varchar(45),
    IN n_PROFESION   varchar(45),
    IN n_ESTADOCIVIL varchar(45)

)
BEGIN
declare n_id int;
start transaction;
        
        select IDCOLABORADOR into n_id from dev.COLABORADOR  where NOMBRE = n_NOMBRE and APELLIDO = n_APELLIDO;
        
        IF n_id is not NULL
		THEN 
			update dev.COLABORADOR 
            set 
		        DIRECCION   = n_DIRECCION,
                EDAD        = n_EDAD,
                PROFESION   = n_PROFESION ,
                ESTADOCIVIL = n_ESTADOCIVIL,
                
                updated_at = now() 
			where 1=1 and IDCOLABORADOR = n_id and not (

                DIRECCION  <=> n_DIRECCION   and
                EDAD       <=> n_EDAD        and
                PROFESION  <=> n_PROFESION   and
                ESTADOCIVIL<=> n_ESTADOCIVIL 
            );
        ELSE 
			insert INTO dev.COLABORADOR (
                NOMBRE,
                APELLIDO,
                DIRECCION,
                EDAD, 
                PROFESION,
                ESTADOCIVIL
            ) 
            values (
                n_NOMBRE,
                n_APELLIDO,
                n_DIRECCION,
                n_EDAD,
                n_PROFESION,
                n_ESTADOCIVIL
            );
        END IF;
    COMMIT;
END;$$

DELIMITER ;

