// Activity: Movie Night Suppose 5 classmates are interested in going to see a movie together. There are some interesting dynamics between the people in this group, as described below:

// Priya will attend only if Ming goes.
// David loves popcorn and will go to the movies under any circumstance
// Alex will automatically go to the movies if David goes, and will automatically not go to the movies if David does not go
// Ming will not attend if David has already said he is attending and Ming will say yes if Priya says yes.
// Breanna loves to be around people and will only go if there are at least 2 others going

// Write a function called movieNight that takes in an array. The array must contain 3 strings, and each string must be one of the names shown above who are interested in going to the movies. 
//And the array should include all the combinaton of three names out of five(total 10 possible array input). 
//Write a body for the movieNight function, based on the "rules" associated with each of the names above, that returns an array of the people who will attend the movie. Your function should account for the logic necessary for all 5 people, so that no matter which names are given, the result will always be correct. (ie: Don't just code the logic for 3 of the names and pass those names in all the time.) In case there are multiple answer for a single triplet or input string display all the possible correct answer for that triplet.

function movieNight(arr){
  let result = [];
  
  function movieNight(arr){
    let result = [];
    if(arr.includes("David")){
      result.push("David","Alex");
    }else{
      result.push("Ming", "Priya");
    }
    if(result.length >= 2){
      result.push("Breanna");
    }
    console.log(result);
    return result;
}
  console.log(result);
  return result; 
}

console.log("** TESTING OUTPUTS **");
console.log("1");
movieNight(['David', 'Breanna', 'Alex']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n2");
movieNight(['Priya', 'David', 'Breanna']) 
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n3");
movieNight(['Priya', 'David', 'Alex']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n4");
movieNight(['Priya', 'David', 'Ming']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n5");
movieNight(['Priya', 'Breanna', 'Alex']);
console.log("EXPECTED OUTPUT: ['Ming', 'Priya', 'Breanna']");

console.log("\n6");
movieNight(['Priya', 'Breanna', 'Ming']);
console.log("EXPECTED OUTPUT: ['Ming', 'Priya', 'Breanna']");

console.log("\n7");
movieNight(['Breanna', 'Alex', 'Ming']);
console.log("EXPECTED OUTPUT: ['Ming', 'Priya', 'Breanna']");

console.log("\n8");
movieNight(['David', 'Alex', 'Ming']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n9");
movieNight(['Alex', 'Ming', 'Priya']);
console.log("EXPECTED OUTPUT: ['Ming', 'Priya', 'Breanna']");

console.log("\n10");
movieNight(['David', 'Breanna', 'Ming']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");

console.log("\n11");
movieNight(['Priya', 'David', 'Breanna']);
console.log("EXPECTED OUTPUT: ['David', 'Alex', 'Breanna']");