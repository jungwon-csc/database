-- 拡張モジュール(UUID生成用): 1度だけ
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1部署テーブル(参照用)
CREATE TABLE departments (
dept_id serial PRIMARY KEY,
dept_name text NOT NULL UNIQUE,
created_at timestamptz NOT NULL DEFAULT now()
);
INSERT INTO departments (dept_name) VALUES
('Engineering'),
('Sales'),
('HR');
-- 2従業員テーブル(多彩な型と制約を盛り込む)
CREATE TABLE employees (
emp_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
dept_id int NOT NULL REFERENCES departments(dept_id),
emp_code varchar(10) NOT NULL UNIQUE,
full_name text NOT NULL,
email text NOT NULL UNIQUE,
salary_yen numeric(12,0) NOT NULL CHECK (salary_yen >= 0),
joined_on date NOT NULL,
is_active boolean NOT NULL DEFAULT TRUE,
profile jsonb NOT NULL DEFAULT '{}'::jsonb,
created_at timestamptz NOT NULL DEFAULT now()
);
-- 3初期データ
INSERT INTO employees
(dept_id, emp_code, full_name, email, salary_yen, joined_on, profile)
VALUES
(1, 'E0001', '山田 太郎', 'taro.yamada@example.com', 6000000, '2023-04-01','{"hobby":"cycling","skills":["Go","PostgreSQL"]}'),
(2, 'S0001', '佐藤 花子', 'hanako.sato@example.com', 5500000, '2024-01-15','{"hobby":"travel","cert":"Salesforce"}'),
(1, 'E0002', 'John Smith', 'john.smith@example.com', 7000000, '2022-11-01','{"hobby":"guitar"}');