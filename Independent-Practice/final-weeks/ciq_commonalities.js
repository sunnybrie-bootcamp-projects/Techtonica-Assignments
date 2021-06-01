//iterate through each element in one array
//check other array for element
//if found, push to a container variable
//return container variable afterwards

function findCommons(arr1, arr2) {
  let commons = [];

  arr1.forEach((item) => {
    if (arr2.indexOf(item) !== -1) {
      commons.push(item);
    }
  });

  return commons;
}

console.log(findCommons([1, 2, 3, 4, 5, 6, 7], [4, 6, 7, 8, 9, 10]));

console.log(
  findCommons(
    ["berries", "bananas", "tomatoes", "water", "potatoes", "pasta"],
    ["water", "green beans", "eggs", "berries"]
  )
);
