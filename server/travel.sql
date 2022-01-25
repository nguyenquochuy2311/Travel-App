-- Adminer 4.8.1 PostgreSQL 14.1 (Debian 14.1-1.pgdg110+1) dump

\connect "travel";

DROP TABLE IF EXISTS "addresses";
DROP SEQUENCE IF EXISTS addresses_address_id_seq;
CREATE SEQUENCE addresses_address_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."addresses" (
    "address_id" integer DEFAULT nextval('addresses_address_id_seq') NOT NULL,
    "address_details" integer NOT NULL,
    CONSTRAINT "addresses_pkey" PRIMARY KEY ("address_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "airlines";
DROP SEQUENCE IF EXISTS airlines_airline_id_seq;
CREATE SEQUENCE airlines_airline_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."airlines" (
    "airline_id" integer DEFAULT nextval('airlines_airline_id_seq') NOT NULL,
    "airline_details" text NOT NULL,
    "airline_price" money NOT NULL,
    "service_id" integer NOT NULL,
    CONSTRAINT "airlines_pkey" PRIMARY KEY ("airline_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bookings";
DROP SEQUENCE IF EXISTS bookings_booking_id_seq;
CREATE SEQUENCE bookings_booking_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bookings" (
    "booking_id" integer DEFAULT nextval('bookings_booking_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    "outcome_code" integer NOT NULL,
    "status_code" integer NOT NULL,
    "travel_agency_id" integer NOT NULL,
    "date_of_booking" timestamp NOT NULL,
    "booking_details" text NOT NULL,
    CONSTRAINT "bookings_pkey" PRIMARY KEY ("booking_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "cars";
DROP SEQUENCE IF EXISTS cars_car_id_seq;
CREATE SEQUENCE cars_car_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."cars" (
    "car_id" integer DEFAULT nextval('cars_car_id_seq') NOT NULL,
    "car_details" text NOT NULL,
    "car_price" money NOT NULL,
    "service_id" integer NOT NULL,
    CONSTRAINT "cars_pkey" PRIMARY KEY ("car_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "customer_addresses";
DROP SEQUENCE IF EXISTS customer_addresses_customer_address_id_seq;
CREATE SEQUENCE customer_addresses_customer_address_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."customer_addresses" (
    "customer_address_id" integer DEFAULT nextval('customer_addresses_customer_address_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    "address_id" integer NOT NULL,
    "date_from" date NOT NULL,
    "date_to" date NOT NULL,
    CONSTRAINT "customer_addresses_pkey" PRIMARY KEY ("customer_address_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "customers";
DROP SEQUENCE IF EXISTS customers_customer_id_seq;
CREATE SEQUENCE customers_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."customers" (
    "customer_id" integer DEFAULT nextval('customers_customer_id_seq') NOT NULL,
    "customer_details" text NOT NULL,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customer_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hotels";
DROP SEQUENCE IF EXISTS hotels_hotel_id_seq;
CREATE SEQUENCE hotels_hotel_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."hotels" (
    "hotel_id" integer DEFAULT nextval('hotels_hotel_id_seq') NOT NULL,
    "hotel_details" text NOT NULL,
    "hotel_price" money NOT NULL,
    "service_id" integer NOT NULL,
    CONSTRAINT "hotels_pkey" PRIMARY KEY ("hotel_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "payments";
DROP SEQUENCE IF EXISTS payments_payment_id_seq;
CREATE SEQUENCE payments_payment_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."payments" (
    "payment_id" integer DEFAULT nextval('payments_payment_id_seq') NOT NULL,
    "booking_id" integer NOT NULL,
    "payment_amount" money NOT NULL,
    "payment_date" timestamp NOT NULL,
    "other_details" text NOT NULL,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("payment_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ref_booking_outcomes";
DROP SEQUENCE IF EXISTS ref_booking_outcomes_outcome_code_seq;
CREATE SEQUENCE ref_booking_outcomes_outcome_code_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ref_booking_outcomes" (
    "outcome_code" integer DEFAULT nextval('ref_booking_outcomes_outcome_code_seq') NOT NULL,
    "outcome_description" text NOT NULL,
    CONSTRAINT "ref_booking_outcomes_pkey" PRIMARY KEY ("outcome_code")
) WITH (oids = false);


DROP TABLE IF EXISTS "ref_booking_status";
DROP SEQUENCE IF EXISTS ref_booking_status_status_code_seq;
CREATE SEQUENCE ref_booking_status_status_code_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ref_booking_status" (
    "status_code" integer DEFAULT nextval('ref_booking_status_status_code_seq') NOT NULL,
    "status_description" text NOT NULL,
    CONSTRAINT "ref_booking_status_pkey" PRIMARY KEY ("status_code")
) WITH (oids = false);


DROP TABLE IF EXISTS "restaurants";
DROP SEQUENCE IF EXISTS restaurants_restaurant_id_seq;
CREATE SEQUENCE restaurants_restaurant_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."restaurants" (
    "restaurant_id" integer DEFAULT nextval('restaurants_restaurant_id_seq') NOT NULL,
    "restaurant_details" text NOT NULL,
    "restaurant_price" money NOT NULL,
    "service_id" integer NOT NULL,
    CONSTRAINT "restaurants_pkey" PRIMARY KEY ("restaurant_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_bookings";
CREATE TABLE "public"."service_bookings" (
    "service_id" integer NOT NULL,
    "booking_id" integer NOT NULL,
    "booking_start_date" timestamp NOT NULL,
    "booking_end_date" timestamp NOT NULL,
    "other_details" text NOT NULL,
    CONSTRAINT "service_bookings_service_id_booking_id" PRIMARY KEY ("service_id", "booking_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "services";
DROP SEQUENCE IF EXISTS services_service_id_seq;
CREATE SEQUENCE services_service_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."services" (
    "service_id" integer DEFAULT nextval('services_service_id_seq') NOT NULL,
    "service_details" text NOT NULL,
    "service_price" money NOT NULL,
    CONSTRAINT "services_pkey" PRIMARY KEY ("service_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "travel_agencies";
DROP SEQUENCE IF EXISTS travel_agencies_travel_agency_id_seq;
CREATE SEQUENCE travel_agencies_travel_agency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;

CREATE TABLE "public"."travel_agencies" (
    "travel_agency_id" integer DEFAULT nextval('travel_agencies_travel_agency_id_seq') NOT NULL,
    "travel_agency_details" text NOT NULL,
    CONSTRAINT "travel_agencies_pkey" PRIMARY KEY ("travel_agency_id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."airlines" ADD CONSTRAINT "airlines_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."bookings" ADD CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bookings" ADD CONSTRAINT "bookings_outcome_code_fkey" FOREIGN KEY (outcome_code) REFERENCES ref_booking_outcomes(outcome_code) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bookings" ADD CONSTRAINT "bookings_status_code_fkey" FOREIGN KEY (status_code) REFERENCES ref_booking_status(status_code) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."bookings" ADD CONSTRAINT "bookings_travel_agency_id_fkey" FOREIGN KEY (travel_agency_id) REFERENCES travel_agencies(travel_agency_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."cars" ADD CONSTRAINT "cars_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."customer_addresses" ADD CONSTRAINT "customer_addresses_address_id_fkey" FOREIGN KEY (address_id) REFERENCES addresses(address_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."customer_addresses" ADD CONSTRAINT "customer_addresses_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."hotels" ADD CONSTRAINT "hotels_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."payments" ADD CONSTRAINT "payments_booking_id_fkey" FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."restaurants" ADD CONSTRAINT "restaurants_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."service_bookings" ADD CONSTRAINT "service_bookings_booking_id_fkey" FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."service_bookings" ADD CONSTRAINT "service_bookings_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

-- 2022-01-25 07:29:52.757043+00
