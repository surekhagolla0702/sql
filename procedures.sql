-- =====================================================
-- 1. ADD TWO NUMBERS
-- =====================================================

CREATE OR REPLACE FUNCTION add_numbers(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN a + b;
END;
/

SELECT add_numbers(10, 20) AS result FROM dual;

-- Output: 30


-- =====================================================
-- 2. SUBTRACT TWO NUMBERS
-- =====================================================

CREATE OR REPLACE FUNCTION subtract_numbers(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN a - b;
END;
/

SELECT subtract_numbers(50, 20) AS result FROM dual;

-- Output: 30


-- =====================================================
-- 3. MULTIPLY TWO NUMBERS
-- =====================================================

CREATE OR REPLACE FUNCTION multiply_numbers(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN a * b;
END;
/

SELECT multiply_numbers(10, 5) AS result FROM dual;

-- Output: 50


-- =====================================================
-- 4. DIVIDE TWO NUMBERS
-- =====================================================

CREATE OR REPLACE FUNCTION divide_numbers(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    IF b = 0 THEN
        RETURN NULL;
    END IF;

    RETURN a / b;
END;
/

SELECT divide_numbers(100, 5) AS result FROM dual;

-- Output: 20


-- =====================================================
-- 5. CALCULATE SQUARE OF A NUMBER
-- =====================================================

CREATE OR REPLACE FUNCTION square_number(
    n IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN n * n;
END;
/

SELECT square_number(6) AS result FROM dual;

-- Output: 36


-- =====================================================
-- 6. CHECK EVEN OR ODD NUMBER
-- =====================================================

CREATE OR REPLACE FUNCTION check_even_odd(
    n IN NUMBER
)
RETURN VARCHAR2
IS
BEGIN
    IF MOD(n, 2) = 0 THEN
        RETURN 'EVEN';
    ELSE
        RETURN 'ODD';
    END IF;
END;
/

SELECT check_even_odd(10) AS result FROM dual;

-- Output: EVEN


-- =====================================================
-- 7. FIND BIGGEST OF TWO NUMBERS
-- =====================================================

CREATE OR REPLACE FUNCTION biggest_number(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END;
/

SELECT biggest_number(50, 80) AS result FROM dual;

-- Output: 80


-- =====================================================
-- 8. CALCULATE 10% BONUS
-- =====================================================

CREATE OR REPLACE FUNCTION calculate_bonus(
    salary IN NUMBER
)
RETURN NUMBER
IS
    v_bonus NUMBER;
BEGIN
    v_bonus := salary * 0.10;

    RETURN v_bonus;
END;
/

SELECT calculate_bonus(50000) AS bonus FROM dual;

-- Output: 5000


-- =====================================================
-- 9. CALCULATE GST (18%)
-- =====================================================

CREATE OR REPLACE FUNCTION calculate_gst(
    amount IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN amount * 0.18;
END;
/

SELECT calculate_gst(1000) AS gst FROM dual;

-- Output: 180


-- =====================================================
-- 10. CALCULATE DISCOUNT
-- =====================================================

CREATE OR REPLACE FUNCTION calculate_discount(
    price IN NUMBER,
    discount_percentage IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN price * discount_percentage / 100;
END;
/

SELECT calculate_discount(2000, 10) AS discount
FROM dual;

-- Output: 200


-- =====================================================
-- 11. CONVERT TEXT TO UPPERCASE
-- =====================================================

CREATE OR REPLACE FUNCTION convert_upper(
    p_text IN VARCHAR2
)
RETURN VARCHAR2
IS
BEGIN
    RETURN UPPER(p_text);
END;
/

SELECT convert_upper('oracle sql') AS result
FROM dual;

-- Output: ORACLE SQL


-- =====================================================
-- 12. GET LENGTH OF STRING
-- =====================================================

CREATE OR REPLACE FUNCTION string_length(
    p_text IN VARCHAR2
)
RETURN NUMBER
IS
BEGIN
    RETURN LENGTH(p_text);
END;
/

SELECT string_length('ORACLE') AS result
FROM dual;

-- Output: 6


-- =====================================================
-- 13. CONCATENATE TWO STRINGS
-- =====================================================

CREATE OR REPLACE FUNCTION combine_names(
    first_name IN VARCHAR2,
    last_name IN VARCHAR2
)
RETURN VARCHAR2
IS
BEGIN
    RETURN first_name || ' ' || last_name;
END;
/

SELECT combine_names('Ravi', 'Kumar') AS full_name
FROM dual;

-- Output: Ravi Kumar


-- =====================================================
-- 14. CALCULATE SIMPLE INTEREST
-- =====================================================

CREATE OR REPLACE FUNCTION simple_interest(
    principal IN NUMBER,
    rate IN NUMBER,
    years IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN (principal * rate * years) / 100;
END;
/

SELECT simple_interest(10000, 5, 2) AS interest
FROM dual;

-- Output: 1000


-- =====================================================
-- 15. CHECK PASS OR FAIL
-- =====================================================

CREATE OR REPLACE FUNCTION check_result(
    marks IN NUMBER
)
RETURN VARCHAR2
IS
BEGIN
    IF marks >= 35 THEN
        RETURN 'PASS';
    ELSE
        RETURN 'FAIL';
    END IF;
END;
/

SELECT check_result(75) AS result FROM dual;

-- Output: PASS


-- =====================================================
-- BONUS: NESTED FUNCTION CALLS
-- =====================================================

-- Function inside another function

SELECT square_number(add_numbers(10, 20)) AS result
FROM dual;

-- Output: 900


-- =====================================================
-- BONUS: CALL MULTIPLE FUNCTIONS IN ONE SELECT
-- =====================================================

SELECT
    add_numbers(10, 20) AS addition,
    subtract_numbers(50, 20) AS subtraction,
    multiply_numbers(5, 6) AS multiplication,
    square_number(8) AS square_value,
    calculate_bonus(50000) AS bonus,
    calculate_gst(1000) AS gst
FROM dual;









-- ==========================================================
-- PART 1: CREATE TABLES
-- ==========================================================

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2),
    cost_price NUMBER(10,2)
);

CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    product_id NUMBER REFERENCES products(product_id),
    quantity NUMBER,
    sale_date DATE
);


-- ==========================================================
-- PART 2: INSERT PRODUCTS
-- ==========================================================

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000, 40000);

INSERT INTO products VALUES
(102, 'Mobile', 'Electronics', 20000, 15000);

INSERT INTO products VALUES
(103, 'Shoes', 'Fashion', 2000, 1200);

INSERT INTO products VALUES
(104, 'Shirt', 'Fashion', 1500, 800);

INSERT INTO products VALUES
(105, 'Watch', 'Accessories', 5000, 3000);


-- ==========================================================
-- PART 3: INSERT SALES
-- ==========================================================

INSERT INTO sales VALUES
(1, 101, 2, DATE '2026-10-01');

INSERT INTO sales VALUES
(2, 102, 3, DATE '2026-10-01');

INSERT INTO sales VALUES
(3, 103, 5, DATE '2026-10-02');

INSERT INTO sales VALUES
(4, 104, 4, DATE '2026-10-02');

INSERT INTO sales VALUES
(5, 105, 2, DATE '2026-10-03');

INSERT INTO sales VALUES
(6, 101, 1, DATE '2026-10-03');

INSERT INTO sales VALUES
(7, 102, 2, DATE '2026-10-04');

INSERT INTO sales VALUES
(8, 103, 3, DATE '2026-10-04');

INSERT INTO sales VALUES
(9, 104, 6, DATE '2026-10-05');

INSERT INTO sales VALUES
(10, 105, 4, DATE '2026-10-05');

COMMIT;


-- Verify the data
SELECT * FROM products;
SELECT * FROM sales;


-- ==========================================================
-- FUNCTION 1: GET PRODUCT NAME
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_name(
    p_product_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_name VARCHAR2(100);
BEGIN
    SELECT product_name
    INTO v_name
    FROM products
    WHERE product_id = p_product_id;

    RETURN v_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Product Not Found';
END;
/

SELECT get_product_name(101) AS product_name FROM dual;

-- Output: Laptop


-- ==========================================================
-- FUNCTION 2: GET PRODUCT PRICE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_price(
    p_product_id IN NUMBER
)
RETURN NUMBER
IS
    v_price NUMBER;
BEGIN
    SELECT price
    INTO v_price
    FROM products
    WHERE product_id = p_product_id;

    RETURN v_price;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SELECT get_product_price(102) AS price FROM dual;

-- Output: 20000


-- ==========================================================
-- FUNCTION 3: GET PRODUCT CATEGORY
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_category(
    p_product_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_category VARCHAR2(50);
BEGIN
    SELECT category
    INTO v_category
    FROM products
    WHERE product_id = p_product_id;

    RETURN v_category;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Not Found';
END;
/

SELECT get_product_category(103) AS category FROM dual;

-- Output: Fashion


-- ==========================================================
-- FUNCTION 4: CALCULATE PRODUCT PROFIT PER UNIT
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_profit(
    p_product_id IN NUMBER
)
RETURN NUMBER
IS
    v_profit NUMBER;
BEGIN
    SELECT price - cost_price
    INTO v_profit
    FROM products
    WHERE product_id = p_product_id;

    RETURN v_profit;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SELECT get_product_profit(101) AS profit FROM dual;

-- Output: 10000


-- ==========================================================
-- FUNCTION 5: GET TOTAL PRODUCTS COUNT
-- ==========================================================

CREATE OR REPLACE FUNCTION get_total_products
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM products;

    RETURN v_count;
END;
/

SELECT get_total_products() AS total_products FROM dual;

-- Output: 5


-- ==========================================================
-- FUNCTION 6: GET TOTAL SALES QUANTITY
-- ==========================================================

CREATE OR REPLACE FUNCTION get_total_quantity
RETURN NUMBER
IS
    v_quantity NUMBER;
BEGIN
    SELECT NVL(SUM(quantity), 0)
    INTO v_quantity
    FROM sales;

    RETURN v_quantity;
END;
/

SELECT get_total_quantity() AS total_quantity FROM dual;

-- Output: 32


-- ==========================================================
-- FUNCTION 7: GET TOTAL QUANTITY FOR ONE PRODUCT
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_quantity(
    p_product_id IN NUMBER
)
RETURN NUMBER
IS
    v_quantity NUMBER;
BEGIN
    SELECT NVL(SUM(quantity), 0)
    INTO v_quantity
    FROM sales
    WHERE product_id = p_product_id;

    RETURN v_quantity;
END;
/

SELECT get_product_quantity(101) AS total_quantity
FROM dual;

-- Output: 3


-- ==========================================================
-- FUNCTION 8: GET TOTAL SALES REVENUE FOR A PRODUCT
-- ==========================================================

CREATE OR REPLACE FUNCTION get_product_revenue(
    p_product_id IN NUMBER
)
RETURN NUMBER
IS
    v_revenue NUMBER;
BEGIN
    SELECT NVL(SUM(s.quantity * p.price), 0)
    INTO v_revenue
    FROM sales s
    JOIN products p
      ON s.product_id = p.product_id
    WHERE s.product_id = p_product_id;

    RETURN v_revenue;
END;
/

SELECT get_product_revenue(101) AS revenue FROM dual;

-- Output: 150000


-- ==========================================================
-- FUNCTION 9: GET TOTAL RETAIL REVENUE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_total_revenue
RETURN NUMBER
IS
    v_revenue NUMBER;
BEGIN
    SELECT NVL(SUM(s.quantity * p.price), 0)
    INTO v_revenue
    FROM sales s
    JOIN products p
      ON s.product_id = p.product_id;

    RETURN v_revenue;
END;
/

SELECT get_total_revenue() AS total_revenue FROM dual;

-- Output: 321000


-- ==========================================================
-- FUNCTION 10: GET TOTAL GROSS PROFIT
-- ==========================================================

CREATE OR REPLACE FUNCTION get_total_profit
RETURN NUMBER
IS
    v_profit NUMBER;
BEGIN
    SELECT NVL(
        SUM(s.quantity * (p.price - p.cost_price)), 0
    )
    INTO v_profit
    FROM sales s
    JOIN products p
      ON s.product_id = p.product_id;

    RETURN v_profit;
END;
/

SELECT get_total_profit() AS gross_profit FROM dual;

-- Output: 79800


-- ==========================================================
-- FUNCTION 11: GET AVERAGE PRODUCT PRICE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_average_price
RETURN NUMBER
IS
    v_avg NUMBER;
BEGIN
    SELECT ROUND(AVG(price), 2)
    INTO v_avg
    FROM products;

    RETURN v_avg;
END;
/

SELECT get_average_price() AS average_price FROM dual;

-- Output: 15700


-- ==========================================================
-- FUNCTION 12: GET MAXIMUM PRODUCT PRICE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_max_price
RETURN NUMBER
IS
    v_max NUMBER;
BEGIN
    SELECT MAX(price)
    INTO v_max
    FROM products;

    RETURN v_max;
END;
/

SELECT get_max_price() AS maximum_price FROM dual;

-- Output: 50000


-- ==========================================================
-- FUNCTION 13: GET MINIMUM PRODUCT PRICE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_min_price
RETURN NUMBER
IS
    v_min NUMBER;
BEGIN
    SELECT MIN(price)
    INTO v_min
    FROM products;

    RETURN v_min;
END;
/

SELECT get_min_price() AS minimum_price FROM dual;

-- Output: 1500


-- ==========================================================
-- FUNCTION 14: CALCULATE SALES REVENUE BY DATE
-- ==========================================================

CREATE OR REPLACE FUNCTION get_daily_revenue(
    p_date IN DATE
)
RETURN NUMBER
IS
    v_revenue NUMBER;
BEGIN
    SELECT NVL(SUM(s.quantity * p.price), 0)
    INTO v_revenue
    FROM sales s
    JOIN products p
      ON s.product_id = p.product_id
    WHERE s.sale_date >= TRUNC(p_date)
      AND s.sale_date < TRUNC(p_date) + 1;

    RETURN v_revenue;
END;
/

SELECT get_daily_revenue(
    DATE '2026-10-01'
) AS daily_revenue
FROM dual;

-- Output: 160000


-- ==========================================================
-- FUNCTION 15: CHECK PRODUCT PRICE CATEGORY
-- ==========================================================

CREATE OR REPLACE FUNCTION check_price_category(
    p_product_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_price NUMBER;
BEGIN
    SELECT price
    INTO v_price
    FROM products
    WHERE product_id = p_product_id;

    IF v_price >= 20000 THEN
        RETURN 'EXPENSIVE';
    ELSIF v_price >= 5000 THEN
        RETURN 'MEDIUM';
    ELSE
        RETURN 'LOW COST';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'PRODUCT NOT FOUND';
END;
/

SELECT check_price_category(101) AS price_category
FROM dual;

-- Output: EXPENSIVE


-- ==========================================================
-- BONUS: CALL FUNCTIONS DIRECTLY ON PRODUCT TABLE
-- ==========================================================

SELECT
    product_id,
    product_name,
    price,
    get_product_profit(product_id) AS unit_profit,
    get_product_quantity(product_id) AS units_sold,
    get_product_revenue(product_id) AS revenue,
    check_price_category(product_id) AS price_category
FROM products
ORDER BY product_id;


-- ==========================================================
-- BONUS: CALL MULTIPLE FUNCTIONS IN ONE QUERY
-- ==========================================================

SELECT
    get_total_products() AS total_products,
    get_total_quantity() AS total_units,
    get_total_revenue() AS total_revenue,
    get_total_profit() AS gross_profit,
    get_average_price() AS average_price
FROM dual;












