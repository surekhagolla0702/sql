-- ============================================================
-- 1. Classify employees based on salary
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN 'High Salary'
           WHEN salary >= 8000  THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM hr.employees;


-- ============================================================
-- 2. Check whether employee salary is above 10,000
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary > 10000 THEN 'Above 10000'
           ELSE '10000 or Below'
       END AS salary_status
FROM hr.employees;


-- ============================================================
-- 3. Categorize employees based on department
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       CASE
           WHEN department_id = 10 THEN 'Administration'
           WHEN department_id = 20 THEN 'Marketing'
           WHEN department_id = 50 THEN 'Shipping'
           WHEN department_id = 60 THEN 'IT'
           WHEN department_id = 80 THEN 'Sales'
           ELSE 'Other Department'
       END AS department_name
FROM hr.employees;


-- ============================================================
-- 4. Check whether employee has commission
-- ============================================================

SELECT employee_id,
       first_name,
       commission_pct,
       CASE
           WHEN commission_pct IS NULL THEN 'No Commission'
           ELSE 'Commission Available'
       END AS commission_status
FROM hr.employees;


-- ============================================================
-- 5. Categorize employees based on commission percentage
-- ============================================================

SELECT employee_id,
       first_name,
       commission_pct,
       CASE
           WHEN commission_pct >= 0.30 THEN 'High Commission'
           WHEN commission_pct >= 0.20 THEN 'Medium Commission'
           WHEN commission_pct > 0 THEN 'Low Commission'
           ELSE 'No Commission'
       END AS commission_category
FROM hr.employees;


-- ============================================================
-- 6. Categorize employees based on hire year
-- ============================================================

SELECT employee_id,
       first_name,
       hire_date,
       CASE
           WHEN EXTRACT(YEAR FROM hire_date) < 2005 THEN 'Old Employee'
           WHEN EXTRACT(YEAR FROM hire_date) <= 2007 THEN 'Experienced Employee'
           ELSE 'New Employee'
       END AS employee_category
FROM hr.employees;


-- ============================================================
-- 7. Check whether employee has a manager
-- ============================================================

SELECT employee_id,
       first_name,
       manager_id,
       CASE
           WHEN manager_id IS NULL THEN 'No Manager'
           ELSE 'Has Manager'
       END AS manager_status
FROM hr.employees;


-- ============================================================
-- 8. Categorize employees based on Job ID
-- ============================================================

SELECT employee_id,
       first_name,
       job_id,
       CASE
           WHEN job_id = 'IT_PROG' THEN 'IT Employee'
           WHEN job_id = 'SA_REP'  THEN 'Sales Employee'
           WHEN job_id = 'ST_CLERK' THEN 'Store Employee'
           WHEN job_id = 'FI_ACCOUNT' THEN 'Finance Employee'
           ELSE 'Other Employee'
       END AS job_category
FROM hr.employees;


-- ============================================================
-- 9. Calculate bonus based on salary
-- High salary = 10%
-- Medium salary = 15%
-- Low salary = 20%
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN salary * 0.10
           WHEN salary >= 8000  THEN salary * 0.15
           ELSE salary * 0.20
       END AS bonus
FROM hr.employees;


-- ============================================================
-- 10. Calculate salary after bonus
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 15000 THEN salary + (salary * 0.10)
           WHEN salary >= 8000  THEN salary + (salary * 0.15)
           ELSE salary + (salary * 0.20)
       END AS salary_after_bonus
FROM hr.employees;


-- ============================================================
-- 11. Categorize employees based on first letter of name
-- ============================================================

SELECT employee_id,
       first_name,
       CASE
           WHEN first_name LIKE 'A%' THEN 'Name Starts With A'
           WHEN first_name LIKE 'S%' THEN 'Name Starts With S'
           WHEN first_name LIKE 'J%' THEN 'Name Starts With J'
           ELSE 'Other Name'
       END AS name_category
FROM hr.employees;


-- ============================================================
-- 12. Categorize salary into 4 levels
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 20000 THEN 'Level 1'
           WHEN salary >= 15000 THEN 'Level 2'
           WHEN salary >= 10000 THEN 'Level 3'
           ELSE 'Level 4'
       END AS salary_level
FROM hr.employees;


-- ============================================================
-- 13. Check employee eligibility for bonus
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary < 10000 THEN 'Eligible for Bonus'
           ELSE 'Not Eligible for Bonus'
       END AS bonus_eligibility
FROM hr.employees;


-- ============================================================
-- 14. Categorize departments into business areas
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       CASE
           WHEN department_id IN (10, 20, 30) THEN 'Business Operations'
           WHEN department_id IN (50, 60) THEN 'Technical Operations'
           WHEN department_id IN (80, 90) THEN 'Sales and Management'
           ELSE 'Other'
       END AS business_area
FROM hr.employees;


-- ============================================================
-- 15. Categorize salary using AND condition
-- ============================================================

SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 5000 AND salary < 10000
                THEN 'Salary Between 5000 and 9999'

           WHEN salary >= 10000 AND salary < 15000
                THEN 'Salary Between 10000 and 14999'

           WHEN salary >= 15000
                THEN 'Salary 15000 or Above'

           ELSE 'Salary Below 5000'
       END AS salary_range
FROM hr.employees;


-- ============================================================
-- 16. Use CASE WHEN inside ORDER BY
-- Custom department sorting
-- ============================================================

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
ORDER BY
       CASE
           WHEN department_id = 60 THEN 1
           WHEN department_id = 80 THEN 2
           WHEN department_id = 50 THEN 3
           ELSE 4
       END;


-- ============================================================
-- 17. Count high, medium and low salary employees
-- ============================================================

SELECT
       SUM(CASE
               WHEN salary >= 15000 THEN 1
               ELSE 0
           END) AS high_salary_count,

       SUM(CASE
               WHEN salary >= 8000 AND salary < 15000 THEN 1
               ELSE 0
           END) AS medium_salary_count,

       SUM(CASE
               WHEN salary < 8000 THEN 1
               ELSE 0
           END) AS low_salary_count
FROM hr.employees;


-- ============================================================
-- 18. Calculate department-wise high salary employee count
-- ============================================================

SELECT department_id,
       COUNT(*) AS total_employees,

       SUM(
           CASE
               WHEN salary >= 10000 THEN 1
               ELSE 0
           END
       ) AS high_salary_employees

FROM hr.employees
GROUP BY department_id
ORDER BY department_id;


-- ============================================================
-- 19. Give different salary increments based on department
-- IT = 20%
-- Sales = 15%
-- Others = 10%
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       salary,

       CASE
           WHEN department_id = 60
                THEN salary * 1.20

           WHEN department_id = 80
                THEN salary * 1.15

           ELSE salary * 1.10
       END AS new_salary

FROM hr.employees;


-- ============================================================
-- 20. Multiple conditions: Salary + Department
-- ============================================================

SELECT employee_id,
       first_name,
       department_id,
       salary,

       CASE
           WHEN department_id = 60
                AND salary >= 10000
                THEN 'Senior IT Employee'

           WHEN department_id = 60
                AND salary < 10000
                THEN 'Junior IT Employee'

           WHEN department_id = 80
                AND salary >= 10000
                THEN 'Senior Sales Employee'

           WHEN department_id = 80
                AND salary < 10000
                THEN 'Junior Sales Employee'

           ELSE 'Other Employee'
       END AS employee_status

FROM hr.employees;








-- Question:
-- Display employee ID, first name, salary and commission.
-- If commission_pct is NULL, display 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL(commission_pct, 0) AS commission
FROM hr.employees;


-- ----------------------------------------------------------------
-- 2. Calculate commission amount using NVL
-- Question:
-- Calculate the commission amount for every employee.
-- Employees without commission should get commission amount = 0.
--
-- Example:
-- Salary = 10000
-- Commission = 0.20
-- Commission Amount = 2000
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * NVL(commission_pct, 0) AS commission_amount
FROM hr.employees;


-- ----------------------------------------------------------------
-- 3. Calculate total salary including commission
-- Question:
-- Calculate salary + commission amount.
-- If commission_pct is NULL, consider commission as 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary + (salary * NVL(commission_pct, 0)) AS total_salary
FROM hr.employees;


-- ----------------------------------------------------------------
-- 4. Replace NULL manager ID
-- Question:
-- Display manager ID.
-- If an employee does not have a manager, display 0.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    last_name,
    manager_id,
    NVL(manager_id, 0) AS manager_id_after_nvl
FROM hr.employees;

--5. Check whether an employee receives commission
-- Question:
-- If commission_pct has a value, display 'Gets Commission'.
-- Otherwise display 'No Commission'.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        'Gets Commission',
        'No Commission'
    ) AS commission_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 6. Check whether employee has a manager
-- Question:
-- If manager_id is NOT NULL, display 'Has Manager'.
-- If manager_id is NULL, display 'No Manager'.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    manager_id,
    NVL2(
        manager_id,
        'Has Manager',
        'No Manager'
    ) AS manager_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 7. Calculate bonus using NVL2
-- Question:
-- If employee has commission, give a 20% bonus.
-- If employee does not have commission, give a 10% bonus.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        salary * 0.20,
        salary * 0.10
    ) AS bonus
FROM hr.employees;


-- ----------------------------------------------------------------
-- 8. Calculate salary after bonus using NVL2
-- Question:
-- Employees with commission get a 20% salary increase.
-- Employees without commission get a 10% salary increase.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    NVL2(
        commission_pct,
        salary + (salary * 0.20),
        salary + (salary * 0.10)
    ) AS salary_after_bonus
FROM hr.employees;



-- ================================================================
-- COALESCE() - EXAMPLES
--
-- Syntax:
-- COALESCE(value1, value2, value3, ...)
--
-- Returns the FIRST NON-NULL value.
-- ================================================================


-- ----------------------------------------------------------------
-- 9. Return commission if available, otherwise salary
-- Question:
-- Return commission_pct when it is available.
-- If commission_pct is NULL, return salary.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    COALESCE(commission_pct, salary) AS first_available_value
FROM hr.employees;


-- ----------------------------------------------------------------
-- 10. Find first available contact information
-- Question:
-- Display phone number if available.
-- If phone number is NULL, display email.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    phone_number,
    email,
    COALESCE(phone_number, email) AS preferred_contact
FROM hr.employees;


-- ----------------------------------------------------------------
-- 11. COALESCE with multiple values
-- Question:
-- Return the first available value from:
-- commission_pct -> manager_id -> department_id -> 0
--
-- TO_CHAR is used so all return values have compatible datatypes.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    commission_pct,
    manager_id,
    department_id,
    COALESCE(
        TO_CHAR(commission_pct),
        TO_CHAR(manager_id),
        TO_CHAR(department_id),
        '0'
    ) AS first_available_value
FROM hr.employees;


-- ----------------------------------------------------------------
-- 12. Use COALESCE to calculate commission
-- Question:
-- If commission_pct is NULL, use 0.
-- Then calculate the employee's commission amount.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * COALESCE(commission_pct, 0) AS commission_amount
FROM hr.employees;

-- ================================================================
-- DECODE() - EXAMPLES
--
-- Syntax:
-- DECODE(expression,
--        search1, result1,
--        search2, result2,
--        default)
--
-- DECODE is commonly used for equality-based conditions in Oracle.
-- ================================================================


-- ----------------------------------------------------------------
-- 13. Display department name using DECODE
-- Question:
-- Convert selected department IDs into readable names.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    DECODE(
        department_id,
        10, 'Administration',
        20, 'Marketing',
        50, 'Shipping',
        60, 'IT',
        80, 'Sales',
        90, 'Executive',
        'Other Department'
    ) AS department_name
FROM hr.employees;


-- ----------------------------------------------------------------
-- 14. Display job category using DECODE
-- Question:
-- Convert selected job IDs into meaningful job categories.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    job_id,
    DECODE(
        job_id,
        'IT_PROG',    'IT Programmer',
        'SA_REP',     'Sales Representative',
        'ST_CLERK',   'Stock Clerk',
        'FI_ACCOUNT', 'Finance Accountant',
        'AD_PRES',    'President',
        'Other Job'
    ) AS job_category
FROM hr.employees;


-- ----------------------------------------------------------------
-- 15. Check commission using DECODE
-- Question:
-- If commission_pct is NULL, display 'No Commission'.
-- Otherwise display 'Gets Commission'.
--
-- Oracle DECODE can directly match NULL.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    commission_pct,
    DECODE(
        commission_pct,
        NULL, 'No Commission',
        'Gets Commission'
    ) AS commission_status
FROM hr.employees;


-- ----------------------------------------------------------------
-- 16. Calculate bonus based on department using DECODE
-- Question:
-- Department 60 -> 20% bonus
-- Department 80 -> 15% bonus
-- Department 50 -> 10% bonus
-- Other departments -> 5% bonus
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DECODE(
        department_id,
        60, salary * 0.20,
        80, salary * 0.15,
        50, salary * 0.10,
        salary * 0.05
    ) AS bonus
FROM hr.employees;



-- ================================================================
-- NULLIF() - EXAMPLES
--
-- Syntax:
-- NULLIF(expression1, expression2)
--
-- If expression1 = expression2 -> returns NULL
-- Otherwise                     -> returns expression1
-- ================================================================

- ----------------------------------------------------------------
-- 17. Compare salary with 10,000
-- Question:
-- Return NULL if salary is exactly 10,000.
-- Otherwise return the original salary.
--
-- Example:
-- salary = 10000 -> NULL
-- salary = 12000 -> 12000
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    salary,
    NULLIF(salary, 10000) AS salary_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 18. Compare department ID with 60
-- Question:
-- If department_id is 60, return NULL.
-- Otherwise return the department ID.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    NULLIF(department_id, 60) AS department_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 19. Compare job ID with IT_PROG
-- Question:
-- If job_id is IT_PROG, return NULL.
-- Otherwise return the original job ID.
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    job_id,
    NULLIF(job_id, 'IT_PROG') AS job_result
FROM hr.employees;


-- ----------------------------------------------------------------
-- 20. Combine NULLIF and NVL
-- Question:
-- If department_id is 60:
--     NULLIF returns NULL
--     NVL converts that NULL into 0
--
-- For other departments:
--     NULLIF returns the original department ID.
--
-- Example:
-- department_id = 60 -> NULLIF = NULL -> NVL = 0
-- department_id = 80 -> NULLIF = 80   -> NVL = 80
-- ----------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    department_id,
    NULLIF(department_id, 60) AS nullif_result,
    NVL(
        NULLIF(department_id, 60),
        0
    ) AS final_department_id
FROM hr.employees;












