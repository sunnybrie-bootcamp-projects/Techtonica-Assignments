//list each unique letter
//iterate
//add point to letter's count when found
//check final results for largest value
//return

function mostLetter(str) {
  let charMap = new Map();

  //iterate through string, add new letters to map, and increase value of
  //repeating letters
  for (let char of str) {
    //gets value of map key (if it exists)
    let count = charMap.get(char);
    //adds to key's value, if key didn't exist, initializes value to 1
    charMap.set(char, count ? ++count : 1);
  }

  //compare all entries, keep and return entry with largest value
  return [...charMap.entries()].reduce((char1, char2) => {
    return char1[1] > char2[1] ? char1 : char2;
  });
}

console.log(mostLetter("banana"));

console.log(mostLetter("zoomzimzamz"));
