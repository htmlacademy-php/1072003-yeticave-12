INSERT INTO category (name, symbol_code)
VALUES ('Доски и лыжи', 'boards'), ('Крепления', 'attachment'), ('Ботинки', 'boots'), ('Одежда', 'clothing'), ('Инструменты', 'tools'), ('Разное', 'other');

INSERT INTO users (date_registration, email, name, password, contact)
VALUES (NOW(), 'met@gmail.com', 'Met', 'secret', '123-45-67'), (NOW(), 'tom@gmail.com', 'Tom', 'secret', '223-45-67');


INSERT INTO lots (date_create, name, title, url_img, start_cost, date_end, step_bet, user_id, category_id)
VALUES (NOW(), '2014 Rossignol District Snowboard', 'Доски и лыжи', 'img/lot-1.jpg', 10999, DATE_ADD(NOW(), INTERVAL 1 DAY), 1000, 1, 1),
('2020-08-01', 'DC Ply Mens 2016/2017 Snowboard', 'Доски и лыжи', 'img/lot-2.jpg', 159999, DATE_ADD(NOW(), INTERVAL 1 DAY), 10000, 2, 1),
('2020-07-31', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления', 'img/lot-3.jpg', 8000, DATE_ADD(NOW(), INTERVAL 1 DAY), 500, 1, 2),
('2020-08-10', 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки', 'img/lot-4.jpg', 10999, DATE_ADD(NOW(), INTERVAL 1 DAY), 1000, 1, 3),
(DATE_ADD(NOW(), INTERVAL -1 HOUR), 'Куртка для сноуборда DC Mutiny Charocal', 'Одежда', 'img/lot-5.jpg', 7500, DATE_ADD(NOW(), INTERVAL 1 DAY), 500, 2, 4),
('2020-08-15', 'Маска Oakley Canopy', 'Разное', 'img/lot-6.jpg', 5400, DATE_ADD(NOW(), INTERVAL 1 DAY), 100, 2, 5);

INSERT INTO bet (date_rate, sum, user_id, lot_id)
VALUES (NOW(), 12000, 2, 1), (DATE_ADD(NOW(), INTERVAL + 1 HOUR), 14000, 2, 1);

/* получить все категории */
SELECT name FROM category;

/* получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, текущую цену, название категории */

SELECT name, start_cost, url_img FROM lots;

SELECT lots.*,
(SELECT sum FROM bet WHERE bet.lot_id = lots.id
ORDER BY bet.id DESC LIMIT 1) as current_cost
FROM lots;

SELECT lots.*, category.name
FROM lots
LEFT JOIN category ON lots.category_id = category.id
ORDER BY date_create DESC;

/* показать лот по его id. Получить также название категории, к которой принадлежит лот */

SELECT * FROM lots WHERE id = 2;

SELECT lots.*, category.name
FROM lots
LEFT JOIN category ON lots.category_id = category.id;

/* обновить название лота по его идентификатору */
UPDATE lots SET name = 'Oakley Canopy' WHERE id = 6;

/* получить список ставок для лота по его идентификатору с сортировкой по дате */
SELECT bet.*, lots.id
FROM bet
JOIN bet ON bet.lot_id = lots.id
ORDER BY date_rate;
