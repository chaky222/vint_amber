-- +micrate Up
CREATE TABLE orders (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  number Integer,
  status TinyInt,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS orders;
