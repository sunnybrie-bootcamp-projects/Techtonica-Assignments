// Activity: Convert movieNight function to using a switch statement.

function movieNight(arr){
    let result = [];

    switch(arr.includes("David")){
        case true:
            result.push("David", "Alex");
            break;
        case false:
            result.push("Ming", "Priya");
            break;
        default:
            break;
    };

    if(result.length >= 2){
        result.push("Breanna");
    };

    console.log(result);
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