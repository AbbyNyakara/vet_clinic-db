/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

USE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name CHAR(30) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT
);
