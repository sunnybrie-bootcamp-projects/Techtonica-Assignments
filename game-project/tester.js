//var englishDictionary = require('an-array-of-english-words');

//HTML IMPLEMENTATION

//GAME JS VARIABLES
var currentWord = ""; //Current word player is building
var playedWords = []; //List of words played
var currentScore = 0; //Current Total Score
var selectedList = []; //List of selected letters (ID's)
var recent = []; //Most recently selected letter (ID)
var valid = [];
const validStartValue = [
    "cell-0-0",
    "cell-0-1",
    "cell-0-2",
    "cell-0-3",
    "cell-1-0",
    "cell-1-1",
    "cell-1-2",
    "cell-1-3",
    "cell-2-0",
    "cell-2-1",
    "cell-2-2",
    "cell-2-3",
    "cell-3-0",
    "cell-3-1",
    "cell-3-2",
    "cell-3-3",
]; //Valid moves (ID's)

//Creates Game Board Table
function setBoard(){
    
    var gameAlphabet = [
        'A', 'B', 'C', 'D', 'E', 'F',
        'G', 'H', 'I', 'J', 'K', 'L',
        'M', 'N', 'O', 'P', 'Qu', 'R',
        'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z'
    ];
    
   //PROPERTIES/VARIABLES FOR GAME
    var gameMatrix = []; //matrix of characters
    var gameBoard = document.getElementById("gameboard");

    //GENERATES NEW GAME MATRIX
    function generateBoggleGame() { 
        let matrix = [
            ['', '', '', ''],
            ['', '', '', ''],
            ['', '', '', ''],
            ['', '', '', '']
        ];

        for(let i = 0; i < 4; i++){ //creates rows
            var row = gameBoard.insertRow(i);
            for(let j = 0; j < 4; j++){ //creates columns/elements
                let randomLetter = gameAlphabet[Math.floor(Math.random() * Math.floor(26))]; //Generates random index to pull from alphabet
                var cell = row.insertCell(j);
                cell.innerHTML = randomLetter; //applies to cell
                cell.onclick = selectLetter;
                cell.id = `cell-${i}-${j}`; //gives html cell id
                cell.className = "unselected"; //gives html cell class
                cell.title = "valid";
                valid.push(cell.id);
                matrix[i][j] = randomLetter; //Pushes random letter onto matrix
            };
        };

        return matrix;
    };

    gameMatrix = generateBoggleGame(); //-TEST
};

//Resets letter classes
function refreshLetters() {
    selectedList = [];
    let counter = 0;
    while(counter < 16){
        document.getElementsByTagName("td")[counter].className = "unselected";
        counter++;;
    };
};

function resetRecent() {
    console.log("Clearing Recent Selection..."); //-TEST
    console.log("Before: "); //-TEST
    console.log(recent); //-TEST

    document.getElementById(`${recent[0]}`).className = "unselected";
    recent = [];

    console.log("After: "); //-TEST
    console.log(recent); //-TEST
};

//Tracks pressed letters
function selectLetter(){
  console.log(`CELL:  
            ${this}`); //TEST
  console.log(this); //TEST

  switch (this.className) {
    //If selected letter is already used
    case "selected":
      /* //TESTER
            console.log(`Test: case "selected"`);
            console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList
            ${selectedList}`);
            printUsedList();
            */

      alreadySelected();
      break;
    //if selected letter is not used
    case "unselected":
      /* //TESTER
            console.log(`Test: case "unselected"`);
             console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList 
            ${selectedList}`);
            printUsedList();
            */

      this.className = "recent"; //update to class recent
      if (recent.length > 0) {
        selectedList.push(recent.shift()); //add previously used to used list
        recent.push(this.id); //add this letter to last used
      } else {
        recent.push(this.id); //add this letter to recent
      }

      currentWord += this.textContent; //add this letter to current word

      break;
    //if selected letter is recent letter
    case "recent":
      /* //TESTER
            console.log(`Test: case "recent"`);
            console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList 
            ${selectedList}`);
            printUsedList();
            */

      currentWord = currentWord.substring(0, currentWord.length - 1); //subtract this letter from current word
      this.className = "unselected"; //revert this letter's class to unselected
      recent.push(selectedList.pop()); //pop off previously used letter from used list and add to last used
      recent.shift(); //remove this letter from last used
      document.getElementById(recent[0]).className = "recent";
      break;

    default:
  }
  /* //TESTER
    console.log(`After: Check recent 
    ${recent}`);
    console.log(recent);
    console.log(`After: Check selectedList 
    ${selectedList}`);
    printUsedList();
    */

    updateUsedList(); //change class for all in used list to "selected"    
    updateWIP();
    validOptions();
};

function updateUsedList() {
    for(let i = 0; i < selectedList.length; i++){
        document.getElementById(selectedList[i]).className = "selected";
    };
};

function updateWIP(){
    document.getElementById("word-build").textContent = currentWord;
};

//Resets valids after word submission
function resetValidStart(){
            console.log("Clear Valids...");
            
            valid = validStartValue;

            while (valid.length >= 1) {
              document.getElementById(`${valid[0]}`).title = "validOption";
              valid.shift();
            }
};

//Reset valid options after move
function resetValid(){
        console.log("Resetting Valids...");
        console.log("Before:");
        console.log(valid);

        while(valid.length >= 1){
            document.getElementById(`${valid[0]}`).title = "invalid";
            valid.shift();
    };

    console.log("After:");
    console.log(valid);
};

//get current valid options
function validOptions() {
    resetValid();
    console.log("Getting New Valid Options...");

    let recentIndex = [
        parseInt((recent[0].substring(5, 6))), 
        parseInt((recent[0].substring((recent[0].length - 1))))
    ];
    console.log(recentIndex);

    let rowCount = [(recentIndex[0] - 1), (recentIndex[0]), (recentIndex[0] + 1)];
    let colCount = [(recentIndex[1] - 1), (recentIndex[1]), (recentIndex[1] + 1)]; 
    console.log(rowCount);
    console.log(colCount);

  
    for(let r = 0; r < 4; r++){
        if(rowCount[r] > -1 && rowCount[r] < 4){
           for(let c = 0; c < 4; c++){
                if(colCount[c] > -1 && colCount[c] < 4){
                    document.getElementById(`cell-${rowCount[r]}-${colCount[c]}`).title = "validOption";
                    valid.push(document.getElementById(`cell-${rowCount[r]}-${colCount[c]}`).id);
                };
            }; 
        };
    };

    console.log(valid); //-TEST

};

//Tester Function
function printUsedList() {
    for(let i = 0; i < selectedList.length; i++){
        console.log(selectedList[i]);
    };
};

function alreadySelected(){
    this.style = "background-color: red";
};

//Submit current word
function submitWord() {
    console.log("Submitting word and resetting board..."); //-TEST

    resetValidStart();
    refreshLetters();
    updatePlayedWords();
    updateScore();

    currentWord = ""; //reset current word

    document.getElementById("word-build").innerHTML = "";
};

function updatePlayedWords() {
    playedWords.push(currentWord); //Add current word to played words
    //Adding to HTML list
    var listWord = document.createElement("LI");
    var listWordContent = document.createTextNode(currentWord);
    listWord.appendChild(listWordContent);
    document.getElementById("played-words").appendChild(listWord);
};

function updateScore() {
    currentScore += currentWord.length; //Add score
    document.getElementById("total-score").innerHTML = currentScore;
};