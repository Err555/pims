CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    role_name VARCHAR(30) NOT NULL
);

INSERT INTO roles
VALUES
    (1, 'officer'),
    (2, 'beneficiary');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    middlename VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    password VARCHAR(200) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO
    users
VALUES
    (
        1,
        'Admin',
        'Admin',
        'Admin',
        1,
        'admin123'
    );

INSERT INTO
    users
VALUES
    (2, 'Saidi', 'Iddi', 'Brambath', 2, 'saidi');

CREATE TABLE company_employer(
    id SERIAL PRIMARY KEY,
    employer_no VARCHAR(30) NOT NULL UNIQUE,
    employer_name VARCHAR(40) NOT NULL
);

INSERT INTO
    company_employer (employer_no, employer_name)
VALUES
    ('123456', 'VODACOM');

CREATE TABLE beneficiary(
    id SERIAL PRIMARY KEY,
    card_number VARCHAR (40) NOT NULL UNIQUE,
    company_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (company_id) REFERENCES company_employer (id)
);

INSERT INTO
    beneficiary
VALUES
    (1, '100100', 1, 2);

CREATE TABLE contributions (
    id SERIAL PRIMARY KEY,
    amount_paid VARCHAR(20) NOT NULL,
    month_paid VARCHAR(13) NOT NULL,
    year_paid VARCHAR(4) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO
    contributions
VALUES
    (1, '20000', 'MARCH', '2020', 2);

INSERT INTO
    contributions
VALUES
    (2, '45000', 'DECEMBER', '2022', 2);

INSERT INTO
    contributions
VALUES
    (3, '60000', 'APRIL', '2022', 2);