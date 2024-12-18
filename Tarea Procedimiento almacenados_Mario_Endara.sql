create database Marathon;
use Marathon;

create table cliente(
	ClienteID INT AUTO_INCREMENT PRIMARY KEY,  
    Nombre VARCHAR(100),                      
    Estatura DECIMAL(5,2),                    
    FechaNacimiento DATE,                     
    Sueldo DECIMAL(10,2)                      
);

INSERT INTO cliente (Nombre,Estatura,FechaNacimiento,Sueldo) 
VALUES ('Mauricio', 1.70,"2000-02-15",1000),
	   ('Carlos', 1.80,"1998-06-20",1500),
	   ('Leonardo', 1.85,"2003-03-05",2000);
-- Procedimento almacenado
DELIMITER //
CREATE PROCEDURE MostrarClientes()
BEGIN
    SELECT * FROM clientes;
END //
DELIMITER ;
-- Eliminar procedimientos
DROP PROCEDURE IF EXISTS MostrarClientes;

-- Procedimiento con datos almacenados
DELIMITER //
CREATE PROCEDURE Clientesdatos()
BEGIN
    SELECT * FROM cliente;
END //
DELIMITER ;
-- Llamar al procedimiento
call marathon.Clientesdatos();
-- Procedimiento que permite crear un nuevo cliente
DELIMITER //

CREATE PROCEDURE InsertarCliente(
    IN Nombre VARCHAR(100),
    IN Estatura DECIMAL(5,2),
    IN FechaNacimiento DATE,
    IN Sueldo DECIMAL(10,2)
)
BEGIN
    INSERT INTO cliente (nombre, estatura, FechaNacimiento,sueldo)
    VALUES ('Sofia', 1.60,"2002-11-19",2000);
END //
DELIMITER ;

-- Llamar al procedimiento de insertar cliente
call marathon.InsertarCliente('Sofia', 1.60, '2002-11-19', 2000);

-- Mostar los precedimientos creados
SHOW PROCEDURE STATUS WHERE Db = 'marathon';
-- Procedimiento de actualizacion
DELIMITER //

CREATE PROCEDURE ActualizarSueldoCliente(
    IN ClienteID INT,
    IN Sueldo decimal
)
BEGIN
    UPDATE cliente
    SET Sueldo = Sueldo
    WHERE ClienteID = ClienteID;
END //

DELIMITER ;
call marathon.ActualizarSueldoCliente(3, 3500);

-- Procedimiento para eliminar un cliente
DELIMITER //

CREATE PROCEDURE EliminarCliente(
    IN p_clienteID INT
)
BEGIN
    DELETE FROM cliente
    WHERE ClienteID = p_clienteID;
END //
DELIMITER ;

-- Eliminar un cliente
CALL EliminarCliente(3);
select * from cliente;
