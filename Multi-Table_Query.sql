-- Category Table
create table category(
    id int unsigned primary key auto_increment comment 'Primary Key ID',
    name varchar(20) not null unique comment 'Category Name',
    type tinyint unsigned not null comment 'Type 1 Types of Dishes 2 Types of Setmeal',
    sort tinyint unsigned not null comment 'Sequences',
    status tinyint unsigned not null default 0 comment 'Condition 0 Disable，1 Enable',
    create_time datetime not null comment 'Date of creation',
    update_time datetime not null comment 'Updated date'
) comment 'category' ;

-- Dish Table
create table dish(
    id int unsigned primary key auto_increment comment 'Primary Key ID',
    name varchar(20) not null unique comment 'Name of Dishes',
    category_id int unsigned not null comment 'Categories of dishes ID',
    price decimal(8, 2) not null comment 'Dish Price',
    image varchar(300) not null comment 'Dish Image',
    description varchar(200) comment 'Dish Description',
    status tinyint unsigned not null default 0 comment 'Condition 0 Disable，1 Enable',
    create_time datetime not null comment 'Date of creation',
    update_time datetime not null comment 'Updated date',
    foreign key (category_id) references category(id)
) comment 'dish';

-- Setmeal Table
create table setmeal(
    id int unsigned primary key auto_increment comment 'Primary Key ID',
    name varchar(20) not null unique comment 'Name of Setmeal',
    category_id int unsigned not null comment 'Setmeal id',
    price decimal(8, 2) not null comment 'Setmeal price',
    image varchar(300) not null comment 'Setmeal image',
    description varchar(200) comment 'Setmeal description',
    status tinyint unsigned not null default 0 comment 'Condition 0 Disable，1 Enable',
    create_time datetime not null comment 'Date of creation',
    update_time datetime not null comment 'Updated date',
    foreign key (category_id) references category(id)
)comment 'Setmeal' ;

-- Setmeal Menu Correlation Table
create table setmeal_dish(
    id int unsigned primary key auto_increment comment 'Primary Key ID',
    setmeal_id int unsigned not null comment 'Setmeal id ',
    dish_id int unsigned not null comment 'Dish id',
    copies tinyint unsigned not null comment 'copies'
    foreign key (setmeal_id) references setmeal(id),
    foreign key (dish_id) references dish(id)
)comment 'Setmeal_dish Table';

-- ================================== Import Test Data ====================================
-- category
insert into category (id, type, name, sort, status, create_time, update_time) values (1, 1, 'Drinking', 10, 1, '2022-08-09 22:09:18', '2022-08-09 22:09:18');
insert into category (id, type, name, sort, status, create_time, update_time) values (2, 1, 'Staple Food', 9, 1, '2022-08-09 22:09:32', '2022-08-09 22:18:53');
insert into category (id, type, name, sort, status, create_time, update_time) values (3, 2, 'Popular Setmeal', 12, 1, '2022-08-09 22:11:38', '2022-08-10 11:04:40');
insert into category (id, type, name, sort, status, create_time, update_time) values (4, 2, 'Business Setmeal', 13, 1, '2022-08-09 22:14:10', '2022-08-10 11:04:48');
insert into category (id, type, name, sort, status, create_time, update_time) values (5, 1, 'Main Meal', 6, 1, '2022-08-09 22:17:42', '2022-08-09 22:17:42');
insert into category (id, type, name, sort, status, create_time, update_time) values (6, 1, 'Seasonal Vegetables', 7, 1, '2022-08-09 22:18:12', '2022-08-09 22:18:28');
insert into category (id, type, name, sort, status, create_time, update_time) values (7, 1, 'Soup Dish', 11, 1, '2022-08-10 10:51:47', '2022-08-10 10:51:47');

-- dish
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (1,'Wang Lao Ji', 1, 6.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (2,'Bei Bing Yang', 1, 4.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', "It's the same flavor as when I was a kid.", 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (3,'Beer', 1, 4.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (4,'Rice', 2, 2.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 'Selected Jasmine Rice', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (5,'Steamed Bun', 2, 1.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 'High-quality Flour', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (6,'Laotan pickled cabbage fish', 5, 38.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png', 'Ingredients: soup, grass carp, pickle', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (7,'Classic Catfish with Sauerkraut', 5, 42.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 'Ingredients: sauerkraut, fish balls, catfish', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (8,'Sichuan Style Poached Grass Carp', 5, 20.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 'Ingredients: grass carp, broth', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (9,'Stir-fried baby greens', 6, 20.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', 'Ingredients: baby greens', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (10,'Baby Cabbage with Garlic Sauce', 6, 20.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 'Ingredients: garlic, baby vegetables', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (11,'Stir-fried Broccoli', 6, 20.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', 'Ingredients: Broccoli', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (12,'Stir Fried Cabbage with Chili Sauce', 6, 20.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', 'Ingredients: Chinese cabbage', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (13,'Steamed Sea Bass', 5, 60.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 'Ingredients: sea bass', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (14,'Dongpo Elbow', 5, 88.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 'Ingredients: Pork Knuckle Sticks', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (15,'Steamed Pork with Preserved Vegetables', 5, 42.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', 'Ingredients: pork, preserved vegetables', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (16,'Minced Pepper Fish Head', 5, 48.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 'Ingredients: chub, chopped peppers', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (17,'Egg Soup', 7, 12.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 'Ingredients: egg, seaweed', 1, '2022-06-10 10:54:25', '2022-06-10 10:54:25');
insert into dish (id, name, category_id, price, image, description, status, create_time, update_time) values (18,'Oyster Mushroom and Tofu Soup', 7, 15.00, 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 'Ingredients: tofu, flat mushrooms', 1, '2022-06-10 10:55:02', '2022-06-10 10:55:02');

-- setmeal
insert into setmeal (id, category_id, name, price, status, description, image, create_time, update_time) values (1, 4, 'Business Setmeal A', 13.00, 1, '', 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/21a5ed3a-97f6-447a-af9d-53deabfb5661.png', '2022-06-10 10:58:09', '2022-06-10 10:58:09');
insert into setmeal (id, category_id, name, price, status, description, image, create_time, update_time) values (2, 4, 'Business Setmeal B', 15.00, 1, '', 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/8d0075f8-9008-4390-94ca-2ca631440304.png', '2022-06-10 11:00:13', '2022-06-10 11:11:37');
insert into setmeal (id, category_id, name, price, status, description, image, create_time, update_time) values (3, 3, 'Popular Setmeal A', 13.00, 1, '', 'https://reggie-itcast.oss-cn-beijing.aliyuncs.com/8979566b-0e17-462b-81d8-8dbace4138f4.png', '2022-06-10 11:11:23', '2022-06-10 11:11:23');

-- setmeal_dish
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (1, 1, 1, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (2, 1, 4, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (3, 1, 11, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (4, 2, 2, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (5, 2, 4, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (6, 2, 9, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (7, 3, 2, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (8, 3, 6, 1);
insert into setmeal_dish (id, setmeal_id, dish_id, copies) values (9, 3, 5, 1);



-- 1. Search for the name and price of dishes priced below $10 and their category names.
SELECT dish.name DishName, dish.price DishPrice, category.name CategoryName FROM dish INNER JOIN category ON dish.category_id = category.id WHERE dish.price < 10;


-- 2. Search for the name, price, and category name of all dishes priced between $10 and $50 with the status 'Enable' (even if the dish is not categorized, you need to search for the dish).
SELECT dish.name DishName, dish.price DishPrice, category.name CategoryName FROM dish LEFT JOIN category ON dish.category_id = category.id WHERE dish.price BETWEEN 10 AND 50 AND dish.status = 1;

-- 3. Queries the most expensive dish in each category, showing the name of the category and the price of the most expensive dish.
SELECT category.name CategoryName, MAX(dish.price) as MaxPrice FROM dish INNER JOIN category ON dish.category_id = category.id GROUP BY category.name;

-- 4. Query the name of the category whose status is 'On Sale' and whose total number of items is greater than or equal to 3.
SELECT category.name CategoryName FROM dish INNER JOIN category ON dish.category_id = category.id WHERE dish.status = 1 GROUP BY category.name HAVING COUNT(dish.id) >= 3;

-- 5. Find out what dishes are included in the "Business Package A" (show the name of the package, the price, the name of the dishes included, the price and the number of servings).
SELECT setmeal.name SetmealName, setmeal.price SetmealPrice, dish.name DishName, dish.price DishPrice, setmeal_dish.copies Copies From setmeal INNER JOIN setmeal_dish on setmeal.id = setmeal_dish.setmeal_id INNER JOIN dish ON setmeal_dish.dish_id = dish.id WHERE setmeal.name = "Business Setmeal A";

-- 6. Find out the dishes that are below the average price of the dish (show the name of the dish and the price of the dish).
SELECT name DishName, price DishPrice FROM dish WHERE price (SELECT AVG(price) FROM dish);

