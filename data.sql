/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
  ("Agumon", "2020-02-03", 0, true, 10.23), 
  ("Gabumon", "2018-11-15", 2, true, 8.0),
  ("Pikachu", "2021-01-07", 1, false, 15.04),
  ("Devimon", "2017-05-12", 5, true, 11.0);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
    ("Charmander", "2020-02-08", 0, false, -11.0),
    ("Plantmon", "2021-11-15", 2, true, -5.7),
    ("Squirtle", "1993-04-02", 3, false, -12.13),
    ("Angemon", "2005-06-12", 1, true, -45.0),
    ("Boarmon", "2005-07-07", 7, true, 20.4),
    ("Blossom", "1998-10-13", 3, true, 17),
    ("Ditto", "2022-05-14", 4, true, 22);
    
   
  -- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon

UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
-- Jennifer Orwell owns Gabumon and Pikachu.
-- Bob owns Devimon and Plantmon.
-- Melody Pond owns Charmander, Squirtle, and Blossom.
-- Dean Winchester owns Angemon and Boarmon.

UPDATE animals SET owner_id = 1 WHERE name = "Agumon";
UPDATE animals SET owner_id = 2 WHERE name = "Gabumon";
UPDATE animals SET owner_id = 2 WHERE name = "Pikachu";
UPDATE animals SET owner_id = 3 WHERE name IN ("Plantmon", "Devimon");
UPDATE animals SET owner_id = 4 WHERE name IN ("Charmander", "Squirtle", "Blossom");
UPDATE animals SET owner_id = 5 WHERE name IN ("Angemon", "Boarmon");
