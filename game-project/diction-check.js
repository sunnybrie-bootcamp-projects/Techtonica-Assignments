//import {englishDictionary} from 'dictionary/an-array-of-english-words/index.json';

//var englishDictionary = require('./dict');

// ----- CHECKING FOR REAL WORDS -----
//function checkWord() {
    const fs = require("fs");

    fs.readFile("dict.json", function (err, data) {
    if (err) throw err;

    const words = JSON.parse(data);
    console.log(words.filter((d) => /dogs/.test(d))); //TEST
    });
//};


//checkWord();
