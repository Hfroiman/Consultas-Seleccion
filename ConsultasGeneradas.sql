-- Apellido, nombres y fecha de ingreso de todos los agentes

SELECT Apellidos, Nombres, FechaIngreso from Agentes

-- Apellido, nombres y antigüedad de todos los agentes

SELECT Apellidos, Nombres, DATEDIFF(YEAR ,FechaIngreso , getdate()) as Antiguedad from Agentes

-- Apellido y nombres de aquellos colaboradores que no estén activos.

SELECT Apellidos, Nombres from Agentes where Activo=0

-- Apellido y nombres y antigüedad de aquellos colaboradores cuyo sueldo sea entre 50000 y 100000.
-- Nose se corrobora los datos solicitados

-- Apellidos y nombres y edad de los colaboradores con legajos A001, A005 y A015

SELECT Apellidos,  Nombres, FechaNacimiento, DATEDIFF(year, 0, GETDATE()- CAST(FechaNacimiento as datetime)) Edad from Agentes where Legajo in ('A001','A005','A015')

-- Todos los datos de todas las multas ordenadas por monto de forma descendente.

SELECT * FROM Multas order by Monto desc

-- Todos los datos de las multas realizadas en el mes 02 de 2023.

SELECT * FROM Multas where YEAR(FechaHora)=2023 and MONTH(FechaHora)=02

-- Todos los datos de todas las multas que hayan superado el monto de $20000.

SELECT * from Multas WHERE Monto>20000

-- Apellido y nombres de los agentes que no hayan registrado teléfono.

SELECT Apellidos, Nombres from Agentes where Telefono is null

-- Apellido y nombres de los agentes que hayan registrado mail pero no teléfono.

SELECT Apellidos, Nombres from Agentes where Email is not null and Telefono is null

-- Apellidos, nombres y datos de contacto de todos los agentes.
-- Nota: En datos de contacto debe figurar el número de celular, si no tiene celular el número de teléfono fijo y si no tiene este último el mail. En caso de no tener ninguno de los tres debe figurar 'Incontactable'.

SELECT Apellidos, Nombres, ISNULL (celular, ISNULL(Telefono, isnull(Email, 'Incontactable'))) Contacto from Agentes

-- Apellidos, nombres y medio de contacto de todos los agentes. Si tiene celular debe figurar 'Celular'. Si no tiene celular pero tiene teléfono fijo debe figurar 'Teléfono fijo' de lo contrario y si tiene Mail debe figurar 'Email'. Si no posee ninguno de los tres debe figurar NULL.

SELECT Apellidos, Nombres, case when Telefono is not null then 'TelefonoFijo'when Email is not null then 'Email' ELSE 'NULL' end as MedioContacto from Agentes

--Todos los datos de los agentes que hayan nacido luego del año 2000

SELECT * from Agentes where year(FechaNacimiento)>2000

--Todos los datos de los agentes que hayan nacido entre los meses de Enero y Julio (inclusive)

SELECT * from Agentes where MONTH(FechaNacimiento) BETWEEN 01 and 07

--Todos los datos de los agentes cuyo apellido finalice con vocal

SELECT * from Agentes where Apellidos LIKE '%[aeiou]'

--Todos los datos de los agentes cuyo nombre comience con 'A' y contenga al menos otra 'A'. Por ejemplo, Ana, Anatasia, Aaron, etc

SELECT * FROM Agentes where Nombres LIKE '[c]%a%'

-- Todos los agentes que tengan más de 10 años de antigüedad

SELECT * FROM Agentes where DATEDIFF(YEAR,FechaIngreso,GETDATE())<10

-- Las patentes, sin repetir, que hayan registrado multas

SELECT distinct Patente from Multas

-- Todos los datos de todas las multas labradas en el mes de marzo de 2023 con un recargo del 25% en una columna llamada NuevoImporte.

SELECT *, Monto+(Monto*0.25) as NuevoImporte from Multas where MONTH(FechaHora)=3 AND YEAR(FechaHora)=2023

-- Todos los datos de todos los colaboradores ordenados por apellido ascendentemente en primera instancia y por nombre descendentemente en segunda instancia.

SELECT * FROM Agentes order BY Apellidos ASC, Nombres DESC