drop table detalle;
drop table boleta;
drop table producto;
drop table categoria;
drop table cliente;

create table producto(
    codigo_producto number not null,
    nombre varchar2(20),
    precio number,
    codigo_categoria number,
    stock number    
);
/
create table categoria(
    codigo_categoria number not null,
    nombre_categoria varchar2(20)
);
/
create table detalle(
    codigo_producto number not null,
    codigo_boleta number not null,
    cantidad number,
    precio_unitario number,
    total number
);
/
create table cliente(
    rut number not null,
    nombre varchar2(30),
    apellidos varchar2(50),
    correo varchar2(50),
    edad number
);
/
create table boleta(
    codigo_boleta number not null,
    rut number,
    fecha date,
    total number
);

/
alter table categoria add constraint pk_categoria primary key(codigo_categoria);
alter table producto add constraint pk_productos primary key(codigo_producto);
alter table detalle add constraint pk_detalle primary key(codigo_producto, codigo_boleta);
alter table cliente add constraint pk_cliente primary key(rut);
alter table boleta add constraint pk_boleta primary key(codigo_boleta);

alter table producto add constraint fk_producto foreign key(codigo_categoria) references categoria(codigo_categoria);
alter table detalle add constraint fk_detalle_1 foreign key(codigo_producto) references producto(codigo_producto);
alter table detalle add constraint fk_detalle_2 foreign key(codigo_boleta) references boleta(codigo_boleta);
alter table boleta add constraint fk_boleta foreign key(rut) references cliente(rut);

/

INSERT INTO CATEGORIA VALUES(1,'PORTABLES');
INSERT INTO CATEGORIA VALUES(2,'TECNOLOGIA');
INSERT INTO CATEGORIA VALUES(3,'AUDIO');
INSERT INTO CATEGORIA VALUES(4,'MONITORES');
INSERT INTO CATEGORIA VALUES(5,'ACCESORIOS');
INSERT INTO CATEGORIA VALUES(6,'TABLETS');

INSERT INTO PRODUCTO VALUES (1,'NOTEBOOK LENOVO',380000,1,20);
INSERT INTO PRODUCTO VALUES (2,'CELULAR MOTOROLA',110000,2,15);
INSERT INTO PRODUCTO VALUES (3,'AUDIFONOS MACROTEL',3500,3,12);
INSERT INTO PRODUCTO VALUES (4,'NOTEBOOK SAMSUNG',500000,1,3);
INSERT INTO PRODUCTO VALUES (5,'MONITOR 17" AOC',67990,4,80);
INSERT INTO PRODUCTO VALUES (6,'MONITOR 21" DELL',81990,4,20);
INSERT INTO PRODUCTO VALUES (7,'NOTEBOOK HP',280990,1,1);
INSERT INTO PRODUCTO VALUES (8,'CELULAR IPHONE 6S',560000,2,6);
INSERT INTO PRODUCTO VALUES (9,'CELULAR LG',450000,2,7);
INSERT INTO PRODUCTO VALUES (10,'MOUSE BLUETOOTH',28990,5,9);
INSERT INTO PRODUCTO VALUES (11,'MONITOR 17" SAMSUNG',150000,4,7);
INSERT INTO PRODUCTO VALUES (12,'MONITOR 17" LENOVO',250000,4,7);
INSERT INTO PRODUCTO VALUES (13,'MONITOR 17" LG',125000,4,4);
INSERT INTO PRODUCTO VALUES (14,'MONITOR 15" LENOVO',200000,4,3);
INSERT INTO PRODUCTO VALUES (15,'MOTO G 2013',130000,2,45);
INSERT INTO PRODUCTO VALUES (16,'MOTO G 2015',180000,2,32);
INSERT INTO PRODUCTO VALUES (17,'MOTO X PLAY',370000,2,12);
INSERT INTO PRODUCTO VALUES (18,'IPAD MINI 2',200000,6,4);
INSERT INTO PRODUCTO VALUES (19,'IPAD AIR',260000,6,2);
INSERT INTO PRODUCTO VALUES (20,'NOTEBOOK MSI',850000,1,4);
INSERT INTO PRODUCTO VALUES (21,'MOUSE MICROSOFT',8500,5,5);

INSERT INTO CLIENTE VALUES (145375682,'Alejandro','Sepulveda','alesepulveda@hotmail.com',39);
INSERT INTO CLIENTE VALUES (204821232,'Francisca','Perez','fran__xdperez2000@gmail.com',18);
INSERT INTO CLIENTE VALUES (185756203,'Felipe','Tapia','ftapia46@gmail.com',25);
INSERT INTO CLIENTE VALUES (85762340,'Camila','Fernandez','cfernandez@ucm.cl',58);
INSERT INTO CLIENTE VALUES (183447872,'Javiera','Faundez','javi_faundez94@gmail.com',24);
INSERT INTO CLIENTE VALUES (175682842,'Carlos','Hernandez','carlos_herna91@gmail.com',28);

INSERT INTO BOLETA VALUES (2,145375682,'14/08/2019',0);
INSERT INTO BOLETA VALUES (1,145375682,'12/07/2019',0);
INSERT INTO BOLETA VALUES (3,145375682,'17/08/2019',0);
INSERT INTO BOLETA VALUES (4,145375682,'24/08/2019',0);
INSERT INTO BOLETA VALUES (5,204821232,'12/08/2019',0);
INSERT INTO BOLETA VALUES (6,204821232,'16/08/2019',0);
INSERT INTO BOLETA VALUES (7,183447872,'02/09/2019',0);
INSERT INTO BOLETA VALUES (8,85762340,'10/09/2019',0);
INSERT INTO BOLETA VALUES (9,183447872,'16/09/2019',0);
INSERT INTO BOLETA VALUES (10,145375682,'20/09/2019',0);
INSERT INTO BOLETA VALUES (11,85762340,'01/10/2019',0);
INSERT INTO BOLETA VALUES (12,204821232,'11/10/2019',0);
INSERT INTO BOLETA VALUES (13,185756203,'12/10/2019',0);
INSERT INTO BOLETA VALUES (14,183447872,'05/11/2019',0);
INSERT INTO BOLETA VALUES (15,145375682,'08/11/2019',0);
INSERT INTO BOLETA VALUES (16,185756203,'12/12/2019',0);
INSERT INTO BOLETA VALUES (17,204821232,'12/12/2019',0);
INSERT INTO BOLETA VALUES (18,85762340,'21/12/2019',0);


INSERT INTO DETALLE VALUES(1,1,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 1), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 1)*1);  
INSERT INTO DETALLE VALUES(21,1,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 21), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 21)*1);  
INSERT INTO DETALLE VALUES(2,2,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 2), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 2)*1);                                                                
INSERT INTO DETALLE VALUES(6,3,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 6), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 6)*1);  
INSERT INTO DETALLE VALUES(3,4,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 3), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 3)*1); 
INSERT INTO DETALLE VALUES(17,5,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 17), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 17)*1); 
INSERT INTO DETALLE VALUES(17,6,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 17), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 17)*1); 
INSERT INTO DETALLE VALUES(19,7,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 19), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 19)*1);
INSERT INTO DETALLE VALUES(21,8,2,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 21), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 21)*2);                                                                
INSERT INTO DETALLE VALUES(2,9,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 2), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 2)*1); 
INSERT INTO DETALLE VALUES(8,10,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 8), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 8)*1);                                                                
INSERT INTO DETALLE VALUES(3,11,2,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 3), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 3)*2);   
INSERT INTO DETALLE VALUES(7,12,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 7), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 7)*1); 
INSERT INTO DETALLE VALUES(19,13,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 19), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 19)*1);       
INSERT INTO DETALLE VALUES(20,13,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 20), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 20)*1);   
INSERT INTO DETALLE VALUES(21,13,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 21), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 21)*1);   
INSERT INTO DETALLE VALUES(6,13,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 6), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 6)*1);
INSERT INTO DETALLE VALUES(2,14,3,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 2), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 2)*3);
INSERT INTO DETALLE VALUES(5,14,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 5), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 5)*1);     
INSERT INTO DETALLE VALUES(10,15,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 10), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 10)*1);                                                                    
INSERT INTO DETALLE VALUES(9,15,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 9), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 9)*1);                                                              
INSERT INTO DETALLE VALUES(10,16,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 10), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 10)*1);       
INSERT INTO DETALLE VALUES(15,17,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 15), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 15)*1);  
INSERT INTO DETALLE VALUES(20,18,1,(SELECT PRECIO
                                  FROM PRODUCTO
                                  WHERE CODIGO_PRODUCTO = 20), (SELECT PRECIO
                                                               FROM PRODUCTO
                                                               WHERE CODIGO_PRODUCTO = 20)*1);                                                                    
-------------------------> SOLO EJECUTAR UNA VEZ <-------------------------------
UPDATE BOLETA B
SET B.TOTAL = (SELECT SUM(D.TOTAL) FROM DETALLE D WHERE D.CODIGO_BOLETA = B.CODIGO_BOLETA);

--------------------> CONSULTA DE COMPROBACI�N <---------------------------------
-- SI LOS VALORES ENTRE TOTAL Y TOTAL_DETALLE SON IGUALES, TODO SALI� BIEN
SELECT B.RUT, B.TOTAL AS TOTAL, SUM(D.TOTAL) AS TOTAL_DETALLE FROM BOLETA B JOIN DETALLE D
ON B.CODIGO_BOLETA = D.CODIGO_BOLETA
GROUP BY B.RUT, B.TOTAL;

	

------------------------> SECCI�N DE CONSULTAS CON JOIN Y AGRUPACION <--------------------------

--CONSULTA 1
--OBTENER LA SUMA DE TODAS LAS VENTAS DE LA TABLA BOLETA (TOTAL)
SELECT SUM(TOTAL)
FROM BOLETA;

--CONSULTA 2
--OBTENER EL PROMEDIO DE EDAD DE LOS CLIENTES
SELECT AVG(EDAD)
FROM CLIENTE;

--CONSULTA 3
--OBTENER EL CONTEO DE PRODUCTOS DE LA TABLA PRODUCTO
SELECT COUNT(CODIGO_PRODUCTO)
FROM PRODUCTO;

--CONSULTA 4
--OBTENER DE LAS TABLAS PRODUCTO Y CATEGORIA (UTILIZACI�N DE JOIN EXPL�CITO)
--MOSTRAR EL CODIGO, NOMBRE Y PRECIO DE LA TABLA PRODUCTO
--MOSTRAR EL NOMBRE DE LA CATEGORIA DEL PRODUCTO
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, P.PRECIO, C.NOMBRE_CATEGORIA
FROM PRODUCTO P JOIN CATEGORIA C
ON P.CODIGO_CATEGORIA = C.CODIGO_CATEGORIA;

--CONSULTA 5
--REALIZA LA MISMA CONSULTA ANTERIOR UTILIZANDO JOIN IMPL�CITO
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, P.PRECIO, C.NOMBRE_CATEGORIA
FROM PRODUCTO P, CATEGORIA C
WHERE P.CODIGO_CATEGORIA = C.CODIGO_CATEGORIA;

--CONSULTA 6
--REALICE LA CONSULTA 4 UTILIZANDO NATURAL JOIN
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, P.PRECIO, C.NOMBRE_CATEGORIA
FROM PRODUCTO P NATURAL JOIN CATEGORIA C;

--CONSULTA 7
--SE QUIERE SABER INFORMACI�N DEL CLIENTE ASOCIADO A CADA CODIGO DE BOLETA
--MUESTRE EL RUT, NOMBRE DEL CLIENTE ADEM�S DEL CODIGO DE BOLETA Y EL TOTAL DE LA BOLETA ASOCIADO
SELECT C.RUT, C.NOMBRE, B.CODIGO_BOLETA, B.TOTAL
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT;

SELECT C.RUT, C.NOMBRE, B.CODIGO_BOLETA, B.TOTAL
FROM CLIENTE C, BOLETA B
WHERE C.RUT = B.RUT;

--CONSULTA 8
--AGREGUE A LA CONSULTA ANTERIOR LA INSTRUCCI�N ORDER BY
--ORDENE EL RESULTADO EN FUNCI�N AL TOTAL, EN FORMA DESCENDENTE
SELECT C.RUT, C.NOMBRE, B.CODIGO_BOLETA, B.TOTAL
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT
ORDER BY B.TOTAL DESC;

--CONSULTA 9
--SE DESEAN SABER LOS CODIGOS DE BOLETA CORRESPONDIENTES AL MES DE AGOSTO
SELECT CODIGO_BOLETA
FROM BOLETA
WHERE EXTRACT(MONTH FROM FECHA) = 08;

--CONSULTA 10
--MUESTRE TODOS LOS CLIENTES QUE COMPRARON PRODUCTOS ENTRE AGOSTO Y OCTUBRE
--DEBE MOSTRAR RUT, NOMBRE Y FECHA (UTILICE JOIN EXPL�CITO)
SELECT C.RUT, C.NOMBRE, B.FECHA
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT
WHERE EXTRACT(MONTH FROM FECHA) BETWEEN 08 AND 10;

--CONSULTA 11
--MUESTRE LA CANTIDAD DE VECES QUE SE HA COMPRADO UN PRODUCTO
--DEBE MOSTRAR EL CODIGO Y NOMBRE DEL PRODUCTO Y LA CANTIDAD DE VECES QUE SE COMPR�
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, SUM(D.CANTIDAD)
FROM PRODUCTO P JOIN DETALLE D
ON P.CODIGO_PRODUCTO = D.CODIGO_PRODUCTO
GROUP BY P.CODIGO_PRODUCTO, P.NOMBRE;

--CONSULTA 12 (BELICA)
--AGREGAR A LA CONSULTA ANTERIOR, QUE MUESTRE SOLAMENTE LA INFORMACI�N PARA
--LOS PRODUCTOS CUYA CATEGORIA TERMINE CON LA LETRA "A" U "O"
--ORDENAR POR CANTIDAD DE PRODUCTO COMPRADO EN FORMA DESCENDENTE
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, SUM(D.CANTIDAD) AS CANTIDAD
FROM PRODUCTO P JOIN DETALLE D
ON P.CODIGO_PRODUCTO = D.CODIGO_PRODUCTO
JOIN CATEGORIA C
ON P.CODIGO_CATEGORIA = C.CODIGO_CATEGORIA
WHERE C.NOMBRE_CATEGORIA LIKE '%A' OR C.NOMBRE_CATEGORIA LIKE '%O'
GROUP BY P.CODIGO_PRODUCTO, P.NOMBRE
ORDER BY CANTIDAD DESC;

--CONSULTA 13 - UN PRODUCTO DE LA CONSULTA ANTERIOR NO SE MUESTRA
--UTILICE UN LEFT OUTER O RIGHT OUTER JOIN PARA MOSTRAR EL PRODUCTO QUE NO HA SIDO COMPRADO NINGUNA VEZ
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, SUM(D.CANTIDAD) AS CANTIDAD
FROM PRODUCTO P LEFT OUTER JOIN DETALLE D
ON P.CODIGO_PRODUCTO = D.CODIGO_PRODUCTO
JOIN CATEGORIA C
ON P.CODIGO_CATEGORIA = C.CODIGO_CATEGORIA
WHERE C.NOMBRE_CATEGORIA LIKE '%A' OR C.NOMBRE_CATEGORIA LIKE '%O'
GROUP BY P.CODIGO_PRODUCTO, P.NOMBRE
ORDER BY CANTIDAD DESC;

--CONSULTA 14
--MUESTRE EL STOCK DISPONIBLE Y LA CANTIDAD DE PRODUCTOS POR CADA CATEGORIA
SELECT C.NOMBRE_CATEGORIA, SUM(P.STOCK) AS STOCK, COUNT(P.NOMBRE) AS CANTIDAD
FROM CATEGORIA C JOIN PRODUCTO P
ON C.CODIGO_CATEGORIA = P.CODIGO_CATEGORIA
GROUP BY C.NOMBRE_CATEGORIA;

--CONSULTA 15
--MUESTRE LA CANTIDAD DE PRODUCTOS VENDIDOS Y EL TOTAL DE VENTAS POR CADA MES
--EL MES DEBE MOSTRARSE POR NOMBRE
--ORDENE LOS RESULTADOS ALFABETICAMENTE POR MES
SELECT TO_CHAR(B.FECHA,'MONTH') AS MES, SUM(D.CANTIDAD), SUM(B.TOTAL)
FROM BOLETA B JOIN DETALLE D
ON B.CODIGO_BOLETA = D.CODIGO_BOLETA
GROUP BY TO_CHAR(B.FECHA,'MONTH')
ORDER BY MES;

--CONSULTA 16
--MUESTRE LA CANTIDAD DE PRODUCTOS QUE COMPRO FRANCISCA, CAMILA Y JAVIERA
--MUESTRE EL NOMBRE DEL CLIENTE
SELECT C.NOMBRE, SUM(D.CANTIDAD) AS CANTIDAD
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT
JOIN DETALLE D
ON D.CODIGO_BOLETA = B.CODIGO_BOLETA
WHERE UPPER(C.NOMBRE) IN ('FRANCISCA','CAMILA','JAVIERA')
GROUP BY C.NOMBRE;

--CONSULTA 17
--MUESTRE LA CANTIDAD DE COMPRAS QUE HA REALIZADO CADA CLIENTE
--MUESTRE EL NOMBRE DEL CLIENTE
--ORDENAR A CADA CLIENTE POR LA CANTIDAD DE COMPRAS QUE REALIZ� EN FORMA DESCENDENTE
SELECT C.NOMBRE, COUNT(B.CODIGO_BOLETA) AS CANTIDAD_COMPRAS
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT
GROUP BY C.NOMBRE
ORDER BY CANTIDAD_COMPRAS DESC;

--CONSULTA 18
--MUESTRE LOS PRODUCTOS PERTENECIENTES A CADA BOLETA
--MUESTRE EL CODIGO_BOLETA, CODIGO_PRODUCTO, NOMBRE_PRODUCTO, CANTIDAD DE PRODUCTOS
--ORDENAR POR CODIGO DE BOLETA EN FORMA ASCENDENTE
SELECT B.CODIGO_BOLETA, P.CODIGO_PRODUCTO, P.NOMBRE, D.CANTIDAD
FROM BOLETA B JOIN DETALLE D
ON B.CODIGO_BOLETA = D.CODIGO_BOLETA
JOIN PRODUCTO P 
ON P.CODIGO_PRODUCTO = D.CODIGO_PRODUCTO
ORDER BY B.CODIGO_BOLETA;

--CONSULTA 19 (BELICA)
--MUESTRE LOS PRODUCTOS QUE FUERON COMPRADOS ENTRE EL 12 DE AGOSTO Y EL 08 DE NOVIEMBRE Y QUE LA CANTIDAD SEA MAYOR O IGUAL A 2
--EN LA CONSULTA SE DEBE MOSTRAR EL RUT Y NOMBRE DEL CLIENTE QUE COMPR� LOS PRODUCTOS
--LA FECHA DE LA BOLETA
--CODIGO, NOMBRE, PRECIO, CANTIDAD Y TOTAL DE LOS PRODUCTOS
--NOMBRE DE LA CATEGORIA DEL PRODUCTO
SELECT C.RUT, C.NOMBRE, B.FECHA, P.CODIGO_PRODUCTO,
P.NOMBRE,P.PRECIO,D.CANTIDAD,D.TOTAL,C.NOMBRE_CATEGORIA
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT JOIN DETALLE D
ON B.CODIGO_BOLETA = D.CODIGO_BOLETA JOIN PRODUCTO P
ON D.CODIGO_PRODUCTO = P.CODIGO_PRODUCTO JOIN CATEGORIA C
ON C.CODIGO_CATEGORIA = P.CODIGO_CATEGORIA
WHERE B.FECHA BETWEEN '12/08/2019' AND '08/11/2019'
AND D.CANTIDAD >= 2;

CREATE VIEW PRODUCTOS_FILTRO AS
SELECT C.RUT AS CLIENTE, C.NOMBRE AS NOMBRE_CLIENTE, 
B.FECHA AS FECHA_BOLETA, P.CODIGO_PRODUCTO AS PRODUCTO,
P.NOMBRE AS NOMBRE_PRODUCTO, P.PRECIO AS PRECIO_PRODUCTO,
D.CANTIDAD AS CANTIDAD_ADQUIRIDO, D.TOTAL AS TOTAL_DETALLE,
C.NOMBRE_CATEGORIA AS CATEGORIA
FROM CLIENTE C JOIN BOLETA B
ON C.RUT = B.RUT JOIN DETALLE D
ON B.CODIGO_BOLETA = D.CODIGO_BOLETA JOIN PRODUCTO P
ON D.CODIGO_PRODUCTO = P.CODIGO_PRODUCTO JOIN CATEGORIA C
ON C.CODIGO_CATEGORIA = P.CODIGO_CATEGORIA
WHERE B.FECHA BETWEEN '12/08/2019' AND '08/11/2019'
AND D.CANTIDAD >= 2;

SELECT * FROM PRODUCTOS_FILTRO;

--CONSULTA 20 
--CONSIDERE QUE EN LA TABLA PRODUCTO EST� EL INVENTARIO RESTANTE DE LA "TIENDA"
--MUESTRE LA CANTIDAD TOTAL DE DINERO QUE REPRESENTA EL INVENTARIO DE LA TIENDA
SELECT SUM(PRECIO*STOCK) AS TOTAL_INVENTARIO
FROM PRODUCTO;

DECLARE
    J NUMBER;
BEGIN
    FOR J IN 0..5 LOOP
        DBMS_OUTPUT.PUT_LINE('HOLA');
    END LOOP;
END;

DECLARE
    J NUMBER;
    DETENER BOOLEAN;
BEGIN
    DETENER := FALSE;
    J := 0;
    WHILE DETENER <> TRUE LOOP
        DBMS_OUTPUT.PUT_LINE ('HOLA');
        IF J = 5 THEN
            DETENER := TRUE;
        ELSE
            J := J + 1;
        END IF;
    END LOOP;
END;

DECLARE
    CONTADOR NUMBER;
    RUT_CONSULTAR NUMBER := 185756203;
BEGIN
    SELECT COUNT(RUT) INTO CONTADOR
    FROM CLIENTE WHERE RUT = RUT_CONSULTAR;
    DBMS_OUTPUT.PUT_LINE('EL CONTADOR ES IGUAL A: '||CONTADOR);
    IF CONTADOR > 0 THEN
        DBMS_OUTPUT.PUT_LINE('EL USUARIO CON RUT '||RUT_CONSULTAR||' EXISTE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('EL USUARIO CON RUT '||RUT_CONSULTAR||' NO EXISTE');
    END IF;
END;

SET SERVEROUTPUT ON;
