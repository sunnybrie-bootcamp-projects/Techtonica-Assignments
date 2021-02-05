let testMe = function(num, funct, testcases, expected) {
	// let testcases = [0, 1, 1.5, 15.6]
	// let expected = [0, 39.3701, 59.05515
	// , 614.17356]
console.log(`
------ Challenge ${num} ------`);
	for ( let test of testcases ) {
		let expect;
		if ( funct(test) == expected[testcases.indexOf(test)] ) {
			expect = ["✓"];
		} else {
			expect = ["expect:", expected[testcases.indexOf(test)]]
		}
		console.log(funct(test), ...expect)
	}
};

let testMulti = function(num, funct, testcases, expected) {

console.log(`
------ Challenge ${num} ------`);
	for ( let test of testcases ) {
		let expect;
		if ( funct(...test) === expected[testcases.indexOf(test)] ) {
			expect = ["✓"];
		} else {
			expect = ["expect:", expected[testcases.indexOf(test)]]
		}
		console.log(funct(...test), ...expect)
	}
};


//[Challenge 1] - Convert Inches to Meters
//Define a function called metersToInches that takes an input of the number of meters and outputs the result of the number of inches.
//Hint: 1 meter equals 39.3701 inches.

function metersToInches(meters){
    return (meters * 39.3701);
};

let mTest = [0, 1, 1.5, 15.6];
let mEx = [0, 39.3701, 59.05515, 614.17356];
    
testMe(1, metersToInches, mTest, mEx);

//[Challenge 2] - Loop n Times
//Write a function named loopThrough that takes an argument that is a number and loops through 
//and displays a message “Hello World” that number of times.

function loopThrough(num){
    for(let i = 1; i <= num; i++){
        console.log("Hello World");
    };
};

let lTest = [0, 1, 3];
let lEx = ["nothing", "display 1x", "display 3x"];

testMe(2, loopThrough, lTest, lEx);


//[Challenge 3] - Number sum
//Define a function called calculateSum to calculate the sum all the digits from 0 to an input number.

function calculateSum(num){
    let sum = 0;

    for(let i = 0; i <= num; i++){
        sum += i;
    };

    return sum;
};

let cTest = [0, 1, 3, 10, 7, 55];
let cEx = [0, 1, 6, 55, 28, 1540];

testMe(3, calculateSum, cTest, cEx);

//[Challenge 4] - FizzBuzz
//Write a function called fizzbuzz that prints each number from 1 to the input on a new line.
//For each multiple of 3, print "Fizz" instead of the number.
//For each multiple of 5, print "Buzz" instead of the number.
//For numbers which are multiples of both 3 and 5, print "FizzBuzz" instead of the number.

function fizzbuzz(num){
    for(let i = 1; i <= num; i++){
        if((i % 3 === 0) && (i % 5 === 0)){
            console.log("FizzBuzz");
        }else if(i % 3 === 0){
            console.log("Fizz");
        }else if(i % 5 === 0){
            console.log("Buzz");
        }else{
            console.log(i);
        };
    };
};

let fTest = [0, 16]
let fEx = ["", `1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16`]

testMe(4, fizzbuzz, fTest, fEx);

//[Challenge 5] Calculate Factorial Number
//A factorial number is the concept in math by value of multiplying numbers by each consecutively smaller number.

function calcFactorial(num){
    let product = num;
  
    for(i = (num - 1); i > 0; i--){
        product *= i;
    };

    return product;
};

let faTest = [0, 3, 6, 10]
let faEx = [1, 6, 720, 3628800]

testMe(5, calcFactorial, faTest, faEx);

//[Challenge 6] Switch Statements
//Using a switch statement, write a function called sleep_in(weekday, vacation) with these criteria: 
//The parameter weekday is True if it is a weekday, and the parameter vacation is True if we are on vacation. 
//We sleep in if it is not a weekday or we're on vacation. Return True if we sleep in.

function sleep_in(weekday, vacation){
    if(!weekday){
        return true;
    }else{
        if(vacation === true){
            return true;
        }else{
            return false;
        };
    };
};

let siTest = [
	[false, false],
	[true, false],
	[false, true]
]
let siEx = [true, false, true]

testMulti(6, sleep_in, siTest, siEx);

//Challenge 8
//Create an object with two key-value pairs.
//Log that object to the console.
//Delete the first key-value pair in the object.
//Log that object to the console again. The first key-value pair should be gone.
console.log("------ Challenge 8 ------");

var dog = {
    name: "Fido",
    age: 2
};

console.log(dog);
delete dog.name;
console.log(dog);


/*[Challenge 9] Mutating Objects
Create an array of objects with at least 2 key value pairs. 
The objects should all have the same keys, and the array should contain at least 3 objects.
Create a function that accepts the array of objects as an argument.
Print the value of the second key in each object to the console. 
Use dot-notation to access the values.
After printing the values in step 3, change the values of the second key in every object to something new.
Prove the change worked by printing the second key in each object to the console, which should show the new value. 
Use bracket-notation to access the values this time. */
console.log("------ Challenge 9 ------");

var cats = [{name:"Bootsy", color:"tuxedo", age:"12"}, {name:"Zazzy", color:"tabby/white", age:"4"}, {name:"Lady", color:"white", age:"3"}];

function printColor(array){
    array.map(pet => {console.log(pet.color);});
};

printColor(cats);

function eraseColor(array){
    array = array.map(pet => {delete pet["color"];});
};

eraseColor(cats);
console.log(cats);

//[Challenge 10] Determine Runtime Complexity
//At the top your document for each challenge, state the runtime complexity for that function.

