-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."ADMIN"
(
    "UserID(ADMIN)" integer NOT NULL,
    CONSTRAINT "ADMIN_pkey" PRIMARY KEY ("UserID(ADMIN)")
);

CREATE TABLE IF NOT EXISTS public."ALL_USER"
(
    "UserID" integer NOT NULL,
    "UserPassword" character varying(100) COLLATE pg_catalog."default",
    "UserName" character varying(100) COLLATE pg_catalog."default",
    "UserEmail" character varying(100) COLLATE pg_catalog."default",
    "RecentLogin" date,
    CONSTRAINT "ALL_USER_pkey" PRIMARY KEY ("UserID")
);

CREATE TABLE IF NOT EXISTS public."BOOKING"
(
    "BookingID" integer NOT NULL,
    "UserID(BOOKING)" integer,
    "RoomID(BOOKING)" integer,
    "CheckInDate" date,
    "PayType" character varying(100) COLLATE pg_catalog."default",
    "NumberOfBooking" integer,
    CONSTRAINT "BOOKING_pkey" PRIMARY KEY ("BookingID")
);

CREATE TABLE IF NOT EXISTS public."Branch_Facilities"
(
    "BranchID(Branch_Facilities)" integer NOT NULL,
    "Facility" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Branch_Facilities_pkey" PRIMARY KEY ("BranchID(Branch_Facilities)")
);

CREATE TABLE IF NOT EXISTS public."Branch_SecurityMeasures"
(
    "BranchID(Branch_SecurityMeasures)" integer,
    "Measure" character varying(100) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public."Branch_Telephone"
(
    "BranchID(Branch_Telephone)" integer,
    "BranchTelephone" character varying(100) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public."Branch_Transportation"
(
    "BranchID(Branch_Transportation)" integer,
    "Transportation" character varying(100) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public."DETAILS"
(
    "DetailsID" integer NOT NULL,
    "RoomDecor" character varying(100) COLLATE pg_catalog."default",
    "Accessibility Features" character varying(100) COLLATE pg_catalog."default",
    "RoomType" character varying(100) COLLATE pg_catalog."default",
    "View" character varying(100) COLLATE pg_catalog."default",
    "Building/Floor" character varying(100) COLLATE pg_catalog."default",
    "Bathroom" character varying(100) COLLATE pg_catalog."default",
    "BedConfiguration" character varying(100) COLLATE pg_catalog."default",
    "Services" character varying(100) COLLATE pg_catalog."default",
    "RoomSize" integer,
    "Wi-Fi" boolean,
    "MaxPeople" integer,
    "Smoking" boolean,
    CONSTRAINT "DETAILS_pkey" PRIMARY KEY ("DetailsID")
);

CREATE TABLE IF NOT EXISTS public."Details_Amentities"
(
    "DetailsID(Details_Amentities)" integer NOT NULL,
    "Amentities" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Details_Amentities_pkey" PRIMARY KEY ("DetailsID(Details_Amentities)")
);

CREATE TABLE IF NOT EXISTS public."HOTEL"
(
    "HotelID" integer NOT NULL,
    "UserID(HOTEL_MANAGER)" integer,
    "HotelName" character varying(100) COLLATE pg_catalog."default",
    "BrandIdentity" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "HOTEL_pkey" PRIMARY KEY ("HotelID")
);

CREATE TABLE IF NOT EXISTS public."HOTEL_BRANCH"
(
    "HotelID(HOTEL_BRANCH)" integer,
    "BranchID" integer NOT NULL,
    "BranchName" character varying(100) COLLATE pg_catalog."default",
    "Location" character varying(100) COLLATE pg_catalog."default",
    "DecorAndTheme" character varying(100) COLLATE pg_catalog."default",
    "Rating/Reviews" integer,
    "ParkingAvailability" boolean,
    "ParkingTypeParking" character varying(100) COLLATE pg_catalog."default",
    "ParkingCostParking" integer,
    CONSTRAINT "HOTEL_BRANCH_pkey" PRIMARY KEY ("BranchID")
);

CREATE TABLE IF NOT EXISTS public."HOTEL_MANAGER"
(
    "UserID(HOTEL_MANAGER)" integer NOT NULL,
    CONSTRAINT "HOTEL_MANAGER_pkey" PRIMARY KEY ("UserID(HOTEL_MANAGER)")
);

CREATE TABLE IF NOT EXISTS public."Hotel_MarketingStrategy"
(
    "HotelID(Hotel_MarketingStrategy)" integer NOT NULL,
    "Strategy" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Hotel_MarketingStrategy_pkey" PRIMARY KEY ("HotelID(Hotel_MarketingStrategy)")
);

CREATE TABLE IF NOT EXISTS public."Hotel_Technology"
(
    "HotelID(Hotel_Technology)" integer NOT NULL,
    "Technology" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Hotel_Technology_pkey" PRIMARY KEY ("HotelID(Hotel_Technology)")
);

CREATE TABLE IF NOT EXISTS public."NORMAL_USER"
(
    "UserID(NORMAL_USER)" integer NOT NULL,
    "BirthDate" date,
    CONSTRAINT "NORMAL_USER_pkey" PRIMARY KEY ("UserID(NORMAL_USER)")
);

CREATE TABLE IF NOT EXISTS public."NormalUser_Address"
(
    "UserID(NormalUser_Address)" integer NOT NULL,
    "UserAddress" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "NormalUser_Address_pkey" PRIMARY KEY ("UserID(NormalUser_Address)")
);

CREATE TABLE IF NOT EXISTS public."NormalUser_Telephone"
(
    "UserID(NormalUser_Telephone)" integer NOT NULL,
    "UserTelephone" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "NormalUser_Telephone_pkey" PRIMARY KEY ("UserID(NormalUser_Telephone)")
);

CREATE TABLE IF NOT EXISTS public."ROOM"
(
    "BranchID(ROOM)" integer,
    "RoomID" integer NOT NULL,
    "DetailsID(ROOM)" integer,
    "Status" boolean,
    "PriceNormal" integer,
    "PriceWeekend" integer,
    "PriceEvent" integer,
    CONSTRAINT "ROOM_pkey" PRIMARY KEY ("RoomID")
);

CREATE TABLE IF NOT EXISTS public."LoginLog"
(
    "LoginID" bigserial NOT NULL,
    "Type" "LoginType" NOT NULL,
    "Date-time" date NOT NULL,
    "UserID" integer NOT NULL,
    CONSTRAINT "LoginLog_Pkey" PRIMARY KEY ("LoginID")
);

ALTER TABLE IF EXISTS public."ADMIN"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(ADMIN)")
    REFERENCES public."ALL_USER" ("UserID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "ADMIN_pkey"
    ON public."ADMIN"("UserID(ADMIN)");


ALTER TABLE IF EXISTS public."BOOKING"
    ADD CONSTRAINT "RoomID" FOREIGN KEY ("RoomID(BOOKING)")
    REFERENCES public."ROOM" ("RoomID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BOOKING"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(BOOKING)")
    REFERENCES public."NORMAL_USER" ("UserID(NORMAL_USER)") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Branch_Facilities"
    ADD CONSTRAINT "BranchID" FOREIGN KEY ("BranchID(Branch_Facilities)")
    REFERENCES public."HOTEL_BRANCH" ("BranchID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS "Branch_Facilities_pkey"
    ON public."Branch_Facilities"("BranchID(Branch_Facilities)");


ALTER TABLE IF EXISTS public."Branch_SecurityMeasures"
    ADD CONSTRAINT "BranchID" FOREIGN KEY ("BranchID(Branch_SecurityMeasures)")
    REFERENCES public."HOTEL_BRANCH" ("BranchID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Branch_Telephone"
    ADD CONSTRAINT "BranchID" FOREIGN KEY ("BranchID(Branch_Telephone)")
    REFERENCES public."HOTEL_BRANCH" ("BranchID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Branch_Transportation"
    ADD CONSTRAINT "BranchID" FOREIGN KEY ("BranchID(Branch_Transportation)")
    REFERENCES public."HOTEL_BRANCH" ("BranchID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."Details_Amentities"
    ADD CONSTRAINT "DetailsID" FOREIGN KEY ("DetailsID(Details_Amentities)")
    REFERENCES public."DETAILS" ("DetailsID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS "Details_Amentities_pkey"
    ON public."Details_Amentities"("DetailsID(Details_Amentities)");


ALTER TABLE IF EXISTS public."HOTEL"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(HOTEL_MANAGER)")
    REFERENCES public."HOTEL_MANAGER" ("UserID(HOTEL_MANAGER)") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."HOTEL_BRANCH"
    ADD CONSTRAINT "HotelID" FOREIGN KEY ("HotelID(HOTEL_BRANCH)")
    REFERENCES public."HOTEL" ("HotelID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."HOTEL_MANAGER"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(HOTEL_MANAGER)")
    REFERENCES public."ALL_USER" ("UserID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "HOTEL_MANAGER_pkey"
    ON public."HOTEL_MANAGER"("UserID(HOTEL_MANAGER)");


ALTER TABLE IF EXISTS public."Hotel_MarketingStrategy"
    ADD CONSTRAINT "HotelID" FOREIGN KEY ("HotelID(Hotel_MarketingStrategy)")
    REFERENCES public."HOTEL" ("HotelID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "Hotel_MarketingStrategy_pkey"
    ON public."Hotel_MarketingStrategy"("HotelID(Hotel_MarketingStrategy)");


ALTER TABLE IF EXISTS public."Hotel_Technology"
    ADD CONSTRAINT "HotelID" FOREIGN KEY ("HotelID(Hotel_Technology)")
    REFERENCES public."HOTEL" ("HotelID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "Hotel_Technology_pkey"
    ON public."Hotel_Technology"("HotelID(Hotel_Technology)");


ALTER TABLE IF EXISTS public."NORMAL_USER"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(NORMAL_USER)")
    REFERENCES public."ALL_USER" ("UserID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "NORMAL_USER_pkey"
    ON public."NORMAL_USER"("UserID(NORMAL_USER)");


ALTER TABLE IF EXISTS public."NormalUser_Address"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(NormalUser_Address)")
    REFERENCES public."NORMAL_USER" ("UserID(NORMAL_USER)") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "NormalUser_Address_pkey"
    ON public."NormalUser_Address"("UserID(NormalUser_Address)");


ALTER TABLE IF EXISTS public."NormalUser_Telephone"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID(NormalUser_Telephone)")
    REFERENCES public."NORMAL_USER" ("UserID(NORMAL_USER)") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS "NormalUser_Telephone_pkey"
    ON public."NormalUser_Telephone"("UserID(NormalUser_Telephone)");


ALTER TABLE IF EXISTS public."ROOM"
    ADD CONSTRAINT "BranchID" FOREIGN KEY ("BranchID(ROOM)")
    REFERENCES public."HOTEL_BRANCH" ("BranchID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ROOM"
    ADD CONSTRAINT "DetailsID" FOREIGN KEY ("DetailsID(ROOM)")
    REFERENCES public."DETAILS" ("DetailsID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."LoginLog"
    ADD CONSTRAINT "UserID" FOREIGN KEY ("UserID")
    REFERENCES public."ALL_USER" ("UserID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;