

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
    sighing_time DATE,
    location VARCHAR(50),
    notes VARCHAR(200)
);


-- Insert data in rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('Akib Triko', 'Southern Hills'),
('Kris Oks', 'Soloman Island'),
('Nippo Shepos', 'Safari Park'),
('Philip Slikok', 'Pablakhali'),
('Mamun Hider', 'Subdarbans'),
('Tariq Bilal', 'Rema Kalenga');


-- Insert data in species table


-- Insert data in sightings table


SELECT * FROM rangers;