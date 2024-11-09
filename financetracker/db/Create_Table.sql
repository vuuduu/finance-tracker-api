-- NOTES: Don't forget to commit each tables -- 

DROP TABLE IF EXISTS ft.tracker_account;
DROP TABLE IF EXISTS ft.monthly_tracker;
DROP TABLE IF EXISTS ft.account;
DROP TABLE IF EXISTS ft.credit_card;
DROP TABLE IF EXISTS ft.bank_account;
DROP TABLE IF EXISTS ft.transaction_type;
DROP TABLE IF EXISTS ft.transaction_table;
DROP TABLE IF EXISTS ft.income_transaction;
DROP TABLE IF EXISTS ft.expense_transaction;
DROP TABLE IF EXISTS ft.payoff_transaction;
DROP TABLE IF EXISTS ft.income_category;
DROP TABLE IF EXISTS ft.expense_category;
DROP TABLE IF EXISTS ft.payoff_category;


CREATE TABLE ft.tracker_account (
    ta_id SERIAL PRIMARY KEY,                       -- tracker account id
    username VARCHAR(50) UNIQUE,
    password CHARACTER VARYING,
    account_name VARCHAR(100)
);

CREATE TABLE ft.monthly_tracker (
    mt_id SERIAL PRIMARY KEY,                       -- monthly tracker id
    ta_id INTEGER NOT NULL,
    month INTEGER NOT NULL, 
    year INTEGER NOT NULL,
    memo TEXT,
    CONSTRAINT uq_taId_month_year UNIQUE(ta_id, month, year),
    CONSTRAINT fk_tracker_account 
        FOREIGN KEY(ta_id) 
            REFERENCES ft.tracker_account(ta_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE ft.account (
    account_id SERIAL PRIMARY KEY,
    account_type VARCHAR(50),                       -- It's checking, saving, or credit card
    account_name VARCHAR(50),                       -- Name of the account information, Discover, Bilt, Ally, etc...
    last_update TIMESTAMP
);

CREATE TABLE ft.credit_card (
    cc_id SERIAL PRIMARY KEY,
    account_id INTEGER UNIQUE,
    credit_limit NUMERIC(7, 0),
    balance NUMERIC(6, 2),
    year_opened NUMERIC(4, 0),
    CONSTRAINT fk_account_id                       -- give constraint the name
        FOREIGN KEY(account_id) REFERENCES ft.account(account_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE ft.bank_account (                      -- checking or savings
    ba_id SERIAL PRIMARY KEY,
    account_id INTEGER UNIQUE,
    balance NUMERIC(6, 2),
    CONSTRAINT fk_account_id                        -- give constraint the name
        FOREIGN KEY(account_id) REFERENCES ft.account(account_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE ft.transaction_type (
    trx_type_id SERIAL PRIMARY KEY,
    trx_type VARCHAR(50) UNIQUE
);

CREATE TABLE ft.expense_category (
    ec_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);

CREATE TABLE ft.income_category (
    ic_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);

CREATE TABLE ft.payoff_category (
    pc_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);

CREATE TABLE ft.transaction_table (
    trx_id UUID PRIMARY KEY,
    mt_id INTEGER NOT NULL,                         -- reference the monthly_tracker table
    date DATE,
    amount NUMERIC(4, 2) NOT NULL,
    payment_type VARCHAR(50),                       -- It's debit, credit, or cash (might index this out)
    trx_type_id INTEGER,                            -- reference the transaction_type table (expense, payoff, or income)
    memo TEXT,
    CONSTRAINT fk_mt_id
        FOREIGN KEY(mt_id) REFERENCES ft.monthly_tracker(mt_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_trx_type_id
        FOREIGN KEY(trx_type_id) REFERENCES ft.transaction_type(trx_type_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE ft.expense_transaction (
    et_id SERIAL PRIMARY KEY,
    trx_id UUID UNIQUE,                        -- transaction table id
    vendor VARCHAR(100),
    ec_id INTEGER,                      -- Expense category
    account_id INTEGER,                 -- which account does this expense trx belong to
    CONSTRAINT fk_trx_id    
        FOREIGN KEY(trx_id) REFERENCES ft.transaction_table(trx_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_ec_id   
        FOREIGN KEY(ec_id) REFERENCES ft.expense_category(ec_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE,
    CONSTRAINT fk_account_id    
        FOREIGN KEY (account_id) REFERENCES ft.account(account_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE ft.income_transaction (
    it_id SERIAL PRIMARY KEY,
    trx_id UUID UNIQUE,                 -- transaction table id (1-to-1 relationship)
    source VARCHAR(100),
    ic_id INTEGER,                      -- income category id
    account_id INTEGER,                 -- which account does the amount belong to.
    CONSTRAINT fk_trx_id
        FOREIGN KEY(trx_id) REFERENCES ft.transaction_table(trx_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_ic_id
        FOREIGN KEY(ic_id) REFERENCES ft.income_category(ic_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE,
    CONSTRAINT fk_account_id    
        FOREIGN KEY (account_id) REFERENCES ft.account(account_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE ft.payoff_transaction (
    pt_id SERIAL PRIMARY KEY,
    trx_id UUID UNIQUE,
    pc_id INTEGER,
    account_from INTEGER,
    account_to INTEGER,
    CONSTRAINT fk_trx_id
        FOREIGN KEY(trx_id) REFERENCES ft.transaction_table(trx_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_pc_id  
        FOREIGN KEY(pc_id) REFERENCES ft.payoff_category(pc_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE,
    CONSTRAINT fk_account_from    
        FOREIGN KEY (account_from) REFERENCES ft.account(account_id)
            ON DELETE SET NULL  
            ON UPDATE CASCADE,
    CONSTRAINT fk_account_to    
        FOREIGN KEY (account_to) REFERENCES ft.account(account_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);
