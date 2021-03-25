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
    
    //Get new sighting ID
    const finalQuery = db.query(`SELECT MAX(sighting_id) FROM sightings;`, [true])
        .then((result) => {
        let newSightingID = result[0].max + 1;
        console.log("newSightingID", newSightingID); //TEST

        return newSightingID;
        }) //Now make row insert strings
        .then((newSightingID) => {
            //For each individual
            getFinalPiece = async () => {
                let stringConcoction = "";
                
                for(let i = 0; i < name.length; i++){
                  let myQ = `SELECT * FROM individuals WHERE nickname = '${name[i]}';`;

                  //Get individual ID
                  let newRow = db
                    .query(myQ, [true])
                    .then((rows) => {
                      //console.log("getID results: ", rows); //TEST

                      let str = i === name.length - 1 ? "" : ", ";

                      console.log("Making insertion query..."); //TEST
                      let insertion = `('${date}', ${rows[0].id}, '${location}', ${appeared_healthy}, '${email}', NOW(), ${newSightingID} )${str}`;
                      //console.log(insertion); // TEST

                      return insertion;
                    })
                    .catch((reason) => {
                      console.log("Error: ", reason);
                    });

                  stringConcoction += await newRow;
                };

                return stringConcoction;
            };

            return getFinalPiece();
            
        })
        .then((finalpiece) => {
            let finalQ = `INSERT INTO sightings(date_time, individual, location, appeared_healthy, sighter_email, record_created, sighting_id) VALUES`;
            finalQ += finalpiece;
            finalQ += ` RETURNING *;`;

            console.log("FINAL: ", finalQ);
            return finalQ;
        });

    const newSighting = await db.query(await finalQuery, [true]);

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
        `SELECT sightings.sighting_id, sightings.date_time, sightings.location, sightings.sighter_email, sightings.appeared_healthy, individuals.nickname, species.common_name, species.image_url, species.wikipedia_url
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
