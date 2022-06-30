CREATE USER "openGauss" with createdb IDENTIFIED BY 'openGauss2022';

CREATE DATABASE "openGauss" OWNER "openGauss" template = template0;

GRANT ALL PRIVILEGES ON DATABASE "openGauss" to "openGauss";

GRANT ALL PRIVILEGES  to "openGauss";

