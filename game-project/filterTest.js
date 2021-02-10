var englishDictionary = require('an-array-of-english-words');
var listOfChars = [H,T,X,K,M,Qu,N,Y,G,O,D,S,A,L];
var bannedChars = [B,C,E,F,I,J,P,R,U,V,W,Z];

console.log(englishDictionary.filter(wordString => /`${listOfChars}`/.test(wordString)));