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

 CREATE TABLE vets (
 id INT AUTO_INCREMENT,
 name VARCHAR(255),
 age INT,
 date_of_graduation DATE,
 PRIMARY KEY(id)
 );
 
 CREATE TABLE specializations ( 
id INT AUTO_INCREMENT,
species_id INT,
vet_id INT,
PRIMARY KEY (id)
);


-- make the species id and the vet id foreign keys 
ALTER TABLE specializations 
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE specializations
ADD FOREIGN KEY (vet_id) REFERENCES vets(id);

-- CREATE VISITS JOIN TABLE for relationship between animals and vets
CREATE TABLE visits (
id INT AUTO_INCREMENT,
animal_id INT,
vet_id INT,
PRIMARY KEY(id)
);

-- CREATE FOREIGN KEYS TO REFERENCE THE RELATIONSHIPS 
ALTER TABLE visits 
ADD FOREIGN KEY (animal_id) REFERENCES animals(id);

ALTER TABLE visits 
ADD FOREIGN KEY (vet_id) REFERENCES vets(id);
 
 ALTER TABLE visits 
ADD COLUMN visit_date DATE; 



