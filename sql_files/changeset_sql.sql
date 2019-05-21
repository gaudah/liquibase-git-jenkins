--liquibase formatted sql
--changeset xameeramir:create-test-table
CREATE TBLE IF NOT EXISTS testTable(
columnName1 VARCHAR (355)
);
--rollback DROP TABLE
--rollback testTable
