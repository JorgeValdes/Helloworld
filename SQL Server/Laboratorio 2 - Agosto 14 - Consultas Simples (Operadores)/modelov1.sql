--drop table detalle;
--drop table boleta;
--drop table producto;
--drop table cliente;

create table producto(
    codigoproducto number not null,
    nombre varchar2(29),
    precio number,
    categoria varchar2(20)
);
/
create table detalle(
    codigoproducto number not null,
    codigoboleta number not null,
    cantidad number,
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
    codigoboleta number not null,
    rut number,
    fecha date,
    total number
);
/
alter table producto add constraint pk_productos primary key(codigoproducto);
alter table detalle add constraint pk_detalle primary key(codigoproducto, codigoboleta);
alter table cliente add constraint pk_cliente primary key(rut);
alter table boleta add constraint pk_boleta primary key(codigoboleta);

alter table detalle add constraint fk_detalle_1 foreign key(codigoproducto) references producto(codigoproducto);
alter table detalle add constraint fk_detalle_2 foreign key(codigoboleta) references boleta(codigoboleta);
alter table boleta add constraint fk_boleta foreign key(rut) references cliente(rut);

/

INSERT INTO PRODUCTO VALUES (1,'NOTEBOOK LENOVO',380000,'PORTABLES');
INSERT INTO PRODUCTO VALUES (2,'CELULAR MOTOROLA',110000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (3,'AUDIFONOS MACROTEL',3500,'AUDIO');
INSERT INTO PRODUCTO VALUES (4,'NOTEBOOK SAMSUNG',500000,'PORTABLES');
INSERT INTO PRODUCTO VALUES (5,'MONITOR 17" AOC',67990,'MONITORES');
INSERT INTO PRODUCTO VALUES (6,'MONITOR 21" DELL',81990,'MONITORES');
INSERT INTO PRODUCTO VALUES (7,'NOTEBOOK HP',280990,'PORTABLES');
INSERT INTO PRODUCTO VALUES (8,'CELULAR IPHONE 6S',560000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (9,'CELULAR LG',450000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (10,'MOUSE BLUETOOTH',28990,'ACCESORIOS');
INSERT INTO PRODUCTO VALUES (11,'MONITOR 17" SAMSUNG',150000,'MONITORES');
INSERT INTO PRODUCTO VALUES (12,'MONITOR 17" LENOVO',250000,'MONITORES');
INSERT INTO PRODUCTO VALUES (13,'MONITOR 17" LG',125000,'MONITORES');
INSERT INTO PRODUCTO VALUES (14,'MONITOR 15" LENOVO',200000,'MONITORES');
INSERT INTO PRODUCTO VALUES (15,'MOTO G 2013',130000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (16,'MOTO G 2015',180000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (17,'MOTO X PLAY',370000,'TECNOLOGIA');
INSERT INTO PRODUCTO VALUES (18,'IPAD MINI 2',200000,'TABLETS');
INSERT INTO PRODUCTO VALUES (19,'IPAD AIR',260000,'TABLETS');
INSERT INTO PRODUCTO VALUES (20,'NOTEBOOK MSI',850000,'PORTABLES');
INSERT INTO PRODUCTO VALUES (21,'MOUSE MICROSOFT',8500,'ACCESORIOS');

INSERT INTO CLIENTE VALUES (145375682,'Alejandro','Sepulveda','alesepulveda@hotmail.com',39);
INSERT INTO CLIENTE VALUES (204821232,'Francisca','Perez','fran__xdperez2000@gmail.com',18);
INSERT INTO CLIENTE VALUES (185756203,'Felipe','Tapia','ftapia46@gmail.com',25);
INSERT INTO CLIENTE VALUES (85762340,'Camila','Fernandez','cfernandez@ucm.cl',58);
INSERT INTO CLIENTE VALUES (183447872,'Javiera','Faundez','javi_faundez94@gmail.com',24);

--CONSULTA 1
--AUMENTAR EL PRECIO DE LOS PRODUCTOS EN UN 15% PARA LA CATEGOR�A 'TABLETS'


--CONSULTA 2
--MOSTRAR EL NOMBRE Y APELLIDO DE LOS CLIENTES CONCATENADO COMO SI FUERA UN SOLO ATRIBUTO
--EJEMPLO: ALEJANDRO SEPULVEDA


--CONSULTA 3
--MOSTRAR LOS NOMBRES DE LOS CLIENTES EN MAY�SCULA


--CONSULTA 4
--SUPONGA QUE SE HACE UN DESCUENTO A LOS PRODUCTOS CON CATEGORIA 'TECNOLOGIA'
--MUESTRE EL NOMBRE Y PRECIO DE AQUELLOS PRODUCTOS APLICANDO 25% DE DESCUENTO AL PRECIO


--CONSULTA 5
--MUESTRE LOS CLIENTES MENCIONANDO NOMBRE, APELLIDOS Y EDAD DONDE
--EL LARGO DEL NOMBRE SEA IGUAL A 6


--CONSULTA 6
--MUESTRE EL NOMBRE Y CORREO DEL CLIENTE REALIZANDO LA SIGUIENTE MODIFICACI�N
--SI EL CORREO DICE UCM.CL, AHORA DEBE DECIR GMAIL.COM



--CONSULTA 7
--REALICE UNA CONSULTA QUE AGREGUE EL GUION (-) ANTES DEL �LTIMO N�MERO DE CADA RUT



--CONSULTA 8
--MUESTRE EL NOMBRE Y EDAD DE LOS CLIENTES QUE POSEAN UNA EDAD MENOR A 20 A�OS


--CONSULTA 9
--MUESTRE EL CODIGOPRODUCTO, NOMBRE Y CATEGORIA DEL PRODUCTO QUE POSEA C�DIGO 1 Y CATEGOR�A PORTABLES



--CONSULTA 10
--MUESTRA EL CODIGOPRODUCTO, NOMBRE Y CATEGORIA DEL PRODUCTO CUYA CATEGOR�A SEA PORTABLES Y TECNOLOGIA



--CONSULTA 11
--MUESTRE EL CODIGOPRODUCTO, NOMBRE, PRECIO Y CATEGORIA DE LOS PRODUCTOS 2,5,6,12,18,20 UTILIZANDO EL OPERADOR 'OR'



--CONSULTA 12
--REALICE LA MISMA CONSULTA ANTERIOR, PERO UTILIZANDO EL OPERADOR 'IN'



--CONSULTA 13
--OBTENGA EL NOMBRE, PRECIO Y CATEGORIA DE LOS PRODUCTOS CUYO PRECIO SEA MAYOR A 300000 O SU CATEGORIA SEA 'AUDIO'



--CONSULTA 14
--OBTENGA EL NOMBRE, PRECIO Y CATEGORIA DE LOS PRODUCTOS CUYO PRECIO SE ENCUENTRA ENTRE 50000 Y 100000 O CATEGORIA SEA IGUAL A 'AUDIO' O 
--EN EL NOMBRE DEL PRODUCTO DIGA 'MICROSOFT'



--CONSULTA 15
--OBTENGA RUT,NOMBRE Y APELLIDO DEL USUARIO CUYO DIGITO VERIFICADOR ES IGUAL A 3



--CONSULTA 16
--OBTENGA TODOS LOS PRODUCTOS DONDE EN EL NOMBRE APAREZCA 17"



--CONSULTA 17
--OBTENGA TODOS LOS PRODUCTOS QUE SEAN SAMSUNG O MOTOROLA



--CONSULTA 18
--OBTENGA SOLO LOS PRODUCTOS QUE NO SEAN SAMSUNG



--CONSULTA 19
--OBTENGA LOS PRODUCTOS DONDE SU CATEGORIA FINALICE CON LAS LETRAS 'ES'



--CONSULTA 20
--OBTENGA LOS PRODUCTOS QUE TENGAN UN PRECIO DE 200000 Y ADEM�S SEAN DE CATEGOR�A TABLETS



--CONSULTA 21
--OBTENGA LOS PRODUCTOS QUE SEAN NOTEBOOKS O SEAN DE LA MARCA SAMSUNG



--CONSULTA 22
--OBTENGA NOMBRE Y EL A�O DE NACIMIENTO ESTIMADO DE CADA CLIENTE CONSIDERANDO SU EDAD



--CONSULTA 23
--OBTENGA TODOS LOS PRODUCTOS QUE CON UN 75% DE DESCUENTO CUESTEN MENOS DE 50000 (DEBE MOSTRAR EL PRECIO ORIGINAL Y EL PRECIO CON EL 75% DE DESCUENTO PARA VERIFICAR)



--CONSULTA 24
--MUESTRE EL NOMBRE Y PRECIO DE LOS PRODUCTOS CUYA CODIGO DE PRODUCTO ES MAYOR A 4 Y MENOR A 14



--CONSULTA 25
--REALICE LA MISMA CONSULTA ANTERIOR CON BETWEEN (SI YA LO HIZO CON BETWEEN, H�GALO CON 'AND') PARA QUE ENTREGUE EL MISMO RESULTADO



--CONSULTA 26
--REALICE LA CONSULTA 24 PERO AHORA UTILIZANDO SOLAMENTE EL OPERADOR 'OR' PARA QUE ENTREGUE EL MISMO RESULTADO



--CONSULTA 27 (ESTO SE PONE A�N MEJOR)
--REALICE LA CONSULTA 24 PERO UTILIZANDO EL OPERADOR 'IN' PARA QUE ENTREGUE EL MISMO RESULTADO



--CONSULTA 28 (TODAV�A PUEDE SER MEJOR)
--REALICE LA CONSULTA 24 UTILIZANDO EL OPERADOR EN CONJUNTO 'NOT IN' PARA QUE ENTREGUE EL MISMO RESULTADO



--CONSULTA 29 (PORFAVOR DETENTE, NO PUEDE SEGUIR O S�?)
--REALICE LA CONSULTA 24 UTILIZANDO 'NOT BETWEEN' PARA QUE ENTREGUE EL MISMO RESULTADO



--CONSULTA 30 (HAY M�S CONSULTAS EQUIVALENTES DE DONDE SALIERON LAS ANTERIORES)
--MODIFIQUE LA CONSULTA 24 PARA QUE FUNCIONE CON EL OPERADOR 'NOT' PARA QUE ENTREGUE EL MISMO RESULTADO


