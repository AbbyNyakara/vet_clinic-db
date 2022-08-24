/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

USE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT
);

ALTER TABLE animals
ADD species VARCHAR(40);

/* Create the Owners Table */

CREATE TABLE owners (
id INT AUTO_INCREMENT,
fullname VARCHAR(255),
age INT, 
primary key(id)
);


/* Create Species Table */
CREATE TABLE species (
id INT AUTO_INCREMENT,
name VARCHAR(30),
primary key(id)
);

 /* Modify Animals Table */
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);




