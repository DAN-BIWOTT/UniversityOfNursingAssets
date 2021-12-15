CREATE TABLE `client` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `admin_id` int,
  `created_at` timestamp AUTO_INCREMENT
);

CREATE TABLE `admin` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `created_at` timestamp AUTO_INCREMENT
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `due_time` int,
  `status` int,
  `subject` varchar(255),
  `nature` varchar(255),
  `pages` int,
  `price` int,
  `budget` varchar(255),
  `format` varchar(255),
  `spacing` varchar(255),
  `order_id` int
);

CREATE TABLE `transaction` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `receipt` varchar(255),
  `order_id` int,
  `client_id` int
);

CREATE TABLE `product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `price` int,
  `nature` varchar(255),
  `description` varchar(255),
  `admin_id` int
);

CREATE TABLE `file` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `address` varchar(255),
  `order_id` int
);

ALTER TABLE `order` ADD FOREIGN KEY (`order_id`) REFERENCES `client` (`id`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

ALTER TABLE `file` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `client` ADD FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);
