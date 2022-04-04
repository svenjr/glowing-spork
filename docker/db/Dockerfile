##
# The Soteria database
#

FROM postgis/postgis:13-3.2-alpine

LABEL maintainer="safety.network.engineering@gmail.com"

# We don't need the tiger geocoder.
COPY drop-tiger-geocoder.sql /docker-entrypoint-initdb.d/1-drop-tiger-geocoder.sql

# Install the schema.
COPY schema.sql /docker-entrypoint-initdb.d/2-schema.sql
