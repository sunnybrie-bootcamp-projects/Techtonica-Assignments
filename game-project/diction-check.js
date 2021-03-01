

//var englishDictionary = require('./dict');

// ----- CHECKING FOR REAL WORDS -----
//function checkWord() {
    const fs = require("fs");

    fs.readFile("dict.json", function (err, data) {
    if (err) throw err;

    const words = JSON.parse(data);
    const badLetterString = `${(['a', 'i', 'b']).join('|')}`;
    const myPattern = new RegExp (`\\b((?!(${badLetterString}))\\w)+\\b`, 'g');
    console.log(myPattern);
    //console.log(words.filter((d) => {return (d == "bird");})); //TEST
    console.log(words.filter(d => (myPattern).test(d)));
    });
//};


//checkWord();
