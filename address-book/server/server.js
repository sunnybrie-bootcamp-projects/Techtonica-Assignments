const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const port = 9000;

const db = require("./data/db.js");

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//post new contact
app.post("/contacts", async (req, res) => {
  try {
    const {  name, phonenumber, email } = req.body;

    //Get new sighting ID
   /* const finalQuery = db
      .query(`SELECT MAX(id) FROM contacts;`, [true])
      .then((result) => {
        let newContactID = result[0].max + 1;
        console.log("newContactID", newContactID); //TEST

        return newContactID;
      }) //Now make row insert strings
      .then((newContactID) => {
        //For each individual
        getFinalPiece = async () => {
          let stringConcoction = "";

          for (let i = 0; i < name.length; i++) {
            let myQ = `SELECT * FROM individuals WHERE nickname = '${name[i]}';`;

            //Get individual ID
            let newRow = db
              .query(myQ, [true])
              .then((rows) => {
                //console.log("getID results: ", rows); //TEST
                let str = i === name.length - 1 ? "" : ", ";

                console.log("Making insertion query..."); //TEST
                let insertion = `('${date}', ${rows[0].id}, '${location}', ${appeared_healthy}, '${email}', NOW(), ${newContactID} )${str}`;
                //console.log(insertion); // TEST

                return insertion;
              })
              .catch((reason) => {
                console.log("Error: ", reason);
              });

            stringConcoction += await newRow;
          }

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
      }); */

    let finalQuery = `INSERT INTO contacts(first_name, last_name, phone_number, email, date_added) VALUES('${name.firstname}', '${name.lastname}', '${phonenumber}', '${email}', NOW());`;

    const newContact = await db.query(await finalQuery, [true]);

    res.json(newContact.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//gets all contacts
app.get("/contacts", async (req, res) => {
  
  try {
    
    const contacts = await db.any(
      `SELECT *
        FROM contacts
        ORDER BY last_name;`,
      [true]
    );

    res.status(200).json(contacts);
  } catch (e) {
    console.log(e);
  }
});

//Edit Contact
app.post("/edit/:id", async (req, res) => {
  try {
    let id = req.params.id;
    id = id.slice(1, 3);
    
    const {firstname, lastname, phonenumber, email} = req.body;

    console.log("EDIT ID: ", id); //TEST
    let finalQuery = `UPDATE contacts SET first_name = ${firstname}, last_name = ${lastname}, phone_number = ${phonenumber}, email = ${email}, WHERE id = ${id} RETURNING *;`;

    const editContact = await db.query(finalQuery, [true]);

    res.status(200).json(editContact);
  } catch (err) {
    console.error(err.message);
  }
});

//Delete Contact
app.get("/delete/:id", async (req, res) => {
  try {
    let id = req.params.id;
    id = id.slice(1, 3);

    console.log("DELETE ID: ", id); //TEST
    let finalQuery = `DELETE FROM contacts WHERE id = ${id};`;

    const deleteContact = await db.query(finalQuery, [true]);
    const remainingContacts = await db.query(`SELECT * FROM contacts`, [true]);

    res.status(200).json(remainingContacts);
  } catch (err) {
    console.error(err.message);
  }
});

app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}`);
});
