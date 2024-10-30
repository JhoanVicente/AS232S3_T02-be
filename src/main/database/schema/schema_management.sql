--* CREACIÓN DE ESQUEMAS
---------------------------------------------------------------------------------------------------
-- MAESTRO 1 --- JHOAN VICENTE
CREATE SCHEMA users AUTHORIZATION dbo;  -- Crea un esquema llamado 'users' con autorización del propietario 'dbo'.
GO

-- MAESTRO 2 --- ANGIE CHACON
CREATE SCHEMA product AUTHORIZATION dbo;  -- Crea un esquema llamado 'product' con autorización del propietario 'dbo'.
GO

--* TRANFERENCIA DE ESQUEMAS
-- MAESTRO 1 --- JHOAN VICENTE
ALTER SCHEMA users TRANSFER dbo.user_restaurant;  -- Transfiere la tabla 'user_restaurant' al esquema 'users'.
GO

ALTER SCHEMA users TRANSFER dbo.type_user;  -- Transfiere la tabla 'type_user' al esquema 'users'.
GO

-- MAESTRO 2 --- ANGIE CHACON
ALTER SCHEMA product TRANSFER dbo.category;  -- Transfiere la tabla 'category' al esquema 'product'.
GO

ALTER SCHEMA product TRANSFER dbo.detail_product;  -- Transfiere la tabla 'detail_product' al esquema 'product'.
GO

ALTER SCHEMA product TRANSFER dbo.product;  -- Transfiere la tabla 'product' al esquema 'product'.
GO
---------------------------------------------------------------------------------------------------

--* ELIMINACIÓN DE ESQUEMAS
DROP SCHEMA users;  -- Elimina el esquema 'users' y todas las tablas que contiene (si no hay restricciones).
-- Nota: Este comando puede fallar si hay tablas o relaciones que dependen del esquema.

--* CONSULTAS DE ESQUEMAS
-- Ver todos los esquemas en la base de datos
SELECT schema_name FROM information_schema.schemata;  -- Consulta para mostrar todos los esquemas existentes en la base de datos.
GO

-- Ver las tablas en un esquema específico
SELECT table_name FROM information_schema.tables WHERE table_schema = 'user';  -- Consulta para mostrar todas las tablas en el esquema 'user'.