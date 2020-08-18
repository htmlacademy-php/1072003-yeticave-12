INSERT INTO category (name)
VALUES ('Доски и лыжи'), ('Крепления'), ('Ботинки'), ('Одежда'), ('Инструменты'), ('Разное');

INSERT INTO category (symbol_code)
VALUES ('boards'), ('attachment'), ('boots'), ('clothing'), ('tools'), ('other');

INSERT INTO users
SET date_registration = NOW(), email = 'met@gmail.com', name = 'Met', password = 'secret', contact = '123-45-67';

INSERT INTO users
SET date_registration = NOW(), email = 'tom@gmail.com', name = 'Tom', password = 'secret', contact = '223-45-67';

SELECT lots.*, users.name, category.name
FROM lots
JOIN users ON lots.user_id = users.id
JOIN category ON lots.category_id = category.id;

INSERT INTO lots
SET date_create = NOW(); name = '2014 Rossignol District Snowboard', title = 'Доска', url_img = 'img/lot-1.jpg',
start_cost = 10999, date_end = NOW(), step_bet = 1000, user_id = 1, category_id = 1;

