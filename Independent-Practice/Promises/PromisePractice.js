async function hiFriend(name) {
  const basicProm = new Promise((resolve, reject) => {
    let resolution = setTimeout(() => {
      resolve("Yay!");
      clearTimeout(rejection);
    }, 1000);
    let rejection = setTimeout(() => {
      reject("Sorry, I don't recognize you..."); 
    }, 5000);
  })
    .then((res) => {
      return `${res} It's ${name}!`;
    })
    .catch((err) => {
      console.log(`${err}!`);
    });

  let results = await basicProm;

  console.log({results});
  return results;
};

(async (n) => {return hiFriend(n)})("Brie")
.then(v => {
  console.log("Promise Complete!: ", v);  // prints 60 after 2 seconds.
});



/*
try{
  console.log("hi!");
  console.log(myName);
}
catch (err) {

  console.log("Error!:", err);
};*/


/*

*/