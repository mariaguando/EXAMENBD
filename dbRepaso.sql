CREATE DATABASE dbRepaso;
use dbRepaso;

CREATE TABLE PRODUCTO
(
	CODPRO char (3) primary key,
	NOMPRO varchar (60),
	TIPPRO char  (1),
	VOLPRO char (3),
	PAIPRO char (1),
	PREPRO decimal (8,2),
	STOPRO int,
	ESTPRO char (1)  default 'A'
);
ALTER TABLE PRODUCTO
ADD CONSTRAINT CODIGO_FORMATO CHECK (CODPRO LIKE 'P[0-9][0-9]' );

ALTER TABLE PRODUCTO
ADD CONSTRAINT TIPO_PRODUCTO CHECK (TIPPRO='V' OR TIPPRO='P' OR TIPPRO='T' OR TIPPRO='W');
ALTER TABLE PRODUCTO
ADD CONSTRAINT VOLUMEN_FORMATO CHECK (VOLPRO='250' OR VOLPRO='500' OR VOLPRO='750');
ALTER TABLE PRODUCTO
ADD CONSTRAINT TIPO_PAIS CHECK (PAIPRO='P' OR PAIPRO='C' OR PAIPRO='A' OR PAIPRO='E' OR PAIPRO='M');
ALTER TABLE PRODUCTO 
ADD CONSTRAINT TIPO_ESTADO CHECK (ESTPRO='A' OR ESTPRO='I')
insert into PRODUCTO 
(CODPRO,NOMPRO,TIPPRO,VOLPRO,PAIPRO,PREPRO,STOPRO,ESTPRO)
VALUES
('P01','Ramos pinto porto','V','750','P',119,60,'I');

DELETE FROM PRODUCTO;
SELECT * FROM PRODUCTO;

--El identificador de la venta es autoincrementable
--Las fecha y hora de venta son capturadas del mismo servidor local de la base de datos.
--Los tipos de pago sólo pueden ser: E (Efectivo), T (Tarjeta), Y (Yape) y P (Plin).
--Los tipos de entrega sólo pueden ser: D (Delivery) y T (Tienda).
--Los tipos de estado de venta sólo pueden ser: A (Activo) e I (Inactivo), por default es A.--

CREATE TABLE VENTAS
(
	IDVEN int  NOT NULL IDENTITY(1, 1),
	FECVEN DATE,
	NOMVEN varchar (60),
	NOMCLI varchar (60),
	TIPPAGVEN char (1),
	TIPENTVENT char (1),
	ESTVEN char (1)  default 'A'
);

ALTER TABLE VENTAS
ADD CONSTRAINT TIPO_PAGO CHECK (TIPPAGVEN='E' OR TIPPAGVEN='T' OR TIPPAGVEN='Y' OR TIPPAGVEN='P');
ALTER TABLE VENTAS
ADD CONSTRAINT TIPO_ENTREGA CHECK (TIPENTVENT='D' OR TIPENTVENT='T');
ALTER TABLE VENTAS
ADD CONSTRAINT ESTADO_VENTA CHECK (ESTVEN='A' OR ESTVEN='I');

INSERT INTO VENTAS 
(FECVEN,NOMVEN,NOMCLI,TIPPAGVEN,TIPENTVENT,ESTVEN)
VALUES
('09-Nov-2022','Vaquez Carranza Adriana','Rosales Zegarra Fabricio','T','T','I');


SELECT * FROM VENTAS
DELETE FROM VENTAS;