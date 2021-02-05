//Write a function that checks for the longest word in a sentence

function biggestWord(str){
    arr = str.split(" ");
    let holder = "";

    arr.map(word => {
        if(word.length > holder.length){
            holder = word;
        }
    });

    return holder;
};

console.log(biggestWord("What is the biggest word?"));

function reverseWords(str){
    let arr = str.split(" ");
    let arr2 = [];

    arr.map(item => {
        arr2.unshift(item);
    });

    let reversedStr = arr2.join(" ");
    
    return reversedStr;
};

console.log(reverseWords("Hi, how are you?"));

/*
bonus question. I have the following HTML: 
<div class=“left”>box 1</div><div class=“right”>box 2</div> and the following CSS: .left {float: left} .right {float: right}. 
What would you expect to see?
*/

/* 
The ".left" div box will float left, but the ".right" div box will likely fill in the space left behind by ".left";
*/