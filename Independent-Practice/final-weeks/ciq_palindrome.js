// A palindrome is a word, phrase, number, or other sequence of characters which reads
// the same backward or forward. This includes capital letters, punctuation, and word dividers.

// Implement a function that checks if something is a palindrome.

// isPalindrome("anna")   ==> true
// isPalindrome("walter") ==> false
// isPalindrome("racecar")    ==> true
// isPalindrome("ab")   ==> false

function isPalindrome(str) {
  for (let i = 0; i < str.length; i++) {
    if (str[i] !== str[str.length - 1 - i]) {
      return false;
    }
  }

  return true;
}

console.log(isPalindrome("anna")); //=> true
console.log(isPalindrome("bob")); //=> true
console.log(isPalindrome("walter")); //=> false
console.log(isPalindrome("racecar")); //=> true
console.log(isPalindrome("ab")); //=> false
