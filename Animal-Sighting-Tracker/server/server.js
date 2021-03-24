const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const port = 9000;

const db = require("./data/db.js");

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//post new sighting
app.post("/sightings", async (req, res) => {
  try {
    const { date, category, name, desc } = req.body;
    const newEvent = await db.query(
      "INSERT INTO events (event_date, category, name, description) VALUES($1, $2, $3, $4) RETURNING *",
      [date, category, name, desc]
    );

    res.json(newEvent.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//gets all sightings
app.get("/sightings", async (req, res) => {
  try {
    const sightings = await db.any(
      `SELECT sightings.sighting_id, sightings.date_time, sightings.location, sightings.sighter_email, sightings.appeared_healthy, individuals.nickname, species.common_name
        FROM sightings 
        JOIN individuals
            ON sightings.individual = individuals.id
        JOIN species
        	ON individuals.species = species.id
        ORDER BY sightings.date_time DESC 
        LIMIT 40;`,
      [true]
    );

    res.json(sightings);
  } catch (e) {
    console.log(e);
  }
});

//Gets all individuals
app.get("/individuals", async (req, res) => {
  try {
    const individuals = await db.any("SELECT * FROM individuals ORDER BY species", [
      true,
    ]);
  
    res.json(individuals);
  } catch (e) {
    console.log(e);
  }
});


app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}`);
});
