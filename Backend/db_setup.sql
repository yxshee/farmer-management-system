CREATE TABLE register (
    rid INT AUTO_INCREMENT PRIMARY KEY,
    farmername VARCHAR(50),
    adharnumber VARCHAR(50),
    age INT,
    gender VARCHAR(50),
    phonenumber VARCHAR(50),
    address VARCHAR(50),
    farming VARCHAR(50)
);

CREATE TABLE addagroproducts (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    productname VARCHAR(100),
    productdesc VARCHAR(300),
    price INT
);

CREATE TABLE trig (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fid INT,
    action VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
