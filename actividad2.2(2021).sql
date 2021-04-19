--1)
SELECT Clientes.RazonSocial,Clientes.CUIT, TiposCliente.Nombre FROM Clientes
INNER JOIN tiposcliente
ON Clientes.IDTipo=TiposCliente.ID
GO

--2)
SELECT CL.RazonSocial, CL.CUIT, CI.Nombre AS CIUDAD, P.Nombre AS PAIS  FROM Clientes AS CL
INNER JOIN Ciudades AS CI
ON CL.IDCiudad= CI.ID
INNER JOIN Paises AS P 
ON CI.IDPais= P.ID
GO

--3)
SELECT CL.RazonSocial, CL.CUIT, CI.Nombre, P.Nombre AS PAIS FROM Clientes AS CL
LEFT JOIN Ciudades AS CI
ON CL.IDCiudad= CI.ID
LEFT JOIN Paises AS P
ON CI.IDPais=P.ID
GO

--4)
SELECT RazonSocial,CUIT,CI.Nombre AS CIUDADES,P.Nombre AS PAISES FROM Clientes
RIGHT JOIN Ciudades AS CI
ON CI.ID= Clientes.IDCiudad
RIGHT JOIN PAISES AS P
ON CI.IDPais=P.ID
GO

--5)
SELECT CI.Nombre AS CIUDADES, CL.IDCiudad AS CLIENTE FROM Ciudades AS CI
LEFT JOIN Clientes AS CL
ON CI.ID=CL.IDCiudad
WHERE CL.ID IS NULL
GO

--6)
SELECT PR.Nombre AS Proyecto, PR.CostoEstimado, CL.RazonSocial, TIPOC.Nombre AS 'Tipo de Cliente', CI.NOMBRE AS Ciudad FROM PROYECTOS AS PR
INNER JOIN CLIENTES AS CL 
ON PR.IDCliente= CL.ID
INNER JOIN TiposCliente AS TIPOC
ON TIPOC.ID= CL.IDTipo
LEFT JOIN Ciudades AS CI
ON CI.ID= CL.IDCiudad
WHERE TIPOC.Nombre='Extranjero' OR TIPOC.Nombre='Unicornio'
GO