-- MAESTRO 1 --- JHOAN VICENTE
CREATE TYPE name_v FROM VARCHAR(90) NOT NULL;  -- Tipo para nombres (hasta 90 caracteres)
GO
CREATE TYPE typestatus_i FROM INT NOT NULL;    -- Tipo para estados (números enteros)
GO
CREATE TYPE userid_i FROM INT NOT NULL;        -- Tipo para identificadores de usuario
GO
CREATE TYPE defaultStatus_b FROM BIT NOT NULL; -- Tipo booleano (0 o 1)
GO

-- MAESTRO 2 --- ANGIE CHACON
CREATE TYPE productid_i FROM INT NOT NULL;     -- Tipo para identificadores de productos
GO
CREATE TYPE note_v FROM TEXT NOT NULL;         -- Tipo para notas (texto largo; se recomienda usar VARCHAR(MAX))
GO
CREATE TYPE price_d FROM DECIMAL(6,2) NOT NULL; -- Tipo para precios (hasta 6 dígitos, 2 decimales)
GO
CREATE TYPE datatime_d FROM DATETIME NOT NULL; -- Tipo para fecha y hora
GO

-- Eliminar el tipo de datos existente
DROP TYPE note_v;  -- Elimina el tipo de dato 'note_v'
GO