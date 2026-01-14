
Create table customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100),
date_of_birth DATE,
gender CHAR(1),
employment_type VARCHAR(100),
annual_income Decimal (12,2),
city VARCHAR(50),
Created_at DATE
) Engine=innoDB;


Create table accounts (
account_id INT AUTO_INCREMENT Primary key,
customer_id INT,
account_type VARCHAR(20),
balance DECIMAL(12,2),
opened_date DATE,
status VARCHAR(20),
foreign key (customer_id) references customers(customer_id)
) Engine = InnoDB;

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL(12,2),
    transaction_type ENUM('DEBIT','CREDIT'),
    description VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
) ENGINE=InnoDB;


CREATE TABLE credit_scores (
    customer_id INT,
    score INT,
    score_date DATE,
    PRIMARY KEY (customer_id, score_date),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB;


CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(4,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB;

CREATE TABLE repayments (
    repayment_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT,
    due_date DATE,
    paid_date DATE,
    amount_due DECIMAL(12,2),
    amount_paid DECIMAL(12,2),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
) ENGINE=InnoDB;


INSERT INTO customers 
(full_name, date_of_birth, gender, employment_type, annual_income, city, created_at)
VALUES
('Rahul Sharma','1996-05-12','M','Salaried',850000,'Delhi','2022-01-10'),
('Ananya Gupta','1994-08-23','F','Self-Employed',1200000,'Mumbai','2021-11-05'),
('Vikram Singh','1989-02-18','M','Salaried',600000,'Jaipur','2023-03-15');

INSERT INTO accounts
(customer_id, account_type, balance, opened_date, status)
VALUES
(1,'Savings',120000,'2022-01-15','ACTIVE'),
(2,'Current',450000,'2021-11-10','ACTIVE'),
(3,'Savings',30000,'2023-03-20','ACTIVE');

INSERT INTO loans
(customer_id, loan_type, loan_amount, interest_rate, start_date, end_date, status)
VALUES
(1,'Home Loan',2500000,8.5,'2022-02-01','2042-02-01','ACTIVE'),
(2,'Business Loan',1500000,10.5,'2021-12-01','2026-12-01','ACTIVE'),
(3,'Personal Loan',300000,14.0,'2023-04-01','2026-04-01','ACTIVE');

INSERT INTO repayments
(loan_id, due_date, paid_date, amount_due, amount_paid)
VALUES
(1,'2024-01-01','2024-01-05',25000,25000),
(2,'2024-01-01',NULL,30000,0),
(3,'2024-01-01','2024-01-02',12000,12000);





