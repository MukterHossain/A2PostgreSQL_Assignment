

-- create rangers table
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100)
);


-- create species table
CREATE Table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);


-- create sightings table
CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time DATE,
    location VARCHAR(50),
    notes VARCHAR(200)
);


-- Insert data in rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('Akib Triko', 'Southern Hills'),
('Tariq Bilal', 'Rema Kalenga');


-- Insert data in species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status ) VALUES
('Snow Leopard', 'Pnthera uncia', '1775-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-20', 'Vulrerable'),
('Bengal Tiger', 'Panthera tigris tigris', '1858-05-01', 'Vulrerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-20', 'Endangered'),
('African Elephant', 'Loxodonta africana', '1997-03-15', 'Vulrerable'),
('Tasmanian Devil', 'Sarcophilus harrisii', '1808-01-10', 'Vulrerable'),
('Vaquita', 'Phocoena sinus', '1958-11-01', 'Endangered'),
('Snowy Owl', 'Bubo scandiacus', '1858-07-10', 'Vulrerable'),
('Green Sea Turtle', 'Chelonia mydas', '1802-09-01', 'Vulrerable');


-- Insert data in sightings table
INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-15 09:10:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-12 16:20:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', 'NULL'),
(3, 2, 'South Valley', '2024-05-20 10:20:00', 'Spotted with binoculars'),
(4, 4, 'North Cliffs', '2024-05-09 08:55:00', 'Heard distant calls'),
(3, 5, 'Eagle Pass', '2024-05-18 18:30:00', 'Juvenile seen'),
(2, 3, 'Willow Marsh', '2024-05-13 07:05:00', 'Fresh scat found'),
(6, 1, 'Willow Marsh', '2024-05-13 07:05:00', 'NULL'),
(5, 5, 'Cedar Trail Pass', '2024-05-18 18:30:00', 'Brief visual comfirmation');




--  Problem 1
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');


--  Problem 2
SELECT count(DISTINCT species_id) FROM sightings;





--  Problem 3
SELECT * FROM sightings WHERE location LIKE '%Pass';


--  Problem 4

  SELECT rangers.name, COUNT(sightings.sighting_id) FROM rangers
  LEFT JOIN 
sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name;


--  Problem 5
SELECT species.common_name FROM species 
LEFT JOIN
sightings  ON species.species_id = sightings.species_id
WHERE sightings.species_id IS NULL;
 

--  Problem 6   
SELECT species.common_name,   sightings.sighting_time, rangers.name
 FROM sightings 
 JOIN 
   species  ON sightings.species_id = species.species_id
JOIN
rangers  ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2;


--  Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';





--  Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN(
SELECT DISTINCT ranger_id FROM sightings
);

