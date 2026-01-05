-- Customers table
CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    signup_date     DATE NOT NULL,
    country         TEXT,
    acquisition_channel TEXT
);

-- Plans table
CREATE TABLE plans (
    plan_id     SERIAL PRIMARY KEY,
    plan_name   TEXT NOT NULL,
    monthly_price NUMERIC(10,2) NOT NULL
);

-- Subscriptions table
CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id     INT REFERENCES customers(customer_id),
    plan_id         INT REFERENCES plans(plan_id),
    start_date      DATE NOT NULL,
    end_date        DATE
);

-- Insert plans
INSERT INTO plans (plan_name, monthly_price) VALUES
('Basic', 19.00),
('Pro', 49.00),
('Enterprise', 199.00);

-- Insert customers
INSERT INTO customers (signup_date, country, acquisition_channel) VALUES
('2023-01-15', 'Germany', 'Google Ads'),
('2023-02-03', 'France', 'Referral'),
('2023-02-20', 'Netherlands', 'LinkedIn Ads'),
('2023-03-05', 'Spain', 'Organic'),
('2023-03-18', 'Italy', 'Google Ads'),
('2023-04-02', 'UK', 'Referral');

-- Insert subscriptions
INSERT INTO subscriptions (customer_id, plan_id, start_date, end_date) VALUES
(1, 2, '2023-01-15', NULL),
(2, 1, '2023-02-03', '2023-07-03'),
(3, 2, '2023-02-20', NULL),
(4, 1, '2023-03-05', '2023-06-05'),
(5, 3, '2023-03-18', NULL),
(6, 2, '2023-04-02', '2023-10-02');
