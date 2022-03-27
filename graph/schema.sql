----
-- The FATMAP bundler schema
--
-- This defines the schema used by the offline tile bundler.
--

CREATE EXTENSION IF NOT EXISTS postgis;

BEGIN;

DROP SCHEMA IF EXISTS safety CASCADE;
CREATE SCHEMA safety;
COMMENT ON SCHEMA safety IS 'The schema used by the safety network';

-- We will KSUIDs as our unique ID
CREATE DOMAIN "safety"."ksuid" AS TEXT CHECK (VALUE ~ '^[0-9a-zA-Z]{27}$');
COMMENT ON DOMAIN "safety"."ksuid" IS 'K-Sortable Globally Unique ID.';

-- CREATE TYPE "safety".request_decision AS ENUM (
--   'approved',
--   'denied',
--   'ignored'
-- );
-- COMMENT ON TYPE "safety".request_decision IS 'The outcome of a request.';

CREATE TABLE "safety"."users" (
  ksuid "safety"."ksuid" PRIMARY KEY NOT NULL,
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
COMMENT ON TABLE "safety"."users" IS 'Users inside the safety network';

CREATE TABLE "safety"."connections" (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
  requester_id "safety"."ksuid" NOT NULL,
  approver_id "safety"."ksuid" NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
COMMENT ON TABLE "safety"."connections" IS 'Approved connections that exist between users';

CREATE TABLE "safety"."requests" (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
  requester_id "safety"."ksuid" NOT NULL,
  approver_id "safety"."ksuid" NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
COMMENT ON TABLE "safety"."requests" IS 'Requested connections between users';

-- CREATE TABLE "safety"."request_history" (
--   id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
--   request_id BIGINT NOT NULL,
--   requester_id "safety"."ksuid" NOT NULL,
--   approver_id "safety"."ksuid" NOT NULL,
--   decision "safety".request_decision NOT NULL,
--   created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
-- );
-- COMMENT ON TABLE "safety"."request_history" IS 'The history of requests between users';

