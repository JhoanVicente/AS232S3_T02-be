--* Datos para la base de datos

-- Inserción de datos en la tabla type_user
-- Esta tabla contiene los tipos de usuarios del sistema
INSERT INTO users.type_user (name) VALUES
                                       ('administrador'),  -- Usuario con permisos de administración
                                       ('mesero'),         -- Usuario que atiende a los clientes
                                       ('cliente');        -- Usuario que realiza pedidos
GO

-- Inserción de datos en la tabla user_restaurant
-- Esta tabla contiene la información de los usuarios del restaurante
INSERT INTO users.user_restaurant (
    username,           -- Nombre de usuario
    password,           -- Contraseña (almacenada como hash)
    names,             -- Nombre(s) del usuario
    lastnames,         -- Apellido(s) del usuario
    date_birth,        -- Fecha de nacimiento
    address,           -- Dirección
    phone,             -- Número de teléfono
    email,             -- Correo electrónico
    number_identification, -- Número de identificación (DNI)
    type_document,     -- Tipo de documento (ej. DNI)
    id_type_user,      -- ID del tipo de usuario (referencia a type_user)
    status,            -- Estado del usuario (activo/inactivo)
    email_verified      -- Verificación del correo electrónico (1 para sí, 0 para no)
) VALUES
    ('Jhoan', '21232f297a57a5a743894a0e4a801fc3', 'Jhoan Daniel', 'Vicente Cruz', '2006-03-06', 'san vicente de cañete, av 28 de Julio', '973182822', 'jhoan.vicente@vallegrande.edu.pe', '75198234', 'DNI', 1, 1, 1),
    ('Angie', '21232f297a57a5a743894a0e4a801fc3', 'Angie Derlyn', 'Chacon Aparcana', '2000-05-10', 'imperial cañete, av 28 de julio', '950263442', 'angie.chacon@vallegrande.edu.pe', '73948281', 'DNI', 1, 1, 1),
    ('Jorge', '21232f297a57a5a743894a0e4a801fc3', 'Jorge Luis', 'Gonzales Rivera', '2005-05-10', 'calle a', '988354321', 'jorge@vallegrande.edu.pe', '73948200', 'DNI', 2, 1, 1),
    ('Maria', '21232f297a57a5a743894a0e4a801fc3', 'Maria luisa', 'Lopez Salvador', '2000-01-01', 'calle b', '988354322', 'maria@vallegrande.edu.pe', '73948201', 'DNI', 3, 1, 1),
    ('Pedro', '21232f297a57a5a743894a0e4a801fc3', 'Juan Pedro', 'Ramirez Saldo', '2000-01-01', 'calle c', '988354323', 'pedro@vallegrande.edu.pe', '73948202', 'DNI', 3, 1, 1),
    ('Laura', '21232f297a57a5a743894a0e4a801fc3', 'Laura Amara', 'Martinez Dammer', '2000-01-01', 'calle d', '988354324', 'laura@vallegrande.edu.pe', '73948203', 'DNI', 2, 1, 1),
    ('Carlos', '21232f297a57a5a743894a0e4a801fc3', 'Carlos Mateo', 'Perez Rodriguez', '2000-01-01', 'calle e', '988354325', 'carlos@vallegrande.edu.pe', '73948204', 'DNI', 2, 1, 1),
    ('Luis', '21232f297a57a5a743894a0e4a801fc3', 'Luis Alejandro', 'Gutierrez Sanchez', '2000-01-01', 'calle f', '988354326', 'luis@vallegrande.edu.pe', '73948205', 'DNI', 3, 1, 1),
    ('Ana', '21232f297a57a5a743894a0e4a801fc3', 'Ana Camila', 'Sanchez Londra', '2000-01-01', 'calle g', '988354327', 'ana@vallegrande.edu.pe', '73948206', 'DNI', 3, 1, 1),
    ('Sara', '21232f297a57a5a743894a0e4a801fc3', 'Sara Andrea', 'Diaz Yankee', '2000-01-01', 'calle h', '988354328', 'sara@vallegrande.edu.pe', '73948207', 'DNI', 1, 1, 1);
GO

-- Inserción de datos en la tabla type_status_order
-- Esta tabla contiene los estados de los pedidos
INSERT INTO type_status_order (name) VALUES
    ('Pendiente'),    -- Estado del pedido aún no procesado
    ('Aceptado'),     -- Pedido que ha sido aceptado
    ('Rechazado'),    -- Pedido que ha sido rechazado
    ('Completado');   -- Pedido que ha sido completado
GO

-- Inserción de datos en la tabla type_payment
-- Esta tabla contiene los métodos de pago disponibles
INSERT INTO type_payment (name) VALUES
    ('Efectivo'),     -- Método de pago en efectivo
    ('Yape'),         -- Método de pago a través de Yape
    ('Tarjeta');      -- Método de pago con tarjeta
GO

-- Inserción de datos en la tabla category
-- Esta tabla contiene las categorías de los productos
INSERT INTO product.category (name) VALUES
    ('Menu'),         -- Categoría para los platos principales
    ('Bebida'),       -- Categoría para las bebidas
    ('Marino');       -- Categoría para los productos marinos
GO

-- Inserción de datos en la tabla product
-- Esta tabla contiene los productos ofrecidos en el restaurante
INSERT INTO product.product (
    id_category,      -- ID de la categoría a la que pertenece el producto
    image,            -- Nombre del archivo de imagen del producto
    name,             -- Nombre del producto
    note,             -- Descripción del producto
    price,            -- Precio del producto
    date_p,          -- Fecha de publicación del producto
    id_user,          -- ID del usuario que creó el producto
    status            -- Estado del producto (activo/inactivo)
) VALUES
    (3, '09062024040840-120458549634166763ceviche.jpg', 'Ceviche Clásico', 'pesca del día en leche de tigre clásica, entre más cosas', 19.00, '2024-06-09 04:08:40.073', 1, 1),
    (3, '09062024020233490491006402809600sudadodePescado.jpg', 'Sudado de pescado', 'El riquísimo sudado de pescado peruano es muy conocido.', 25.00, '2024-06-09 14:02:33.510', 1, 1),
    (3, '09062024020637-8713321124620264749truchaFrita.jpg', 'Trucha Frita', 'La trucha frita es un plato que se ha vuelto típico de la gastronomía peruana', 25.00, '2024-06-09 14:06:37.700', 1, 1),
    (1, '090620240211331717176451597982952tallarinesVerdes.jpg', 'Tallarines Verdes', 'Los Tallarines Verdes, un plato muy delicioso para el', 15.00, '2024-06-09 14:11:33.793', 1, 1),
    (1, '09062024021601-1866357301907864302pollobrasau14.jpg', '1/4 Brasa con Papas y ensalada', 'Pollo a la brasa es la denominación que se da en el Perú al pollo asado-', 29.90, '2024-06-09 14:16:01.803', 1, 1),
    (2, '09062024022006-2282143402743148797geseosaIncaKola.jpg', 'Gaseosa INCA KOLA Botella 600ml', 'Bebida saborizada dulce, Conservar en lugar fresco y seguro, Revisar componentes asociados al azúcar', 3.00, '2024-06-09 14:20:06.720', 1, 1),
    (2, '09062024022229-5162791127941430194cocakola.jpg', 'Gaseosa COCA COLA Original (600 ml)', 'Bebida saborizada dulce, Conservar en lugar fresco y seguro, Revisar componentes asociados al azúcar', 4.00, '2024-06-09 14:22:29.837', 1, 1),
    (1, '09062024022546-6476497063329167437arrozchaufa.jpg', 'Arroz Chaufa', 'Este es un plato típico de la cocina chifa.', 22.00, '2024-06-09 14:25:46.943', 1, 1);
GO