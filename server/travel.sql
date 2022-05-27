-- Adminer 4.8.1 MySQL 5.7.35 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `travel_db`;
CREATE DATABASE `travel_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `travel_db`;

DROP TABLE IF EXISTS `AddressDetails`;
CREATE TABLE `AddressDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_details_user` (`user_id`),
  KEY `fk_address_details_address` (`address_id`),
  CONSTRAINT `fk_address_details_address` FOREIGN KEY (`address_id`) REFERENCES `Addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_address_details_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Addresses`;
CREATE TABLE `Addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Airlines`;
CREATE TABLE `Airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airline_price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Airlines` (`id`, `airline_details`, `airline_price`, `createdAt`, `updatedAt`) VALUES
(1,	'VietNam Airline',	500000,	'2022-03-20 09:57:07',	'2022-03-20 09:57:07');

DROP TABLE IF EXISTS `Bookings`;
CREATE TABLE `Bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `travel_agency_id` int(11) NOT NULL,
  `outcome_id` int(11) NOT NULL,
  `status_payment_id` int(11) NOT NULL,
  `booking_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bookings_user` (`user_id`),
  KEY `fk_bookings_travel_agency` (`travel_agency_id`),
  KEY `fk_bookings_outcome` (`outcome_id`),
  KEY `fk_bookings_status_payment` (`status_payment_id`),
  CONSTRAINT `fk_bookings_outcome` FOREIGN KEY (`outcome_id`) REFERENCES `RefBookingOutcomes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_status_payment` FOREIGN KEY (`status_payment_id`) REFERENCES `RefBookingStatusPayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_travel_agency` FOREIGN KEY (`travel_agency_id`) REFERENCES `TravelAgencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bookings_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Cars`;
CREATE TABLE `Cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `car_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Cars` (`id`, `car_details`, `car_price`, `createdAt`, `updatedAt`) VALUES
(1,	'Taxi Mai Linh',	'20000',	'2022-03-20 09:57:46',	'2022-03-20 09:57:46');

DROP TABLE IF EXISTS `Hotels`;
CREATE TABLE `Hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Hotels` (`id`, `hotel_details`, `hotel_price`, `createdAt`, `updatedAt`) VALUES
(1,	'Plaza Hotel',	'1000000',	'2022-03-20 09:58:06',	'2022-03-20 09:58:06');

DROP TABLE IF EXISTS `Payments`;
CREATE TABLE `Payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `payment_amount` float NOT NULL,
  `other_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_booking` (`booking_id`),
  CONSTRAINT `fk_payments_booking` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Permissions`;
CREATE TABLE `Permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perm_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perm_name` (`perm_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Permissions` (`id`, `perm_name`, `perm_description`, `createdAt`, `updatedAt`) VALUES
(1,	'user_add',	'Add User',	'2022-03-03 02:18:52',	'2022-03-03 02:18:52'),
(2,	'user_update',	'Update User',	'2022-03-03 02:18:52',	'2022-03-03 02:18:52'),
(3,	'user_get',	'Get User',	'2022-03-03 02:18:52',	'2022-03-03 02:18:52'),
(4,	'user_get_all',	'Get All User',	'2022-03-03 02:18:52',	'2022-03-03 02:18:52'),
(5,	'user_delete',	'Delete User',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(6,	'role_add',	'Add Role',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(7,	'role_update',	'Update Role',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(8,	'role_get',	'Get Role',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(9,	'role_get_all',	'Get All Role',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(10,	'role_delete',	'Delete Role',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(11,	'permissions_add',	'Add Permission',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(12,	'permissions_update',	'Update Permission',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(13,	'permissions_get',	'Get Permission',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(14,	'permissions_get_all',	'Get All Permission',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(15,	'permissions_delete',	'Delete Permission',	'2022-03-03 02:18:53',	'2022-03-03 02:18:53'),
(26,	'user_search',	'Search User',	'2022-03-07 04:16:36',	'2022-03-07 04:16:36');

DROP TABLE IF EXISTS `RefBookingOutcomes`;
CREATE TABLE `RefBookingOutcomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outcome_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `RefBookingStatusPayments`;
CREATE TABLE `RefBookingStatusPayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Restaurants`;
CREATE TABLE `Restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Restaurants` (`id`, `restaurant_details`, `createdAt`, `updatedAt`) VALUES
(1,	'Aura Restaurant',	'2022-03-20 09:58:34',	'2022-03-20 09:58:34');

DROP TABLE IF EXISTS `RolePermissions`;
CREATE TABLE `RolePermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `perm_id` (`perm_id`),
  CONSTRAINT `RolePermissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `RolePermissions_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `Permissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `RolePermissions` (`id`, `role_id`, `perm_id`, `createdAt`, `updatedAt`) VALUES
(1,	1,	1,	'2022-03-03 02:38:53',	'2022-03-03 02:38:53'),
(2,	1,	2,	'2022-03-03 02:39:09',	'2022-03-03 02:39:09'),
(3,	1,	3,	'2022-03-03 02:39:21',	'2022-03-03 02:39:21'),
(4,	1,	4,	'2022-03-03 02:39:29',	'2022-03-03 02:39:29'),
(5,	1,	5,	'2022-03-07 04:01:02',	'2022-03-07 04:01:02'),
(6,	1,	26,	'2022-03-07 07:15:16',	'2022-03-07 07:15:16'),
(7,	1,	11,	'2022-03-21 07:40:12',	'2022-03-21 07:40:12'),
(8,	1,	12,	'2022-03-21 07:40:23',	'2022-03-21 07:40:23'),
(9,	1,	13,	'2022-03-21 07:40:40',	'2022-03-21 07:40:40'),
(10,	1,	14,	'2022-03-21 07:40:50',	'2022-03-21 07:40:50'),
(11,	1,	15,	'2022-03-21 07:40:59',	'2022-03-21 07:40:59');

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE `Roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Roles` (`id`, `role_name`, `role_description`, `createdAt`, `updatedAt`) VALUES
(1,	'admin',	'This is Admin',	'2022-03-03 02:11:08',	'2022-03-03 02:11:08'),
(2,	'customer',	'This is Customer',	'2022-03-03 02:36:26',	'2022-03-03 02:36:26');

DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `SequelizeMeta` (`name`) VALUES
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
('alter-user-add-avatar-column.js');

DROP TABLE IF EXISTS `ServiceBookings`;
CREATE TABLE `ServiceBookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `booking_start_date` date NOT NULL,
  `booking_end_date` date NOT NULL,
  `other_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_bookings_service` (`service_id`),
  KEY `fk_service_bookings_booking` (`booking_id`),
  CONSTRAINT `fk_service_bookings_booking` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_service_bookings_service` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `ServiceDetails`;
CREATE TABLE `ServiceDetails` (
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
  CONSTRAINT `ServiceDetails_ibfk_5` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_6` FOREIGN KEY (`airline_id`) REFERENCES `Airlines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_7` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_8` FOREIGN KEY (`car_id`) REFERENCES `Cars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ServiceDetails_ibfk_9` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Services`;
CREATE TABLE `Services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Services` (`id`, `service_name`, `createdAt`, `updatedAt`) VALUES
(1,	'Service Spring',	'2022-03-20 09:56:41',	'2022-03-20 09:56:41');

DROP TABLE IF EXISTS `TokenManagements`;
CREATE TABLE `TokenManagements` (
  `refresh_token` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_token_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `refresh_token_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`refresh_token`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `fk_token_manage_auth_user` (`user_id`),
  CONSTRAINT `fk_token_manage_auth_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `TokenManagements` (`refresh_token`, `access_token`, `type_token`, `user_id`, `access_token_secret`, `refresh_token_secret`, `expired_at`, `createdAt`, `updatedAt`) VALUES
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MDQ3ODQ0LCJleHAiOjE2ODA1ODM4NDR9._lm_BOQ5ZTXGw7iaZQWFQZwMCE4tAxA5aUqSGtIEe1c',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MDQ4MDMzLCJleHAiOjE2NDkwNDgwNjN9.8Z-3gaIekc5yhuNJGog8Ddx19Nt057YDq1VW9zCnbvA',	'JWT',	3,	'$2a$10$Som8jRUxCxNIp5rkI6ZECOI9QghRi67jvdmFaDLENDj/ASDw.BGKi',	'$2a$10$3z.FEgl2NB5JcjjJ1iK9POgdXfAR/hBJdlo59NjXsbiF6XFy6JHqy',	'2022-04-04 04:54:23',	'2022-04-04 04:50:44',	'2022-04-04 04:53:53'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MDQ4MjU3LCJleHAiOjE2ODA1ODQyNTd9.VCEiAdRuF7BKsPSatpYJr3ra-zXJkzymhH2qZ6C74Yo',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MDQ4MjU3LCJleHAiOjE2NDkxMzQ2NTd9.RTv3JH5OsOfWy51E-9V4ITd1jswpIZZ1fd_dvxDyKH0',	'JWT',	3,	'$2a$10$9NNOYGOFwCfVb3P2WwHqD.SvfQzh/Wtct74mroHJFG7/llT0IT9M6',	'$2a$10$ImX07cJHr1aYpP9hYqFjmODNy8nsPORukW4/GaXgE/7TCIconJheK',	'2022-04-05 04:57:37',	'2022-04-04 04:57:37',	'2022-04-04 04:57:37'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjE2MzM4LCJleHAiOjE2ODA3NTIzMzh9.VsJx-6S3i6PLvtpJeUZDpPkRtt4nCvmrhn_7J5XGwRo',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjE2MzM4LCJleHAiOjE2NDkzMDI3Mzh9.T3D2-4cFQdDL1qWPATGIpy9Xht9G3DMulQuwj58qVr4',	'JWT',	3,	'$2a$10$HK5a/DRwQe99DcZYlBGkEOnlMyKps5gqRpx3Md10w1hrX9it2RHh2',	'$2a$10$cKm0AQ1dRudioumQ/UsIWOdJp20sj5BGh1r3jDXR1Xq3MAjjeKsu.',	'2022-04-07 03:38:59',	'2022-04-06 03:38:59',	'2022-04-06 03:38:59'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjE2NDk1LCJleHAiOjE2ODA3NTI0OTV9.c6iASVx0cyFOP4qM0KtC5NzhrcvOmk3t7Zq0LLsTHa0',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjE2NDk1LCJleHAiOjE2NDkzMDI4OTV9.VzQGzCDgQT3pGdO307PZc-KTKmFhNg1yXB9ygD7Gha8',	'JWT',	3,	'$2a$10$12kJ8.e2bt.tz11KboIEPuKc.H09mCemtYUNB57ho9KZ1ajXReza2',	'$2a$10$ism2Ht8ImmQW3/QlsTA1f.7FbO79X6Yb8ZhYc7hFke94rHUX/ftCe',	'2022-04-07 03:41:35',	'2022-04-06 03:41:35',	'2022-04-06 03:41:35'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjEyNzUxLCJleHAiOjE2ODA3NDg3NTF9.6H6-bdhZff10BNAWsi0cxqLh0og_v2GwPnxB8CkkjLA',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5MjEyNzUxLCJleHAiOjE2NDkyOTkxNTF9.Us_SXeliflDnfeaCs1EAxODA8ByWPfu4aXHDgbRsyFE',	'JWT',	3,	'$2a$10$TEla8sv6LqeQy8.0j6kEcOSXKWTQ9nbqO4eqY5cz4o6jr/j3Ay38W',	'$2a$10$13GMC2OzRfUifIyKfqfMVu2JVZ3fn3wLUcwwpLS7IQqlaXqfDc3M.',	'2022-04-07 02:39:11',	'2022-04-06 02:39:11',	'2022-04-06 02:39:11'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzU4NTkzLCJleHAiOjE2ODEyOTQ1OTN9.VNlJiCrxz_7stHcP71mEKim28ZutS47AGeb45Rl2fpU',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzU4NTkzLCJleHAiOjE2NDk4NDQ5OTN9.x1br7vhCRV9X-Fox6OAwlGUP2m6w8EIY4JlPdQK0ERk',	'JWT',	3,	'$2a$10$bpYUYesNfPqoe8k2mN1B0./o7wAuOkU6LRqPPBcOOYdhSWEW4h2GS',	'$2a$10$xNlrxkPradIjCj0F3U/VPeiTWzMxQPfDCTCOwC.D3tZqSZHW7XRom',	'2022-04-13 10:16:33',	'2022-04-12 10:16:33',	'2022-04-12 10:16:33'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzU5NTU1LCJleHAiOjE2ODEyOTU1NTV9.2LJwy7BSQCtmq8FYJcEmAoeBe3B9eyaCsj3_C3HeR2g',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzU5NTU1LCJleHAiOjE2NDk4NDU5NTV9.AiLj0GVRkAS7nohiatfdlihSyXk2KMvD0JmT9CAH8sY',	'JWT',	3,	'$2a$10$F.82fYhwGijdZ5obnmeNweWs7QxAals2D6IESBtLgCKBAWOvppAVG',	'$2a$10$NDIjYzlPsa6JQXMMfX5eTu0xQn19NLBz.LidUAf8AOIV9qjbUugHm',	'2022-04-13 10:32:35',	'2022-04-12 10:32:35',	'2022-04-12 10:32:35'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzYxMTQ0LCJleHAiOjE2ODEyOTcxNDR9.H8_9EnZXu58e4iXCXNtYflv5Zpqt6V_cB8CLsyFIKfg',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJ1c2VyX2F2YXRhciI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMy0yMFQwNjo1MzoxNC4wMDBaIiwiaWF0IjoxNjQ5NzYxMTQ0LCJleHAiOjE2NDk4NDc1NDR9.5cxGO1ASdD01lXw-G-jMD1la7tp4h-ZJ1-PWDNe9aCM',	'JWT',	3,	'$2a$10$naweEFx768ju5joRqiocvun3ck7eRHXEkEyBbVrX43wVI0D3ayOVS',	'$2a$10$p.rInjPdVEatzUSKvWdieexYnzMxol0sUwDrr4mYDi9G/Tl6rCHTa',	'2022-04-13 10:59:04',	'2022-04-12 10:59:04',	'2022-04-12 10:59:04');

DROP TABLE IF EXISTS `TravelAgencies`;
CREATE TABLE `TravelAgencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_agency_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_avatar` longblob,
  `role_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_phone` (`user_phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Users` (`id`, `user_fullname`, `user_email`, `user_phone`, `user_password`, `user_avatar`, `role_id`, `createdAt`, `updatedAt`) VALUES
(2,	'Test',	'test@gmail.com',	'123456789',	'$2a$10$8S28A0mF8m8iPmnqsRzTS.1mlDG1CrjdG1YXYAulK4FfAMYXuAePO',	NULL,	2,	'2022-03-03 02:40:09',	'2022-03-03 02:40:09'),
(3,	'Nguyen Huy',	'nguyenquochuyhbt3@gmail.com',	'037511913111',	'$2a$10$zrt5ex/xRY3wWmmdo0RoGO7xZKirNZSlrwDJ99XZk3WFl.p/7lFIi',	NULL,	1,	'2022-03-20 06:53:14',	'2022-03-20 06:53:14'),
(6,	'Nguyen Huy',	'nguyenquochuyhbt4@gmail.com',	'0375119131111',	'$2a$10$0sV//qsj7BqOcwsJCYsRFuTybuQ3pvHgWGA9F6dOaBDSOd5LUKylC',	NULL,	1,	'2022-03-21 09:06:13',	'2022-03-21 09:06:13'),
(8,	'Nguyen Huy',	'nguyenquochuyhbt5@gmail.com',	'03751191',	'$2a$10$WJdfmcqzGSdbs1L..hL5EuuaT7nN/MFzxd/uyGaYTYTGIHDxt5S2e',	NULL,	1,	'2022-03-21 14:55:07',	'2022-03-21 14:55:07'),
(9,	'Test',	'test12@gmail.com',	'1234567891',	'$2a$10$fJlRN8ULC9ZCCXu50zcOYeQ6EyUaPQmx.yqMLx1jzgNJoaE94smEO',	NULL,	2,	'2022-04-04 04:54:17',	'2022-04-04 04:54:17'),
(12,	'Test',	'test123@gmail.com',	'12345678911',	'$2a$10$qb82SwBAOUy19P9N4Z/vBOfJc5CoddaYu1Nah.5.bXrMv75cRF4te',	'',	2,	'2022-04-04 05:00:23',	'2022-04-04 05:00:23'),
(14,	'test',	'abc123@gmail.com',	'123',	'$2a$10$BOIF/GWNsiXbMFT1R4hl0.CfW9Sl2NZdttyuotMIOIQU7FnlF/XU.',	NULL,	1,	'2022-04-06 02:35:18',	'2022-04-06 02:35:18');

-- 2022-04-23 07:41:03