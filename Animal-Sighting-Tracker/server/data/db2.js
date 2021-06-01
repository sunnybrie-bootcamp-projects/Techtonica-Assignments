const initOptions = {};
const pgp, {QueryFile} = require("pg-promise")(initOptions);
//const cn = {
//  host: "localhost", // 'localhost' is the default;
//  port: 5432, // 5432 is the default;
//  database: "animal_tracking",
//  user: "tpl5_2021h1",
//  password: "zxcvbnm",
//};
//const db = pgp(cn);

// Helper for linking to external query files:
function sql(file) {
  return new pgp.QueryFile(file, { minify: true });
}

// Create a QueryFile globally, once per file:
const sqlAnimalTracking = sql("./animaltracking.sql");

db.any(sqlAnimalTracking)
  then(data => {
        data.forEach((row, index, data) => {
             // process the row
        });
        return data;
  })
  .catch((error) => {
    if (error instanceof pgp.errors.QueryFileError) {
      // => the error is related to our QueryFile
    }
  });



module.exports = db;
