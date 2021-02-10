/*var englishDictionary = require('an-array-of-english-words');

var gameAlphabet = [
    'A', 'B', 'C', 'D', 'E', 'F',
    'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Qu', 'R',
    'S', 'T', 'U', 'V', 'W', 'X',
    'Y', 'Z'
];


//PROPERTIES/VARIABLES FOR GAME
var gameMatrix = []; //matrix of characters
var listOfChars = []; //all unique characters in matrix (SET OBJECT)
var charFrequency = []; //Frequency of all unique characters
var bannedChars = []; //all letters not included this game
var answers = [];


//GENERATES NEW GAME MATRIX
function generateBoggleGame() { 
    let matrix = [
        ['', '', '', ''],
        ['', '', '', ''],
        ['', '', '', ''],
        ['', '', '', '']
    ];

    for(let i = 0; i < 4; i++){ //creates rows
        for(let j = 0; j < 4; j++){ //creates columns/elements
            let randomLetter = Math.floor(Math.random() * Math.floor(26)); //Generates random index to pull from alphabet
            matrix[i][j] = (gameAlphabet[randomLetter]); //Pushes random letter onto matrix
        };
    };

    return matrix;
};

gameMatrix = generateBoggleGame(); //-TEST
console.log(`Test "generateBoggleGame()"... gameMatrix:`);
console.log(gameMatrix);

//FUNCTIONS NEEDED TO FILTER DICTIONARY FOR ANSWERS

//GET LIST OF VALID CHARACTERS
function getCharList(matrix){
    let tempList = [];

    tempList = matrix.join(",");
    tempList = tempList.split(",");

    let tempSet = new Set(tempList);

    return Array.from(tempSet);
};

//GET INVALID CHARACTERS
function getBannedList(list, alpha){
    let bannedList = []
    let listHold = list;
    
    alpha.map(index => {
        if(!listHold.includes(index)){
            bannedList.push(index);
        };
    });
    return bannedList;
};

listOfChars = getCharList(gameMatrix);
bannedChars = getBannedList(listOfChars, gameAlphabet);
console.log(`Test "getCharList() and getBannedList()"... 
listOfChars: ${listOfChars}
bannedChars: ${bannedChars}`);

//GET FREQUENCY OF CHARACTERS
function getFrequencies(matrix, list){
    let tempList = []; 

    tempList = matrix.join(",");
    tempList = tempList.split(",");

    return list.map(letter => { //For each unique character
        let value = {
            letter: letter,
            max: 0
        }; //Initialize quantity
        tempList.forEach(letter2 => { //Check for frequency
            if(letter2 === letter){ //If multiple is found
                value.max++; //Add 1 to character frequency
            };
        });
        return value;
    });
};

listOfChars = getFrequencies(gameMatrix, listOfChars);
console.log(`Test "getFrequencies()"... charFrequency: ${listOfChars}`);
console.log(listOfChars);

//FIND ALL SOLUTIONS
/*
function filterDictionary(list, banned){
        let answerList = [];
        console.log(
            englishDictionary.filter(

            )
        
        );

        return answerList;
};
*/

//HTML IMPLEMENTATION

function doThing(){
    var gameAlphabet = [
        'A', 'B', 'C', 'D', 'E', 'F',
        'G', 'H', 'I', 'J', 'K', 'L',
        'M', 'N', 'O', 'P', 'Qu', 'R',
        'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z'
    ];
    document.getElementById("test").innerHTML = gameAlphabet;
};