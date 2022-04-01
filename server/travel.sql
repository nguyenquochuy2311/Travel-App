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
('20220330060426-create-token-management.js');

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
  `refresh_token` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
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
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjM5MTh9.ed5D4OBtfLJExcFJ1E2TWmIn5ISTqgXyCjan-TqkDEg',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjM5MTgsImV4cCI6MTY0ODYyMzkyOH0.GVygK8f5lOvrPbYeuIhkY-Gj1IFQnAE7TkFhWGk39iw',	'JWT',	3,	'$2a$10$7QYKhaa/MU4YcEpZGTnph..lE0ELh2.vUEo.gLDZQPRsLVw46KCfG',	'$2a$10$nuLyY.aYVHV5d7j5bxI5ZOeVEXpZksZTDOgsPuJ1V3lqQHAVSGydS',	'2022-03-30 07:05:19',	'2022-03-30 07:05:19',	'2022-03-30 07:05:19'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU0MTd9.gCMFduZImKbcahCHKIPHbwXer-uylAdiW24pF5m-Vu4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU0MTcsImV4cCI6MTY0ODYyNTQyN30.eiMrZhczmIDN_8dHUeYo8sRxEvr84jBrWPvx96Z69Cw',	'JWT',	3,	'$2a$10$0d8wICDGtahxn8shvZ5q2e6R2Usvo1XufyJrftB8rTEbTSmeaSIPK',	'$2a$10$gZ7f4ZGCbcjzz383/OL//eiFd12gXsdfcbfw/XbTNfwV7/ju.O7ZC',	'2022-03-30 07:30:18',	'2022-03-30 07:30:17',	'2022-03-30 07:30:17'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU1MDl9.ZY6Z6WDwqyL217jfif2MLMZ-0aE9jTGQdeY3lxiT5pw',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjU1MDksImV4cCI6MTY0ODYyNTUxOX0.qh7le4ne1NoIgoxVwA1HpPrtDDuAU_OKRRNdbcxzxGc',	'JWT',	3,	'$2a$10$r1Hzd6gLSpoG9hUnKtmDtOiS1jADcFZCFpZH6bBVbkSd8goNnAauS',	'$2a$10$LSNk45jlat52IU3CM9bJA.Ois7vJNS/idbOlY7RzmazoTCI6qTAAO',	'2022-03-30 07:31:59',	'2022-03-30 07:31:49',	'2022-03-30 07:31:49'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjUzNzh9.kecf2etvImbhbssSVjjBZV8H634B1nzP_6d2xsLMZ3g',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjUzNzgsImV4cCI6MTY0ODYyNTM4OH0.Df14L04j9bl-oGNVmlsHn9v3c9JUHRMGjOPfP5xgkyE',	'JWT',	3,	'$2a$10$0bpYrqdltzdOu.W50u63ROX0XWJcB4XRGwHZsMkQn2C/DqHFrfCy6',	'$2a$10$Af9Qr8qBYqsvyXo.S08iBOU9DRvlTU78YgK.ir9TAjvTikUSKFdKC',	'2022-03-30 07:29:38',	'2022-03-30 07:29:38',	'2022-03-30 07:29:38'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3MTV9.dTC0MQTXM-f5cshErJkxxSWrX56i_x3NAAMCfwe-xi4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3MTUsImV4cCI6MTY0ODYyNjcyNX0.5gK4UDTJHFz_vAeuLo8uYsU6E0Ac6bKXq8FXCtZrDVA',	'JWT',	3,	'$2a$10$2Go9ZHeLfsEkE4y3/n2L5uBI1X4jV.S9GcPdFUtD2kfE4f5OCqMfe',	'$2a$10$z6lge8/PqIGt56sVPKAzbe0gcV0ESzh9KBNy0cLfN8UySraF5y80O',	'2022-03-30 07:52:25',	'2022-03-30 07:51:55',	'2022-03-30 07:51:55'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3NjJ9.acph-eJzcDevBwAoN4IvSJTdBkkxB6FDI2I3VcEltZk',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcl9mdWxsbmFtZSI6Ik5ndXllbiBIdXkiLCJ1c2VyX2VtYWlsIjoibmd1eWVucXVvY2h1eWhidDNAZ21haWwuY29tIiwidXNlcl9waG9uZSI6IjAzNzUxMTkxMzExMSIsInVzZXJfcGFzc3dvcmQiOiIkMmEkMTAkenJ0NWV4L3hSWTN3V21tZG8wUm9HTzd4Wktpck5aU2xyd0RKOTlYWmszV0ZsLnAvN2xGSWkiLCJyb2xlX2lkIjoxLCJjcmVhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIyLTAzLTIwVDA2OjUzOjE0LjAwMFoiLCJpYXQiOjE2NDg2MjY3NjIsImV4cCI6MTY0ODYyNjc3Mn0.626XvXxehHGu9B-9Rl8hvL15_kDodq-Gp8rco7D8RtY',	'JWT',	3,	'$2a$10$3ajq4H./E72P3UOq8AcNF.TT4y0Yjp3Sr4t28qkJF/UMXACA5FXL6',	'$2a$10$5yNYYeSoYtkqDQkkk3PmlOTD8I9CJ4U.K3sVqwecig3.sCgdoVMjO',	'2022-03-30 07:52:53',	'2022-03-30 07:52:43',	'2022-03-30 07:52:43');

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
  `role_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_phone` (`user_phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `Users` (`id`, `user_fullname`, `user_email`, `user_phone`, `user_password`, `role_id`, `createdAt`, `updatedAt`) VALUES
(2,	'Test',	'test@gmail.com',	'123456789',	'$2a$10$8S28A0mF8m8iPmnqsRzTS.1mlDG1CrjdG1YXYAulK4FfAMYXuAePO',	2,	'2022-03-03 02:40:09',	'2022-03-03 02:40:09'),
(3,	'Nguyen Huy',	'nguyenquochuyhbt3@gmail.com',	'037511913111',	'$2a$10$zrt5ex/xRY3wWmmdo0RoGO7xZKirNZSlrwDJ99XZk3WFl.p/7lFIi',	1,	'2022-03-20 06:53:14',	'2022-03-20 06:53:14'),
(6,	'Nguyen Huy',	'nguyenquochuyhbt4@gmail.com',	'0375119131111',	'$2a$10$0sV//qsj7BqOcwsJCYsRFuTybuQ3pvHgWGA9F6dOaBDSOd5LUKylC',	1,	'2022-03-21 09:06:13',	'2022-03-21 09:06:13'),
(8,	'Nguyen Huy',	'nguyenquochuyhbt5@gmail.com',	'03751191',	'$2a$10$WJdfmcqzGSdbs1L..hL5EuuaT7nN/MFzxd/uyGaYTYTGIHDxt5S2e',	1,	'2022-03-21 14:55:07',	'2022-03-21 14:55:07');

-- 2022-03-31 04:17:16