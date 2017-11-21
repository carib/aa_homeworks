DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER NOT NULL,
  
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Arthur', 'Miller'),
  ('Eugene', 'O''Neill'),
    ('Ernest', 'Hemingway');
  
INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Whats my name?', 'Is it Arthur?', (SELECT id FROM users WHERE fname = 'Arthur')),
  ('What?', 'Is', (SELECT id FROM users WHERE fname = 'Eugene'));
  
INSERT INTO
  question_follows (follower_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Arthur'), (SELECT id FROM questions WHERE title = 'What?')),
    ((SELECT id FROM users WHERE fname = 'Eugene'), (SELECT id FROM questions WHERE title = 'Whats my name?')),
    ((SELECT id FROM users WHERE fname = 'Ernest'), (SELECT id FROM questions WHERE title = 'Whats my name?'));
      
INSERT INTO
  replies (body, question_id, user_id)
VALUES
  ('Yes, your name is Arthur', (SELECT id FROM questions WHERE title = 'Whats my name?'), (SELECT id FROM users WHERE fname = 'Eugene'));

INSERT INTO
  replies (body, question_id, user_id, parent_id)
VALUES
  ('Thank you!', (SELECT id FROM questions WHERE title = 'Whats my name?'), (SELECT id FROM users WHERE fname = 'Arthur'), 1);
  
INSERT INTO
  question_likes (user_id, question_id)
  VALUES
    ((SELECT id FROM users WHERE fname = 'Arthur'), (SELECT id FROM questions WHERE title = 'What?')),
        ((SELECT id FROM users WHERE fname = 'Eugene'), (SELECT id FROM questions WHERE title = 'Whats my name?'));
  
  
  