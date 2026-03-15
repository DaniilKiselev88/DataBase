-- Поставщики
INSERT INTO Suppliers (company_name, contact_person, phone) VALUES
('TechCorp Inc.', 'Анна Смирнова', '+7 (999) 123-45-67'),
('Gadgets Ltd.', 'Иван Петров', '+7 (999) 234-56-78'),
('Electronics Co.', 'Мария Иванова', '+7 (999) 345-67-89');

-- Клиенты
INSERT INTO Customers (first_name, last_name, email, registration_date, city, loyalty_points) VALUES
('Алексей', 'Сидоров', 'alex@mail.ru', '2023-01-15', 'Москва', 150),
('Елена', 'Козлова', 'elena@gmail.com', '2023-02-20', 'Санкт-Петербург', 200),
('Дмитрий', 'Волков', 'dmitry@yandex.ru', '2023-03-10', 'Новосибирск', 50),
('Ольга', 'Павлова', 'olga@mail.ru', '2023-04-05', 'Екатеринбург', 300);

-- Товары
INSERT INTO Products (name, category, price, stock_quantity, supplier_id) VALUES
('Смартфон XYZ', 'Электроника', 29999.99, 50, 1),
('Ноутбук ProBook', 'Ноутбуки', 79999.00, 20, 2),
('Беспроводные наушники', 'Аудио', 4999.50, 100, 3),
('Смарт-часы', 'Гаджеты', 12999.00, 30, 1);

-- Заказы
INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2023-05-01 10:30:00', 'completed', 34999.49),
(2, '2023-05-02 14:15:00', 'completed', 79999.00),
(3, '2023-05-03 09:45:00', 'pending', 4999.50),
(1, '2023-05-04 16:20:00', 'cancelled', 12999.00);

-- Позиции заказов
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 29999.99),  -- Смартфон
(1, 3, 1, 4999.50),   -- Наушники
(2, 2, 1, 79999.00), -- Ноутбук
(3, 3, 1, 4999.50),  -- Наушники
(4, 4, 1, 12999.00); -- Смарт‑часы
