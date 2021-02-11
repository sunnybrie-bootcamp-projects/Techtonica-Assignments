//var englishDictionary = require('an-array-of-english-words');
//HTML IMPLEMENTATION

//GAME JS VARIABLES
var currentWord = ""; //Current word player is building
var playedWords = []; //List of words played
var currentScore = 0; //Current Total Score
var selectedList = [];
var recent = [];
var valid = [];

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
    document.getElementById(recent[0]).className = "unselected";
    recent = [];
};

//Tracks pressed letters
function selectLetter(){
    console.log(`CELL:  
            ${this}`);
            console.log(this);
    switch(this.className){
        //If selected letter is already used
        case "selected":
            console.log(`Test: case "selected"`);
            console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList
            ${selectedList}`);
            printUsedList();

            alreadySelected();
            break;
        //if selected letter is not used
        case "unselected":
            console.log(`Test: case "unselected"`);
             console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList 
            ${selectedList}`);
            printUsedList();

            this.className = "recent"; //update to class recent
            if(recent.length > 0){
                selectedList.push(recent.shift()); //add previously used to used list
                recent.push(this.id); //add this letter to last used
            }else{
                recent.push(this.id); //add this letter to recent
            };
            
            currentWord += this.textContent; //add this letter to current word
            
            break;
        //if selected letter is recent letter
        case "recent":
            console.log(`Test: case "recent"`);
            console.log(`Before: Check recent 
            ${recent}`);
            console.log(recent);
            console.log(`Before: Check selectedList 
            ${selectedList}`);
            printUsedList();

            currentWord = currentWord.substring(0, (currentWord.length - 1)); //subtract this letter from current word
            this.className = "unselected"; //revert this letter's class to unselected
            recent.push(selectedList.pop()); //pop off previously used letter from used list and add to last used
            recent.shift(); //remove this letter from last used
            document.getElementById(recent[0]).className = "recent";
            break;
            
        default:
    };
    console.log(`After: Check recent 
    ${recent}`);
    console.log(recent);
    console.log(`After: Check selectedList 
    ${selectedList}`);
    printUsedList();

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

//Reset valid options
function resetValid(){
        console.log("Reset Valids");
        while(valid.length >= 1){
            document.getElementById(`${valid[0]}`).title = "invalid";
            valid.shift();
    };
};

//get current valid options
function validOptions() {
    resetValid();

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
                    console.log(document.getElementById(`cell-${rowCount[r]}-${colCount[c]}`));
                    document.getElementById(`cell-${rowCount[r]}-${colCount[c]}`).title = "validOption";
                    valid.push(document.getElementById(`cell-${rowCount[r]}-${colCount[c]}`).id);
                };
            }; 
        };
    };

    console.log(valid);

/*
    valid = allLetters.map(compLetter => {
        let compLetterIndex = [(compLetter.id.substring(5, 1)), (compLetter.id.substring(-1))];
        //if letter's row is within 1 space of recent's row AND letter's column is within 1 space of recent's column
        if((compLetterIndex[0] <= (recentIndex[0] + 1) && compLetterIndex[0] >= (recentIndex[0] - 1)) 
        && (compLetterIndex[1] <= (recentIndex[1] + 1) && compLetterIndex[1] >= (recentIndex[1] - 1))){
            return compLetter;
        }else{
            return "";
        }
    });

    console.log(`Check valid 
    ${valid}`);
    
    for(let i = 0; i < valid.length; i++){
        document.getElementById(valid[i]).title = "validOption";
    }
*/
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
function submitWord(){
    resetValid();
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