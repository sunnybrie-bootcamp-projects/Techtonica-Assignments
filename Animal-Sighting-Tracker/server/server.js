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
    const { name, appeared_healthy, location, date, email } = req.body;
    let latestID = await db.query(`SELECT MAX(sighting_id) FROM sightings;`, [true]);
    newSightingID = latestID[0].max + 1;

    console.log("newSightingID", newSightingID); //TEST

    console.log(`NAMES: `, name);

    //Gets individuals' id
    let getID = async (n)=>{
        console.log(`Searching for... `, n); //TEST

        let myQ = `SELECT * FROM individuals WHERE nickname = '${n}';`; 
        let results = await new Promise((resolve, reject) =>
            
          db.query(
            myQ,
            (err, results) => {
              if (err) {
                reject(err);
              } else {
                resolve(results);
              }
            }
          )
        );

        //let newInd = await db.query(
        //    "SELECT id FROM individuals WHERE nickname = $1;", [n]
        //);
        let newInd = await results;
        console.log(`Found... ${newInd[0].id} (${typeof newInd[0].id})`);
        return await ( newInd[0].id );
    };

    let startStatement = `INSERT INTO sightings(date_time, individual, location, appeared_healthy, sighter_email, record_created, sighting_id) VALUES`;

    let insertStatement = name.map((nickname, index) => {
        let id = getID(nickname);

        let str = (index === (name.length - 1)) ? ';' : ', ';

        return (`(${date}, ${id}, '${location}', ${appeared_healthy}, '${email}', NOW(), ${newSightingID} )${str}`)
    });

    insertStatement.unshift(startStatement);
    insertStatement = insertStatement.join();

    console.log(`QUERY: `, insertStatement);

    const newSighting = await db.query(`$1`, [insertStatement]);

    res.json(newSighting.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//gets all sightings
app.get("/sightings", async (req, res) => {
    const groupedSightings = (origTable) => {
        let reduced = new Set();
        //END GOAL: reduced = [[{},{},{}], [{}], [{}, {}],]
        let idArr = new Set();

        origTable.forEach((sighting) => {
        if (!idArr.has(sighting.sighting_id)) {
            idArr.add(sighting.sighting_id);
        }
        });

        idArr.forEach((idNum) => {
        reduced.add(
            origTable.filter((subSighting) => {
            return subSighting.sighting_id === idNum;
            })
        );
        });

        //console.log(`POST-FILTERED "reduced": `, reduced); //TEST

        //reduce reduced's subarrays
        function reduceFurther(sightingObj, indexObj) {
        if (!("individuals" in sightingObj)) {
            sightingObj.individuals = [
            {
                nickname: indexObj.nickname,
                common_name: indexObj.common_name,
                appeared_healthy: indexObj.appeared_healthy,
                image_url: indexObj.image_url
            },
            ];
        } else {
            sightingObj.individuals.push({
              nickname: indexObj.nickname,
              common_name: indexObj.common_name,
              appeared_healthy: indexObj.appeared_healthy,
              image_url: indexObj.image_url,
            });
        }

        return sightingObj;
        }

        let reducedMore = new Set();

        reduced = reduced.forEach((sightings) => {
        let initialObject = {
            date_time: sightings[0].date_time,
            location: sightings[0].location,
            sighter_email: sightings[0].sighter_email,
        };

        reducedMore.add(sightings.reduce(reduceFurther, initialObject));
        });

        //console.log(`POST REDUCED "reducedMore": `, [...reducedMore]); //TEST
        return [...reducedMore];
    };

    try {
    const maxSightings = await db.any(
      `WITH getsums AS (
            SELECT sighting_id, date_time, COUNT(*)
            FROM sightings
            GROUP BY sighting_id, date_time
            ORDER BY date_time DESC
            LIMIT 30
        )SELECT SUM(count)
        FROM getsums;`, [true]
    );

    const sightings = await db.any(
        `SELECT sightings.sighting_id, sightings.date_time, sightings.location, sightings.sighter_email, sightings.appeared_healthy, individuals.nickname, species.common_name, species.image_url
        FROM sightings 
        JOIN individuals
            ON sightings.individual = individuals.id
        JOIN species
            ON individuals.species = species.id
        ORDER BY sightings.date_time DESC 
        LIMIT $1;`,
        [maxSightings[0].sum]
    );
    
    const organizedData = groupedSightings(sightings);

    
    res.json(organizedData);
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
