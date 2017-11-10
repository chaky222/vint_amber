-- +micrate Up
CREATE TABLE IF NOT EXISTS users (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30),
  prof_list VARCHAR(255),
  slack_team_id TinyInt,
  slack_name VARCHAR(30),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- +micrate Down
DROP TABLE IF EXISTS users;
