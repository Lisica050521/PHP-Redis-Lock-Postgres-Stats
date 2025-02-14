-- Добавляем категории
INSERT INTO categories (name) VALUES
                                  ('Electronics'),
                                  ('Clothing'),
                                  ('Furniture');

-- Добавляем продукты
INSERT INTO products (name, price, category_id) VALUES
                                                    ('Smartphone', 500.00, 1),
                                                    ('Laptop', 1200.00, 1),
                                                    ('T-shirt', 20.00, 2),
                                                    ('Jeans', 40.00, 2),
                                                    ('Sofa', 300.00, 3);

-- Добавляем заказы
INSERT INTO orders (product_id, quantity) VALUES
                                              (1, 3),  -- 3 смартфона
                                              (2, 2),  -- 2 ноутбука
                                              (3, 5),  -- 5 футболок
                                              (4, 7),  -- 7 джинсов
                                              (5, 1);  -- 1 диван
