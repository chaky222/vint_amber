-- +micrate Up
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  prof_list VARCHAR,
  slack_team_id INT,
  slack_name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS users;
