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
