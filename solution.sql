


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