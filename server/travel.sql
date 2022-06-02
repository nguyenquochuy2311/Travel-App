-- Adminer 4.8.1 MySQL 8.0.29 dump

SET NAMES utf8;

SET time_zone = '+00:00';

SET foreign_key_checks = 0;

SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `AddressDetails`;

CREATE TABLE `AddressDetails` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `address_id` int NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_address_details_user` (`user_id`),
    KEY `fk_address_details_address` (`address_id`),
    CONSTRAINT `fk_address_details_address` FOREIGN KEY (`address_id`) REFERENCES `Addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_address_details_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Addresses`;

CREATE TABLE `Addresses` (
    `id` int NOT NULL AUTO_INCREMENT,
    `address_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Airlines`;

CREATE TABLE `Airlines` (
    `id` int NOT NULL AUTO_INCREMENT,
    `airline_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `airline_price` float NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Bookings`;

CREATE TABLE `Bookings` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `travel_agency_id` int NOT NULL,
    `outcome_id` int NOT NULL,
    `status_payment_id` int NOT NULL,
    `booking_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Cars`;

CREATE TABLE `Cars` (
    `id` int NOT NULL AUTO_INCREMENT,
    `car_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `car_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Hotels`;

CREATE TABLE `Hotels` (
    `id` int NOT NULL AUTO_INCREMENT,
    `hotel_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `hotel_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Payments`;

CREATE TABLE `Payments` (
    `id` int NOT NULL AUTO_INCREMENT,
    `booking_id` int NOT NULL,
    `payment_amount` float NOT NULL,
    `other_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_payments_booking` (`booking_id`),
    CONSTRAINT `fk_payments_booking` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Permissions`;

CREATE TABLE `Permissions` (
    `id` int NOT NULL AUTO_INCREMENT,
    `perm_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `perm_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `perm_name` (`perm_name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `RefBookingOutcomes`;

CREATE TABLE `RefBookingOutcomes` (
    `id` int NOT NULL AUTO_INCREMENT,
    `outcome_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `RefBookingStatusPayments`;

CREATE TABLE `RefBookingStatusPayments` (
    `id` int NOT NULL AUTO_INCREMENT,
    `status_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Restaurants`;

CREATE TABLE `Restaurants` (
    `id` int NOT NULL AUTO_INCREMENT,
    `restaurant_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `RolePermissions`;

CREATE TABLE `RolePermissions` (
    `id` int NOT NULL AUTO_INCREMENT,
    `role_id` int DEFAULT NULL,
    `perm_id` int DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `role_id` (`role_id`),
    KEY `perm_id` (`perm_id`),
    CONSTRAINT `RolePermissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT `RolePermissions_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `Permissions` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Roles`;

CREATE TABLE `Roles` (
    `id` int NOT NULL AUTO_INCREMENT,
    `role_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `role_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `role_name` (`role_name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `SequelizeMeta`;

CREATE TABLE `SequelizeMeta` (
    `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`name`),
    UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `ServiceBookings`;

CREATE TABLE `ServiceBookings` (
    `id` int NOT NULL AUTO_INCREMENT,
    `service_id` int NOT NULL,
    `booking_id` int NOT NULL,
    `booking_start_date` date NOT NULL,
    `booking_end_date` date NOT NULL,
    `other_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_service_bookings_service` (`service_id`),
    KEY `fk_service_bookings_booking` (`booking_id`),
    CONSTRAINT `fk_service_bookings_booking` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_service_bookings_service` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `ServiceDetails`;

CREATE TABLE `ServiceDetails` (
    `id` int NOT NULL AUTO_INCREMENT,
    `service_id` int NOT NULL,
    `airline_id` int DEFAULT NULL,
    `car_id` int DEFAULT NULL,
    `hotel_id` int DEFAULT NULL,
    `restaurant_id` int DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `service_id` (`service_id`),
    KEY `airline_id` (`airline_id`),
    KEY `restaurant_id` (`restaurant_id`),
    KEY `car_id` (`car_id`),
    KEY `hotel_id` (`hotel_id`),
    CONSTRAINT `ServiceDetails_ibfk_5` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ServiceDetails_ibfk_6` FOREIGN KEY (`airline_id`) REFERENCES `Airlines` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT `ServiceDetails_ibfk_7` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT `ServiceDetails_ibfk_8` FOREIGN KEY (`car_id`) REFERENCES `Cars` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE,
        CONSTRAINT `ServiceDetails_ibfk_9` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Services`;

CREATE TABLE `Services` (
    `id` int NOT NULL AUTO_INCREMENT,
    `service_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `TokenManagements`;

CREATE TABLE `TokenManagements` (
    `refresh_token` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `access_token` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `type_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `user_id` int NOT NULL,
    `access_token_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `refresh_token_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `expired_at` datetime NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`refresh_token`),
    UNIQUE KEY `access_token` (`access_token`),
    KEY `fk_token_manage_auth_user` (`user_id`),
    CONSTRAINT `fk_token_manage_auth_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `TravelAgencies`;

CREATE TABLE `TravelAgencies` (
    `id` int NOT NULL AUTO_INCREMENT,
    `travel_agency_details` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_fullname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `user_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `user_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `user_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
    `user_avatar` longblob,
    `role_id` int DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_email` (`user_email`),
    UNIQUE KEY `user_phone` (`user_phone`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`) ON DELETE
    SET
        NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;

INSERT INTO
    `Users` (
        `id`,
        `user_fullname`,
        `user_email`,
        `user_phone`,
        `user_password`,
        `user_avatar`,
        `role_id`,
        `createdAt`,
        `updatedAt`
    )
VALUES
    (
        2,
        'aaa',
        'nguyenquochuyhbt@gmail.com',
        '123456789',
        '$2a$10$8S28A0mF8m8iPmnqsRzTS.1mlDG1CrjdG1YXYAulK4FfAMYXuAePO',
        NULL,
        1,
        '2022-03-03 02:40:09',
        '2022-05-27 09:21:55'
    ),
    (
        3,
        'Nguyen Huy',
        'nguyenquochuyhbt3@gmail.com',
        '037511913111',
        '$2a$10$zrt5ex/xRY3wWmmdo0RoGO7xZKirNZSlrwDJ99XZk3WFl.p/7lFIi',
        NULL,
        1,
        '2022-03-20 06:53:14',
        '2022-03-20 06:53:14'
    ),
    (
        6,
        'Nguyen Huy',
        'nguyenquochuyhbt4@gmail.com',
        '0375119131111',
        '$2a$10$0sV//qsj7BqOcwsJCYsRFuTybuQ3pvHgWGA9F6dOaBDSOd5LUKylC',
        NULL,
        1,
        '2022-03-21 09:06:13',
        '2022-03-21 09:06:13'
    ),
    (
        8,
        'Nguyen Huy',
        'nguyenquochuyhbt5@gmail.com',
        '03751191',
        '$2a$10$WJdfmcqzGSdbs1L..hL5EuuaT7nN/MFzxd/uyGaYTYTGIHDxt5S2e',
        NULL,
        1,
        '2022-03-21 14:55:07',
        '2022-03-21 14:55:07'
    ),
    (
        9,
        'Test',
        'test12@gmail.com',
        '1234567891',
        '$2a$10$fJlRN8ULC9ZCCXu50zcOYeQ6EyUaPQmx.yqMLx1jzgNJoaE94smEO',
        NULL,
        2,
        '2022-04-04 04:54:17',
        '2022-04-04 04:54:17'
    ),
    (
        12,
        'Test',
        'test123@gmail.com',
        '12345678911',
        '$2a$10$qb82SwBAOUy19P9N4Z/vBOfJc5CoddaYu1Nah.5.bXrMv75cRF4te',
        '',
        2,
        '2022-04-04 05:00:23',
        '2022-04-04 05:00:23'
    ),
    (
        14,
        'test',
        'abc123@gmail.com',
        '123',
        '$2a$10$BOIF/GWNsiXbMFT1R4hl0.CfW9Sl2NZdttyuotMIOIQU7FnlF/XU.',
        NULL,
        1,
        '2022-04-06 02:35:18',
        '2022-04-06 02:35:18'
    );

-- 2022-06-02 15:19:22