-- Crear la base de datos 'dbLosPinos'
CREATE DATABASE dbLosPinos;
GO

-- Usar la base de datos recién creada
USE dbLosPinos;
GO

-- Tabla de categorías
CREATE TABLE category
(
    id_category int IDENTITY(1,1),             -- ID autoincremental
    name name_v NOT NULL,                      -- Nombre de la categoría
    status defaultStatus_b DEFAULT 1 NOT NULL, -- Estado activo/inactivo
    CONSTRAINT category_pk PRIMARY KEY  (id_category),  -- Clave primaria
    CONSTRAINT uq_category_name UNIQUE (name),           -- Unicidad del nombre
    CONSTRAINT chk_category_name_length CHECK (LEN(name) > 0 AND LEN(name) <= 90)  -- Validación de longitud
);
GO

-- Tabla de productos
CREATE TABLE product
(
    id_product productid_i IDENTITY(1,1) NOT NULL,  -- ID del producto autoincremental
    id_category int NOT NULL,                         -- ID de la categoría del producto
    image VARCHAR(255) DEFAULT 'default.jpg',        -- Imagen del producto
    name name_v NOT NULL,                            -- Nombre del producto
    note note_v NOT NULL,                            -- Notas sobre el producto
    price price_d NOT NULL,                          -- Precio del producto
    date_p datatime_d NOT NULL,                     -- Fecha de publicación
    id_user userid_i NOT NULL,                       -- ID del usuario que crea el producto
    status defaultStatus_b DEFAULT 1 NOT NULL,      -- Estado activo/inactivo
    CONSTRAINT product_pk PRIMARY KEY (id_product),           -- Clave primaria
    CONSTRAINT chk_product_name_length CHECK (LEN(name) > 0 AND LEN(name) <= 90),  -- Validación de longitud
    CONSTRAINT chk_product_price_positive CHECK (price > 0),  -- Precio positivo
    CONSTRAINT chk_product_status_bit CHECK (status IN (0, 1)),  -- Estado válido
    CONSTRAINT uq_product_name UNIQUE (name)               -- Unicidad del nombre del producto
);
GO

-- Tabla de reservas de clientes
CREATE TABLE client_reservation
(
    id_client_reservation int IDENTITY(1,1),  -- ID de la reserva autoincremental
    id_user userid_i NOT NULL,                 -- ID del usuario que realiza la reserva
    name_reservation name_v NOT NULL,          -- Nombre de la reserva
    date_time datatime_d NOT NULL,             -- Fecha y hora de la reserva
    quantity_people int NOT NULL,               -- Cantidad de personas
    note note_v NOT NULL,                       -- Notas sobre la reserva
    id_type_status typestatus_i DEFAULT 1 NOT NULL,  -- Tipo de estado de la reserva
    CONSTRAINT client_reservation_pk PRIMARY KEY  (id_client_reservation),  -- Clave primaria
    CONSTRAINT chk_client_reservation_quantity_people CHECK (quantity_people > 0)  -- Cantidad positiva
);
GO

-- Tabla de ventas de tickets
CREATE TABLE ticket_sale
(
    id_ticket int IDENTITY(1,1),                -- ID del ticket autoincremental
    date_time datatime_d NOT NULL,             -- Fecha y hora de la venta
    id_user userid_i NOT NULL,                  -- ID del usuario que realiza la venta
    total_pay price_d NOT NULL,                 -- Total a pagar
    is_delivery bit DEFAULT 1 NOT NULL,        -- Indicador de entrega
    address_delivery varchar(150),               -- Dirección de entrega
    note note_v NOT NULL,                       -- Notas sobre la venta
    id_type_payment int NOT NULL,               -- ID del tipo de pago
    id_type_status typestatus_i DEFAULT 1,      -- Tipo de estado del ticket
    CONSTRAINT ticket_sale_pk PRIMARY KEY (id_ticket),  -- Clave primaria
    CONSTRAINT chk_ticket_sale_total_pay CHECK (total_pay > 0),  -- Total positivo
    CONSTRAINT chk_ticket_sale_is_delivery CHECK (is_delivery IN (0, 1)),  -- Entrega válida
    CONSTRAINT chk_ticket_sale_address_length CHECK (LEN(address_delivery) <= 150)  -- Longitud de dirección
);
GO

-- Tabla de detalles de productos
CREATE TABLE detail_product
(
    id_detail_product int IDENTITY(1,1),  -- ID del detalle de producto autoincremental
    id_ticket int NOT NULL,               -- ID del ticket asociado
    id_product productid_i NOT NULL,     -- ID del producto
    quantity int NOT NULL,                -- Cantidad de productos
    price_sale price_d NOT NULL,         -- Precio de venta
    CONSTRAINT detail_product_pk PRIMARY KEY  (id_detail_product),  -- Clave primaria
    CONSTRAINT chk_detail_product_quantity CHECK (quantity > 0),  -- Cantidad positiva
    CONSTRAINT chk_detail_product_price_sale CHECK (price_sale > 0)  -- Precio positivo
);
GO

-- Tabla de tipos de pago
CREATE TABLE type_payment
(
    id_type_payment int IDENTITY(1,1),    -- ID del tipo de pago autoincremental
    name name_v NOT NULL,                  -- Nombre del tipo de pago
    CONSTRAINT type_payment_pk PRIMARY KEY (id_type_payment),  -- Clave primaria
    CONSTRAINT uq_type_payment_name UNIQUE (name),            -- Unicidad del nombre
    CONSTRAINT chk_type_payment_name_length CHECK (LEN(name) > 0 AND LEN(name) <= 90)  -- Validación de longitud
);
GO

-- Tabla de tipos de estado de pedidos
CREATE TABLE type_status_order
(
    id_type_status typestatus_i IDENTITY(1,1),  -- ID del tipo de estado autoincremental
    name name_v NOT NULL,                        -- Nombre del tipo de estado
    CONSTRAINT type_status_order_pk PRIMARY KEY  (id_type_status),  -- Clave primaria
    CONSTRAINT uq_type_status_order_name UNIQUE (name),            -- Unicidad del nombre
    CONSTRAINT chk_type_status_order_name_length CHECK (LEN(name) > 0 AND LEN(name) <= 90)  -- Validación de longitud
);
GO

-- Tabla de tipos de usuario
CREATE TABLE type_user
(
    id_type_user int IDENTITY(1,1),          -- ID del tipo de usuario autoincremental
    name name_v NOT NULL,                    -- Nombre del tipo de usuario
    CONSTRAINT type_user_pk PRIMARY KEY  (id_type_user),  -- Clave primaria
    CONSTRAINT uq_type_user_name UNIQUE (name),            -- Unicidad del nombre
    CONSTRAINT chk_type_user_name_length CHECK (LEN(name) > 0 AND LEN(name) <= 90)  -- Validación de longitud
);
GO

-- Tabla de usuarios del restaurante
CREATE TABLE user_restaurant
(
    id_user userid_i IDENTITY(1,1) NOT NULL,  -- ID del usuario autoincremental
    username VARCHAR(20) NOT NULL,            -- Nombre de usuario
    password name_v NOT NULL,                  -- Contraseña del usuario
    names name_v NOT NULL,                     -- Nombres del usuario
    lastnames name_v NOT NULL,                 -- Apellidos del usuario
    date_birth date NOT NULL,                  -- Fecha de nacimiento
    address varchar(150) NOT NULL,             -- Dirección del usuario
    phone char(9) NOT NULL,                    -- Teléfono (9 dígitos)
    email varchar(150) NOT NULL,               -- Correo electrónico
    number_identification varchar(20) NOT NULL,  -- Número de identificación
    type_document varchar(5) NOT NULL,        -- Tipo de documento
    id_type_user int NOT NULL,                 -- ID del tipo de usuario
    status defaultStatus_b DEFAULT 1 NOT NULL, -- Estado activo/inactivo
    email_verified defaultStatus_b DEFAULT 0 NOT NULL,  -- Correo verificado
    CONSTRAINT user_restaurant_pk PRIMARY KEY  (id_user),  -- Clave primaria
    CONSTRAINT uq_user_name UNIQUE (username),             -- Unicidad del nombre de usuario
    CONSTRAINT uq_user_email UNIQUE (email),               -- Unicidad del correo electrónico
    CONSTRAINT uq_user_number_identification UNIQUE (number_identification),  -- Unicidad del número de identificación
    CONSTRAINT chk_user_phone_length CHECK (LEN(phone) = 9),  -- Validación de longitud de teléfono
    CONSTRAINT chk_user_email_format CHECK (email LIKE '%@%.%'),  -- Validación de formato de correo
    CONSTRAINT chk_user_status CHECK (status IN (0, 1)) -- Validación de estado
);
GO

-- Referencias y claves foráneas
ALTER TABLE client_reservation ADD CONSTRAINT Clientes_Reservas_Cliente
    FOREIGN KEY (id_user) REFERENCES user_restaurant (id_user);

ALTER TABLE client_reservation ADD CONSTRAINT Clientes_Reservas_Tipo_Estado_Reserva
    FOREIGN KEY (id_type_status) REFERENCES type_status_order (id_type_status);

ALTER TABLE detail_product ADD CONSTRAINT Detalles_pedido_Insumo
    FOREIGN KEY (id_product) REFERENCES product (id_product);

ALTER TABLE detail_product ADD CONSTRAINT Detalles_pedido_Pedido
    FOREIGN KEY (id_ticket) REFERENCES ticket_sale (id_ticket);

ALTER TABLE product ADD CONSTRAINT Insumo_Categoria
    FOREIGN KEY (id_category) REFERENCES category (id_category);

ALTER TABLE ticket_sale ADD CONSTRAINT Pedido_Cliente
    FOREIGN KEY (id_user) REFERENCES user_restaurant (id_user);

ALTER TABLE ticket_sale ADD CONSTRAINT Pedido_Metodo_Pago
    FOREIGN KEY (id_type_payment) REFERENCES type_payment (id_type_payment);

ALTER TABLE ticket_sale ADD CONSTRAINT Pedido_Estado_Pedido
    FOREIGN KEY (id_type_status) REFERENCES type_status_order (id_type_status);

ALTER TABLE user_restaurant ADD CONSTRAINT Usuarios_Tipo_Usuario
    FOREIGN KEY (id_type_user) REFERENCES type_user (id_type_user);
