-- Создание функции, которая будет обновлять статистику
CREATE OR REPLACE FUNCTION update_statistics()
RETURNS TRIGGER AS
$$
BEGIN
    -- Обновляем статистику для текущего дня
INSERT INTO statistics (date, total_quantity, total_sales)
VALUES (CURRENT_DATE, NEW.quantity, NEW.quantity * (SELECT price FROM products WHERE id = NEW.product_id))
    ON CONFLICT (date)
    DO UPDATE
               SET total_quantity = statistics.total_quantity + NEW.quantity,
               total_sales = statistics.total_sales + (NEW.quantity * (SELECT price FROM products WHERE id = NEW.product_id));

RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Создание триггера, который будет вызываться при вставке нового заказа
CREATE TRIGGER trigger_update_statistics
    AFTER INSERT ON orders
    FOR EACH ROW
    EXECUTE FUNCTION update_statistics();
