
function printVacations(arr){
    for(let i = 0; i < arr.length; i++){ //whole array
        let string = "";
        
        for(let j = 0; j < arr[i].length; j++){ //sub array - names and places
            if(j === 0){ //First index is a name
                string += (arr[i][j] + " is willing to go to "); //Adds name and filler string
            } else { //Loop has reached the locations
                for(let k = 0; k < arr[i][j].length; k++){ //New loop to cycle through locations
                    if(k === (arr[i][j].length - 1)){ //Last location
                        string = string.slice(0, -2); //trims off the comma from the previous location
                        string += (" or " + arr[i][j][k] + "."); //adds final location with proper grammar
                    } else { //Any other location
                        string += (arr[i][j][k] + ", "); //adds location to string with a comma
                    }
                }
            }
        };

        console.log(string); //Displays string for the first element
    };
};

printVacations([ ['Tammy', ['Tahiti', 'Bali', 'Hawaii']], ['Erin', ['Banff, Alberta, Canada', 'Iceland']], ['Janet', ['London', 'Hogwarts']] ]);
console.log("EXPECTED OUTPUT: \n Tammy is willing to go to Tahiti, Bali or Hawaii. \n Erin is willing to go to Banff, Alberta, Canada or Iceland.\n Janet is willing to go to London or Hogwarts.")