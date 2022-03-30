----
-- The Apollo schema
-- Apollo was the protector of the young
--
-- This defines the schema used by the main safety network
--

CREATE EXTENSION IF NOT EXISTS postgis;

BEGIN;

DROP SCHEMA IF EXISTS apollo CASCADE;
CREATE SCHEMA apollo;
COMMENT ON SCHEMA apollo IS 'The schema used by the safety network';

-- We will KSUIDs as our unique ID
CREATE DOMAIN "apollo"."ksuid" AS TEXT CHECK (VALUE ~ '^[0-9a-zA-Z]{27}$');
COMMENT ON DOMAIN "apollo"."ksuid" IS 'K-Sortable Globally Unique ID.';

-- CREATE TYPE "apollo".request_decision AS ENUM (
--   'approved',
--   'denied',
--   'ignored'
-- );
-- COMMENT ON TYPE "apollo".request_decision IS 'The outcome of a request.';

CREATE TABLE "apollo"."users" (
  ksuid "apollo"."ksuid" PRIMARY KEY NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone BIGINT NOT NULL,
  phone_country INT NOT NULL,
  dob TIMESTAMP NOT NULL,
  organ_donor BOOLEAN,
  medical_info TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
COMMENT ON TABLE "apollo"."users" IS 'Users inside the safety network';

CREATE TABLE "apollo"."connections" (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
  requester_id "apollo"."ksuid" NOT NULL,
  approver_id "apollo"."ksuid" NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
COMMENT ON TABLE "apollo"."connections" IS 'Approved connections that exist between users';

CREATE TABLE "apollo"."requests" (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
  requester_id "apollo"."ksuid" NOT NULL,
  approver_id "apollo"."ksuid" NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
COMMENT ON TABLE "apollo"."requests" IS 'Requested connections between users';

-- CREATE TABLE "apollo"."request_history" (
--   id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
--   request_id BIGINT NOT NULL,
--   requester_id "apollo"."ksuid" NOT NULL,
--   approver_id "apollo"."ksuid" NOT NULL,
--   decision "apollo".request_decision NOT NULL,
--   created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
-- );
-- COMMENT ON TABLE "apollo"."request_history" IS 'The history of requests between users';

