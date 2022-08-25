/*Queries that provide answers to the questions from all projects.*/

-- 1.0 Find all animals whose name ends in "mon"
SELECT * FROM animals WHERE name like '%mon';

-- 2.0 List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE YEAR(date_of_birth) BETWEEN '2016' AND '2019';

-- 3.0 List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered=TRUE and escape_attempts<3;

-- 4.0 List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ("Agumon", "Pikachu");

-- 5.0 List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;

-- 6.0 Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;

-- 7.0 Find all animals not named Gabumon.
SELECT * FROM animals WHERE name NOT IN ("Gabumon");

-- 8.0 Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3;


-- Part 2 Questions

-- 1. How many animals are there?
SELECT COUNT(*) FROM animals;

-- 2. How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

-- 3.0 What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;

-- 4.0 Who escapes the most, neutered or not neutered animals?
SELECT name 
FROM animals 
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

-- 5.0 What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

-- 6.0 What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE YEAR(date_of_birth) BETWEEN '1990' AND '2000'
GROUP BY species;

/* PART 3 QUESTIONS */

-- What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.fullname = "Melody Pond";

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = "Pokemon";

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.fullname, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id= species.id GROUP BY animals.species_id;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals 
JOIN owners ON animals.owner_id = owners.id 
JOIN species ON animals.species_id = species.id
WHERE owners.fullname="Jennifer Orwell" 
AND species.name="Digimon";
 
-- List all animals owned by Dean Winchester that haven't tried to escape.
 SELECT animals.name FROM animals 
 JOIN owners ON animals.owner_id = owners.id
 WHERE owners.fullname = "Dean Winchester"
 AND animals.escape_attempts = 0;
 
 -- Who owns the most animals?
 
 SELECT owners.fullname, COUNT(animals.name) AS animal_count FROM owners
 JOIN animals ON owners.id = animals.owner_id
 GROUP BY owners.fullname
 ORDER BY animal_count DESC
 LIMIT 1;


/* PART 4 QUERIES */

-- Who was the last animal seen by William Tatcher?
SELECT animals.name FROM animals 
JOIN visits ON visits.animal_id = animals.id
WHERE vet_id = 1
ORDER BY visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT animals.name FROM animals 
JOIN visits ON visits.animal_id = animals.id
WHERE visits.vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations on specializations.vet_id = vets.id
LEFT JOIN species on specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT visits.visit_date, animals.name FROM animals
JOIN visits ON visits.animal_id = animals.id
WHERE visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30' AND visits.vet_id=3;

-- What animal has the most visits to vets?
SELECT COUNT(visits.animal_id) AS visit_count, animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY visits.animal_id
ORDER BY visit_count DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, visits.visit_date FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE visits.vet_id = 2
ORDER BY visit_date ASC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.id = 2; 

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(visits.animal_id) AS count_visits, species.name FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN species ON animals.species_id = species.id
WHERE visits.vet_id = 2
GROUP BY species.name
ORDER BY count_visits DESC
LIMIT 1;



