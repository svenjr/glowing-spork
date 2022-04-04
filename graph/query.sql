-- name: GetUser :one
SELECT * FROM "apollo"."users"
WHERE ksuid = $1 LIMIT 1;

-- name: ListConnections :many
SELECT * FROM "apollo"."connections"
WHERE requester_id OR approver_id = $1;

-- name: ListRequestsIn :many
SELECT * FROM "apollo"."requests"
WHERE approver_id = $1
ORDER BY created_at;

-- name: ListRequestsOut :many
SELECT * FROM "apollo"."requests"
WHERE requester_id = $1
ORDER BY created_at;

-- name: CreateUser :one
INSERT INTO "apollo"."users" (
  first_name,
  last_name,
  phone,
  phone_country,
  dob,
  organ_donor,
  medical_info
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;

-- name: CreateConnection :one
INSERT INTO "apollo"."connections" (
  requester_id,
  approver_id
) VALUES (
  $1, $2
)
RETURNING *;

-- name: CreateRequest :one
INSERT INTO "apollo"."requests" (
  requester_id,
  approver_id
) VALUES (
  $1, $2
)
RETURNING *;

-- -- name: CreateRequestLog :one
-- INSERT INTO request_history (
--   request_id,
--   requester_id,
--   approver_id,
--   decision
-- ) VALUES (
--   $1, $2, $3, $4
-- )

-- name: DeleteUser :one
DELETE FROM "apollo"."users"
WHERE ksuid = $1 RETURNING ksuid;

-- name: DeleteConnection :one
DELETE FROM "apollo"."connections"
WHERE approver_id = $1
OR requester_id = $1 RETURNING id;

-- name: DeleteRequest :one
DELETE FROM "apollo"."requests"
WHERE approver_id = $1 RETURNING id;
