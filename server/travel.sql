-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.6.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table travel_db.addressdetails
CREATE TABLE IF NOT EXISTS `addressdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_details_user` (`user_id`),
  KEY `fk_address_details_address` (`address_id`),
  CONSTRAINT `fk_address_details_address` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_address_details_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.addressdetails: ~0 rows (approximately)
DELETE FROM `addressdetails`;
/*!40000 ALTER TABLE `addressdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressdetails` ENABLE KEYS */;

-- Dumping structure for table travel_db.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses_countries` (`country_id`),
  CONSTRAINT `fk_addresses_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.addresses: ~0 rows (approximately)
DELETE FROM `addresses`;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table travel_db.airlines
CREATE TABLE IF NOT EXISTS `airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `airline_price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.airlines: ~0 rows (approximately)
DELETE FROM `airlines`;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` (`id`, `airline_details`, `airline_price`, `createdAt`, `updatedAt`) VALUES
	(1, 'VietNam Airline', 500000, '2022-03-20 09:57:07', '2022-03-20 09:57:07');
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;

-- Dumping structure for table travel_db.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `travel_agency_id` int(11) NOT NULL,
  `outcome_id` int(11) NOT NULL,
  `status_payment_id` int(11) NOT NULL,
  `booking_details` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bookings_user` (`user_id`),
  KEY `fk_bookings_travel_agency` (`travel_agency_id`),
  KEY `fk_bookings_outcome` (`outcome_id`),
  KEY `fk_bookings_status_payment` (`status_payment_id`),
  CONSTRAINT `fk_bookings_outcome` FOREIGN KEY (`outcome_id`) REFERENCES `refbookingoutcomes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_status_payment` FOREIGN KEY (`status_payment_id`) REFERENCES `refbookingstatuspayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_travel_agency` FOREIGN KEY (`travel_agency_id`) REFERENCES `travelagencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.bookings: ~0 rows (approximately)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `user_id`, `travel_agency_id`, `outcome_id`, `status_payment_id`, `booking_details`, `createdAt`, `updatedAt`) VALUES
	(3, 2, 1, 3, 1, 'mmm', '2022-06-13 08:19:59', '2022-06-13 09:46:10'),
	(4, 2, 1, 1, 1, 'def', '2022-06-13 08:57:38', '2022-06-13 08:57:38');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumping structure for table travel_db.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `car_price` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.cars: ~0 rows (approximately)
DELETE FROM `cars`;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` (`id`, `car_details`, `car_price`, `createdAt`, `updatedAt`) VALUES
	(1, 'Taxi Mai Linh', '20000', '2022-03-20 09:57:46', '2022-03-20 09:57:46');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;

-- Dumping structure for table travel_db.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `country_image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.countries: ~1 rows (approximately)
DELETE FROM `countries`;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `country_name`, `country_image`, `createdAt`, `updatedAt`) VALUES
	(1, 'Viet Nam', 'image-1654597755703-vietnam.jpg', '2022-06-10 15:46:29', '2022-06-10 15:46:30');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table travel_db.hotels
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hotel_price` float NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.hotels: ~1 rows (approximately)
DELETE FROM `hotels`;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `hotel_details`, `hotel_price`, `createdAt`, `updatedAt`) VALUES
	(1, 'Plaza Hotel', 1000000, '2022-03-20 09:58:06', '2022-03-20 09:58:06');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumping structure for table travel_db.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `payment_amount` float NOT NULL,
  `other_details` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_booking` (`booking_id`),
  CONSTRAINT `fk_payments_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.payments: ~0 rows (approximately)
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Dumping structure for table travel_db.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `perm_description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perm_name` (`perm_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.permissions: ~26 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `perm_name`, `perm_description`, `createdAt`, `updatedAt`) VALUES
	(1, 'user_add', 'Add User', '2022-03-03 02:18:52', '2022-03-03 02:18:52'),
	(2, 'user_update', 'Update User', '2022-03-03 02:18:52', '2022-03-03 02:18:52'),
	(3, 'user_get', 'Get User', '2022-03-03 02:18:52', '2022-03-03 02:18:52'),
	(4, 'user_get_all', 'Get All User', '2022-03-03 02:18:52', '2022-03-03 02:18:52'),
	(5, 'user_delete', 'Delete User', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(6, 'role_add', 'Add Role', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(7, 'role_update', 'Update Role', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(8, 'role_get', 'Get Role', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(9, 'role_get_all', 'Get All Role', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(10, 'role_delete', 'Delete Role', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(11, 'permissions_add', 'Add Permission', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(12, 'permissions_update', 'Update Permission', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(13, 'permissions_get', 'Get Permission', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(14, 'permissions_get_all', 'Get All Permission', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(15, 'permissions_delete', 'Delete Permission', '2022-03-03 02:18:53', '2022-03-03 02:18:53'),
	(26, 'user_search', 'Search User', '2022-03-07 04:16:36', '2022-03-07 04:16:36'),
	(27, 'outcome_add', 'Add Booking Outcome', '2022-06-13 10:17:09', '2022-06-13 10:17:09'),
	(28, 'outcome_update', 'Update Booking Outcome', '2022-06-13 10:17:24', '2022-06-13 10:17:24'),
	(29, 'outcome_delete', 'Delete Booking Outcome', '2022-06-13 10:17:53', '2022-06-13 10:17:55'),
	(30, 'outcome_get', 'Get Booking Outcome', '2022-06-13 10:19:51', '2022-06-13 10:19:51'),
	(31, 'outcome_get_all', 'Get All Booking Outcome', '2022-06-13 10:20:11', '2022-06-13 10:20:11'),
	(32, 'status_payment_add', 'Add Status Payment', '2022-06-13 11:17:29', '2022-06-13 11:17:29'),
	(33, 'status_payment_update', 'Update Status Payment', '2022-06-13 11:17:47', '2022-06-13 11:17:47'),
	(34, 'status_payment_delete', 'Delete Status Payment', '2022-06-13 11:18:03', '2022-06-13 11:18:03'),
	(35, 'status_payment_get', 'Get Status Payment', '2022-06-13 11:18:30', '2022-06-13 11:18:31'),
	(36, 'status_payment_get_all', 'Get All Status Payment', '2022-06-13 11:19:02', '2022-06-13 11:19:02'),
	(37, 'booking_add', 'Add Booking', '2022-06-13 15:02:36', '2022-06-13 15:02:38'),
	(38, 'booking_get_all', 'Get All Booking', '2022-06-13 15:22:02', '2022-06-13 15:22:02'),
	(39, 'booking_get', 'Get Booking', '2022-06-13 15:58:52', '2022-06-13 15:58:53'),
	(40, 'booking_update', 'Update Booking', '2022-06-13 16:15:10', '2022-06-13 16:15:10');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table travel_db.refbookingoutcomes
CREATE TABLE IF NOT EXISTS `refbookingoutcomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outcome` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.refbookingoutcomes: ~4 rows (approximately)
DELETE FROM `refbookingoutcomes`;
/*!40000 ALTER TABLE `refbookingoutcomes` DISABLE KEYS */;
INSERT INTO `refbookingoutcomes` (`id`, `outcome`, `createdAt`, `updatedAt`) VALUES
	(1, 'waiting', '2022-06-13 03:51:34', '2022-06-13 03:51:34'),
	(2, 'success', '2022-06-13 03:51:47', '2022-06-13 03:51:47'),
	(3, 'failed', '2022-06-13 03:51:51', '2022-06-13 03:51:51'),
	(5, 'canceled', '2022-06-13 04:33:51', '2022-06-13 04:33:51');
/*!40000 ALTER TABLE `refbookingoutcomes` ENABLE KEYS */;

-- Dumping structure for table travel_db.refbookingstatuspayments
CREATE TABLE IF NOT EXISTS `refbookingstatuspayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.refbookingstatuspayments: ~5 rows (approximately)
DELETE FROM `refbookingstatuspayments`;
/*!40000 ALTER TABLE `refbookingstatuspayments` DISABLE KEYS */;
INSERT INTO `refbookingstatuspayments` (`id`, `status`, `createdAt`, `updatedAt`) VALUES
	(1, 'pending', '2022-06-13 04:32:20', '2022-06-13 04:32:20'),
	(2, 'paid', '2022-06-13 04:32:26', '2022-06-13 04:32:26'),
	(3, 'failed', '2022-06-13 04:32:44', '2022-06-13 04:32:44'),
	(4, 'canceled', '2022-06-13 04:33:03', '2022-06-13 04:33:03');
/*!40000 ALTER TABLE `refbookingstatuspayments` ENABLE KEYS */;

-- Dumping structure for table travel_db.restaurants
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.restaurants: ~0 rows (approximately)
DELETE FROM `restaurants`;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` (`id`, `restaurant_details`, `createdAt`, `updatedAt`) VALUES
	(1, 'Aura Restaurant', '2022-03-20 09:58:34', '2022-03-20 09:58:34');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;

-- Dumping structure for table travel_db.rolepermissions
CREATE TABLE IF NOT EXISTS `rolepermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `perm_id` (`perm_id`),
  CONSTRAINT `RolePermissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `RolePermissions_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `permissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.rolepermissions: ~21 rows (approximately)
DELETE FROM `rolepermissions`;
/*!40000 ALTER TABLE `rolepermissions` DISABLE KEYS */;
INSERT INTO `rolepermissions` (`id`, `role_id`, `perm_id`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, '2022-03-03 02:38:53', '2022-03-03 02:38:53'),
	(2, 1, 2, '2022-03-03 02:39:09', '2022-03-03 02:39:09'),
	(3, 1, 3, '2022-03-03 02:39:21', '2022-03-03 02:39:21'),
	(4, 1, 4, '2022-03-03 02:39:29', '2022-03-03 02:39:29'),
	(5, 1, 5, '2022-03-07 04:01:02', '2022-03-07 04:01:02'),
	(6, 1, 26, '2022-03-07 07:15:16', '2022-03-07 07:15:16'),
	(7, 1, 11, '2022-03-21 07:40:12', '2022-03-21 07:40:12'),
	(8, 1, 12, '2022-03-21 07:40:23', '2022-03-21 07:40:23'),
	(9, 1, 13, '2022-03-21 07:40:40', '2022-03-21 07:40:40'),
	(10, 1, 14, '2022-03-21 07:40:50', '2022-03-21 07:40:50'),
	(11, 1, 15, '2022-03-21 07:40:59', '2022-03-21 07:40:59'),
	(12, 1, 27, '2022-06-13 10:50:26', '2022-06-13 10:50:26'),
	(13, 1, 28, '2022-06-13 10:50:36', '2022-06-13 10:50:36'),
	(14, 1, 29, '2022-06-13 10:50:50', '2022-06-13 10:50:50'),
	(15, 1, 30, '2022-06-13 10:50:57', '2022-06-13 10:50:57'),
	(16, 1, 31, '2022-06-13 10:51:06', '2022-06-13 10:51:06'),
	(17, 1, 32, '2022-06-13 11:20:48', '2022-06-13 11:20:50'),
	(18, 1, 33, '2022-06-13 11:21:11', '2022-06-13 11:21:11'),
	(19, 1, 34, '2022-06-13 11:21:19', '2022-06-13 11:21:19'),
	(20, 1, 35, '2022-06-13 11:21:27', '2022-06-13 11:21:27'),
	(21, 1, 36, '2022-06-13 11:21:38', '2022-06-13 11:21:39'),
	(22, 1, 37, '2022-06-13 15:03:16', '2022-06-13 15:03:16'),
	(23, 2, 37, '2022-06-13 15:03:23', '2022-06-13 15:03:23'),
	(24, 1, 38, '2022-06-13 15:23:23', '2022-06-13 15:23:28'),
	(25, 2, 38, '2022-06-13 15:23:36', '2022-06-13 15:23:37'),
	(26, 1, 39, '2022-06-13 15:59:22', '2022-06-13 15:59:23'),
	(27, 2, 39, '2022-06-13 15:59:28', '2022-06-13 15:59:29'),
	(28, 1, 40, '2022-06-13 16:17:49', '2022-06-13 16:17:50'),
	(29, 2, 40, '2022-06-13 16:17:57', '2022-06-13 16:18:00');
/*!40000 ALTER TABLE `rolepermissions` ENABLE KEYS */;

-- Dumping structure for table travel_db.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `role_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role_name`, `role_description`, `createdAt`, `updatedAt`) VALUES
	(1, 'admin', 'This is Admin', '2022-03-03 02:11:08', '2022-03-03 02:11:08'),
	(2, 'customer', 'This is Customer', '2022-03-03 02:36:26', '2022-03-03 02:36:26');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table travel_db.sequelizemeta
CREATE TABLE IF NOT EXISTS `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.sequelizemeta: ~32 rows (approximately)
DELETE FROM `sequelizemeta`;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` (`name`) VALUES
	('20220214075622-create-contact.js'),
	('20220215020709-create-user.js'),
	('20220215022103-create-user.js'),
	('20220215022721-create-role.js'),
	('20220215071446-create-role.js'),
	('20220215071528-create-user.js'),
	('20220215091555-create-role.js'),
	('20220215091930-user-role-association.js'),
	('20220224042543-create-user.js'),
	('20220224042806-create-role.js'),
	('20220224042909-create-permission.js'),
	('20220224043429-create-role-permission.js'),
	('20220224043655-create-service.js'),
	('20220320080015-create-service.js'),
	('20220320082927-create-airline.js'),
	('20220320083149-create-car.js'),
	('20220320083349-create-hotel.js'),
	('20220320083446-create-restaurant.js'),
	('20220320085503-create-service-detail.js'),
	('20220320113143-create-address.js'),
	('20220320113507-create-address-detail.js'),
	('20220320143524-create-travel-agencie.js'),
	('20220320144425-create-ref-booking-outcome.js'),
	('20220320144721-create-ref-booking-status-payment.js'),
	('20220320144956-create-booking.js'),
	('20220320145324-create-service-booking.js'),
	('20220320145439-create-payments.js'),
	('20220330060426-create-token-management.js'),
	('20220607093324-create-country.js'),
	('20220609150616-add-fk-country_id-for-address.js'),
	('20220609150713-add-avatar-for-user.js'),
	('20220610081717-add-fk-country_id-for-service.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;

-- Dumping structure for table travel_db.servicebookings
CREATE TABLE IF NOT EXISTS `servicebookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `booking_start_date` date NOT NULL,
  `booking_end_date` date NOT NULL,
  `other_details` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_bookings_service` (`service_id`),
  KEY `fk_service_bookings_booking` (`booking_id`),
  CONSTRAINT `fk_service_bookings_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_service_bookings_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.servicebookings: ~0 rows (approximately)
DELETE FROM `servicebookings`;
/*!40000 ALTER TABLE `servicebookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicebookings` ENABLE KEYS */;

-- Dumping structure for table travel_db.servicedetails
CREATE TABLE IF NOT EXISTS `servicedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `airline_id` (`airline_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `car_id` (`car_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `ServiceDetails_ibfk_5` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_6` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_7` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_8` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_9` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.servicedetails: ~1 rows (approximately)
DELETE FROM `servicedetails`;
/*!40000 ALTER TABLE `servicedetails` DISABLE KEYS */;
INSERT INTO `servicedetails` (`id`, `service_id`, `airline_id`, `car_id`, `hotel_id`, `restaurant_id`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, 1, 1, NULL, '2022-06-10 15:42:21', '2022-06-10 15:42:24');
/*!40000 ALTER TABLE `servicedetails` ENABLE KEYS */;

-- Dumping structure for table travel_db.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_services_countries` (`country_id`),
  CONSTRAINT `fk_services_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.services: ~3 rows (approximately)
DELETE FROM `services`;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `service_name`, `createdAt`, `updatedAt`, `country_id`) VALUES
	(1, 'Service Spring', '2022-03-20 09:56:41', '2022-03-20 09:56:41', 1),
	(2, 'abc 1 bcd', '2022-06-13 09:15:43', '2022-06-13 09:15:44', 1),
	(3, 'mnb 2', '2022-06-13 09:16:04', '2022-06-13 09:16:05', 1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table travel_db.tokenmanagements
CREATE TABLE IF NOT EXISTS `tokenmanagements` (
  `refresh_token` varchar(512) COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_token` varchar(512) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token_secret` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `refresh_token_secret` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`refresh_token`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `fk_token_manage_auth_user` (`user_id`),
  CONSTRAINT `fk_token_manage_auth_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.tokenmanagements: ~9 rows (approximately)
DELETE FROM `tokenmanagements`;
/*!40000 ALTER TABLE `tokenmanagements` DISABLE KEYS */;
INSERT INTO `tokenmanagements` (`refresh_token`, `access_token`, `type_token`, `user_id`, `access_token_secret`, `refresh_token_secret`, `expired_at`, `createdAt`, `updatedAt`) VALUES
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJpYXQiOjE2NTQ3NDczMjQsImV4cCI6MTY4NjI4MzMyNH0.dP1d3q_bnAm6pbvkadC0KjoTOtZxqe25RhzI3fhK-TY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJpYXQiOjE2NTQ3NDczMjQsImV4cCI6MTY1NDgzMzcyNH0.GzAGtWPav4BCmUiVNIR5S5rfuwj85xYjxRAENJRTRLc', 'JWT', 3, '$2a$10$rIlAUJUhEosf2IPwY2nWDuQsYqrWw0VTD3.rntpOaeioDNPZAM/vK', '$2a$10$UzyQCKUi1IxWeMMWaSfH4OGkTQ6QbZ1byu9dfhG3poyCfC/zcgOoe', '2022-06-10 04:02:05', '2022-06-09 04:02:05', '2022-06-09 04:02:05'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU0ODQ4ODUwLCJleHAiOjE2ODYzODQ4NTB9.IY7AwcUzRusxsJRYYhs-bks0qkixLh_RHnQEZFrNnYQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU0ODQ4ODUwLCJleHAiOjE2NTQ5MzUyNTB9.-cTweZCv6BneXztBU1e2BM6Ko8qaUEn3ISqErf4yqHg', 'JWT', 3, '$2a$10$sc5uM0UW4yw2dKeO.zSXb.m7XaMzGyH4rDuuppzdTJShuGL.gxeNO', '$2a$10$eCN73Ft60zmE7KBfixVh2uxm/xtH.gUvn8ulTRrcM3D1vDBk8cbOu', '2022-06-11 08:14:11', '2022-06-10 08:14:11', '2022-06-10 08:14:11'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU1MDkyMTIyLCJleHAiOjE2ODY2MjgxMjJ9.TuRBBhAUGQyjOzb1m41P8TOaBpkBzhf7f_z-BQ8JYxE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU1MDkyMTIyLCJleHAiOjE2NTUxNzg1MjJ9.J8i7B2paQLsBvwQZo8yQIntTrfaTDqCORe78wBnykaU', 'JWT', 3, '$2a$10$bAjatRVujuyT3HL6FU/ituZVvhxJtSHzCDV6bJxvu0t4JX/ECFrSy', '$2a$10$Yi62xfvSfQ7nkNRBbpQDn.jdAP1eJC0sNgyB9qMgXT/KxiJNS2iQi', '2022-06-14 03:48:42', '2022-06-13 03:48:42', '2022-06-13 03:48:42'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU1MTA2NDE1LCJleHAiOjE2ODY2NDI0MTV9.FyIM2DerVX1-CElPnOs-lL_Nvl7kSkixqduJVRsobJY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU1MTA2NDE1LCJleHAiOjE2NTUxOTI4MTV9.bm7ntc_185Ye6FPSmRLvespbU6tfCbZ3EqsSH7O2gpM', 'JWT', 3, '$2a$10$lklk/IduVmGDmd/n1HOQu.QYfTrsMYslmNhm7AolE15QUPkDPpAiW', '$2a$10$2aWbb7eKbXNZ2RDXU3BXtObPznto1Cupvy36p5/DnFihbVzZraTCm', '2022-06-14 07:46:55', '2022-06-13 07:46:55', '2022-06-13 07:46:55'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjM5MTh9.ed5D4OBtfLJExcFJ1E2TWmIn5ISTqgXyCjan-TqkDEg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjM5MTgsImV4cCI6MTY0ODYyMzkyOH0.GVygK8f5lOvrPbYeuIhkY-Gj1IFQnAE7TkFhWGk39iw', 'JWT', 3, '$2a$10$7QYKhaa/MU4YcEpZGTnph..lE0ELh2.vUEo.gLDZQPRsLVw46KCfG', '$2a$10$nuLyY.aYVHV5d7j5bxI5ZOeVEXpZksZTDOgsPuJ1V3lqQHAVSGydS', '2022-03-30 07:05:19', '2022-03-30 07:05:19', '2022-03-30 07:05:19'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU0MTd9.gCMFduZImKbcahCHKIPHbwXer-uylAdiW24pF5m-Vu4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU0MTcsImV4cCI6MTY0ODYyNTQyN30.eiMrZhczmIDN_8dHUeYo8sRxEvr84jBrWPvx96Z69Cw', 'JWT', 3, '$2a$10$0d8wICDGtahxn8shvZ5q2e6R2Usvo1XufyJrftB8rTEbTSmeaSIPK', '$2a$10$gZ7f4ZGCbcjzz383/OL//eiFd12gXsdfcbfw/XbTNfwV7/ju.O7ZC', '2022-03-30 07:30:18', '2022-03-30 07:30:17', '2022-03-30 07:30:17'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU1MDl9.ZY6Z6WDwqyL217jfif2MLMZ-0aE9jTGQdeY3lxiT5pw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU1MDksImV4cCI6MTY0ODYyNTUxOX0.qh7le4ne1NoIgoxVwA1HpPrtDDuAU_OKRRNdbcxzxGc', 'JWT', 3, '$2a$10$r1Hzd6gLSpoG9hUnKtmDtOiS1jADcFZCFpZH6bBVbkSd8goNnAauS', '$2a$10$LSNk45jlat52IU3CM9bJA.Ois7vJNS/idbOlY7RzmazoTCI6qTAAO', '2022-03-30 07:31:59', '2022-03-30 07:31:49', '2022-03-30 07:31:49'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjUzNzh9.kecf2etvImbhbssSVjjBZV8H634B1nzP_6d2xsLMZ3g', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjUzNzgsImV4cCI6MTY0ODYyNTM4OH0.Df14L04j9bl-oGNVmlsHn9v3c9JUHRMGjOPfP5xgkyE', 'JWT', 3, '$2a$10$0bpYrqdltzdOu.W50u63ROX0XWJcB4XRGwHZsMkQn2C/DqHFrfCy6', '$2a$10$Af9Qr8qBYqsvyXo.S08iBOU9DRvlTU78YgK.ir9TAjvTikUSKFdKC', '2022-03-30 07:29:38', '2022-03-30 07:29:38', '2022-03-30 07:29:38'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3MTV9.dTC0MQTXM-f5cshErJkxxSWrX56i_x3NAAMCfwe-xi4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3MTUsImV4cCI6MTY0ODYyNjcyNX0.5gK4UDTJHFz_vAeuLo8uYsU6E0Ac6bKXq8FXCtZrDVA', 'JWT', 3, '$2a$10$2Go9ZHeLfsEkE4y3/n2L5uBI1X4jV.S9GcPdFUtD2kfE4f5OCqMfe', '$2a$10$z6lge8/PqIGt56sVPKAzbe0gcV0ESzh9KBNy0cLfN8UySraF5y80O', '2022-03-30 07:52:25', '2022-03-30 07:51:55', '2022-03-30 07:51:55'),
	('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3NjJ9.acph-eJzcDevBwAoN4IvSJTdBkkxB6FDI2I3VcEltZk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3NjIsImV4cCI6MTY0ODYyNjc3Mn0.626XvXxehHGu9B-9Rl8hvL15_kDodq-Gp8rco7D8RtY', 'JWT', 3, '$2a$10$3ajq4H./E72P3UOq8AcNF.TT4y0Yjp3Sr4t28qkJF/UMXACA5FXL6', '$2a$10$5yNYYeSoYtkqDQkkk3PmlOTD8I9CJ4U.K3sVqwecig3.sCgdoVMjO', '2022-03-30 07:52:53', '2022-03-30 07:52:43', '2022-03-30 07:52:43');
/*!40000 ALTER TABLE `tokenmanagements` ENABLE KEYS */;

-- Dumping structure for table travel_db.travelagencies
CREATE TABLE IF NOT EXISTS `travelagencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_agency_details` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.travelagencies: ~0 rows (approximately)
DELETE FROM `travelagencies`;
/*!40000 ALTER TABLE `travelagencies` DISABLE KEYS */;
INSERT INTO `travelagencies` (`id`, `travel_agency_details`, `createdAt`, `updatedAt`) VALUES
	(1, 'Agency 1', '2022-06-13 14:07:58', '2022-06-13 14:07:58');
/*!40000 ALTER TABLE `travelagencies` ENABLE KEYS */;

-- Dumping structure for table travel_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_avatar` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_phone` (`user_phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table travel_db.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `user_fullname`, `user_email`, `user_phone`, `user_password`, `role_id`, `createdAt`, `updatedAt`, `user_avatar`) VALUES
	(2, 'Test', 'test@gmail.com', '123456789', '$2a$10$8S28A0mF8m8iPmnqsRzTS.1mlDG1CrjdG1YXYAulK4FfAMYXuAePO', 2, '2022-03-03 02:40:09', '2022-03-03 02:40:09', NULL),
	(3, 'Nguyen Huy', 'nguyenquochuyhbt3@gmail.com', '037511913111', '$2a$10$zrt5ex/xRY3wWmmdo0RoGO7xZKirNZSlrwDJ99XZk3WFl.p/7lFIi', 1, '2022-03-20 06:53:14', '2022-03-20 06:53:14', NULL),
	(6, 'Nguyen Huy', 'nguyenquochuyhbt4@gmail.com', '0375119131111', '$2a$10$0sV//qsj7BqOcwsJCYsRFuTybuQ3pvHgWGA9F6dOaBDSOd5LUKylC', 1, '2022-03-21 09:06:13', '2022-03-21 09:06:13', NULL),
	(8, 'Nguyen Huy', 'nguyenquochuyhbt5@gmail.com', '03751191', '$2a$10$WJdfmcqzGSdbs1L..hL5EuuaT7nN/MFzxd/uyGaYTYTGIHDxt5S2e', 1, '2022-03-21 14:55:07', '2022-03-21 14:55:07', NULL),
	(9, 'Hoang Duc', 'hoangduc@gmail.com', '0909222333', '$2a$10$E61Zbt0.Vu0V/srT1vUnyuBm2o5.8b4mcptrf4VvI1WmRAY/KiCjK', 1, '2022-06-09 03:37:04', '2022-06-09 03:37:04', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
