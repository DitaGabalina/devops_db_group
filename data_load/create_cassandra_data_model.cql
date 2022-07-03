-- Create a keyspace - replication factor should not exceed the number of nodes in your cluster
CREATE KEYSPACE IF NOT EXISTS ur WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '2' };

-- data_load\register_name_history.csv
CREATE TABLE IF NOT EXISTS ur.register_name_history (
regcode text PRIMARY KEY,
name text,
date_to timestamp
);

-- data_load\ppi_delegated_entities.csv
CREATE TABLE IF NOT EXISTS ur.ppi_delegated_entities (
registrationNumber text PRIMARY KEY,
name text,
delegatedEntityName text,
delegatedEntityRegistrationNumber text,
delegatedEntityRegisteredOn timestamp,
delegatedEntityRemovedOn timestamp
);

-- data_load\ppi_public_persons_institutions.csv
CREATE TABLE IF NOT EXISTS ur.ppi_public_persons_institutions (
name text,
, registrationNumber text PRIMARY KEY,
, taxpayerUnitNumber text,
, establishedOn timestamp,
, registeredOn timestamp,
, Status text,
, statusDetails text,
, removedOn timestamp,
, independentTaxpayer text,
, authorityType text,
, subordinationType text,
, website text,
, email text,
, phone  text,
, addressRegisterCode text,
, address text,
, institutionOfHigherEducation text,
, higherAuthorityName text,
, higherAuthorityNumber text,
, higherAuthorityEmail text,
, establishingActNumber text,
, establishingActDate  timestamp,
, establishingActTitle text,
, establishingActType text,
, establishingActLegislatorName text,
, establishingActLegislatorNumber text
);

-- data_load\register.csv
CREATE TABLE IF NOT EXISTS ur.register (
 regcode text PRIMARY KEY,
, sepa text,
, name text,
, name_before_quotes text,
, name_in_quotes text,
, name_after_quotes text,
, without_quotes text,
, regtype text,
, regtype_text text,
, i_type text,
, type_text text,
, registered   timestamp,
, terminated   timestamp,
, closed   text,
, i_address  text,
, i_index  text,
, addressid  text,
, region  text,
, city  text,
, atvk  text,
, reregistration_term  text,
);


