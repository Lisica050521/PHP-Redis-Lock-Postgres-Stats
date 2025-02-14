-- Создание таблицы категорий
CREATE TABLE categories (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(255) NOT NULL
);

-- Создание таблицы продуктов
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL,
                          category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
);

-- Создание таблицы заказов
CREATE TABLE orders (
                        id SERIAL PRIMARY KEY,
                        product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
                        quantity INTEGER NOT NULL,
                        order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы статистики
CREATE TABLE statistics (
                            date DATE PRIMARY KEY,
                            total_quantity INTEGER NOT NULL,
                            total_sales DECIMAL(10, 2) NOT NULL
);
