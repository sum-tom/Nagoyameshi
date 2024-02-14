 SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を無効にする
 
 DROP TABLE IF EXISTS admin;
 CREATE TABLE IF NOT EXISTS admin (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     email VARCHAR(255) NOT NULL UNIQUE,
     password VARCHAR(255) NOT NULL,  
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );

DROP TABLE IF EXISTS users;
 CREATE TABLE IF NOT EXISTS users (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL,
     furigana VARCHAR(50) NOT NULL,
     postal_code VARCHAR(50) NOT NULL,
     address VARCHAR(255) NOT NULL,
     phone_number VARCHAR(50) NOT NULL,
     email VARCHAR(255) NOT NULL UNIQUE,
     password VARCHAR(255) NOT NULL,    
     role_id INT NOT NULL, 
     enabled BOOLEAN NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
     FOREIGN KEY (role_id) REFERENCES roles (id)
 );

 DROP TABLE IF EXISTS resevations;
  CREATE TABLE IF NOT EXISTS reservations (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     reservation_time TIME NOT NULL,
     reservation_date DATE NOT NULL,
     number_of_people INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (shop_id) REFERENCES shops (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );

 DROP TABLE IF EXISTS reviews;
 CREATE TABLE IF NOT EXISTS reviews (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     review_rating VARCHAR(50) NOT NULL,
     review_comment VARCHAR(50) NOT NULL,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (shop_id) REFERENCES shops (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
     
 );
  
 
 DROP TABLE IF EXISTS roles;
 CREATE TABLE IF NOT EXISTS roles (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL
 );
 
 DROP TABLE IF EXISTS categories;
 CREATE TABLE IF NOT EXISTS categories (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
 );
 
  
 DROP TABLE IF EXISTS shops;
 CREATE TABLE IF NOT EXISTS shops (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_id INT NOT NULL,
     name VARCHAR(50) NOT NULL,  
     image_name VARCHAR(255),
     description VARCHAR(255) NOT NULL,
     price_upper_limit INT NOT NULL,
     price_lower_limit INT NOT NULL,
     opening_hours TIME NOT NULL,
     closing_hours TIME NOT NULL,
     postal_code VARCHAR(50) NOT NULL,
     address VARCHAR(255) NOT NULL,
     phone_number VARCHAR(50) NOT NULL,
     regular_holiday VARCHAR(255) NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (category_id) REFERENCES categories (id)
 );
 
 
 
 DROP TABLE IF EXISTS company;
 CREATE TABLE IF NOT EXISTS company (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL,
     postal_code VARCHAR(50) NOT NULL,
     address VARCHAR(255) NOT NULL,
     description VARCHAR(255) NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     
 );
 
 DROP TABLE IF EXISTS favorites;
 CREATE TABLE IF NOT EXISTS favorites  (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (shop_id) REFERENCES shops (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );
   
 SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再度有効にする