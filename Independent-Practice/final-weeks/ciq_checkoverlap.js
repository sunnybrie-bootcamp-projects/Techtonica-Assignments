// An axis-aligned rectangle is represented as a list [x1, y1, x2, y2], where (x1, y1) is the coordinate of its bottom-left corner,
// and (x2, y2) is the coordinate of its top-right corner. Its top and bottom edges are parallel to the X-axis,
// and its left and right edges are parallel to the Y-axis.

// Two rectangles overlap if the area of their intersection is positive. To be clear, two rectangles that only touch at the corner or edges do not overlap.

// Given two axis-aligned rectangles rec1 and rec2, return true if they overlap, otherwise return false.

// Example 1:
// Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
// Output: true

// Example 2:
// Input: rec1 = [0,0,1,1], rec2 = [1,0,2,1]
// Output: false

// Example 3:
// Input: rec1 = [0,0,1,1], rec2 = [2,2,3,3]
// Output: false
// /**
//  * @param {number[]} rec1
//  * @param {number[]} rec2
//  * @return {boolean}
//  */

function checkForOverlap(rec1, rec2) {
  //declaring variables as objects for easier readability
  let recA = {
    leftX: rec1[0],
    bottomY: rec1[1],
    rightX: rec1[2],
    topY: rec1[3],
  };
  let recB = {
    leftX: rec2[0],
    bottomY: rec2[1],
    rightX: rec2[2],
    topY: rec2[3],
  };
  let count = 0;

  //checking if bottom left corner is between or not
  //recA
  if (
    recB.leftX < recA.leftX < recB.rightX &&
    recB.bottomY < recA.bottomY < recB.topY
  ) {
    count++;
  }
  //recB
  if (
    recA.leftX < recB.leftX < recA.rightX &&
    recA.bottomY < recB.bottomY < recA.topY
  ) {
    count++;
  }

  //checking if top right corner is between or not
  //recA
  if (
    recB.leftX < recA.rightX < recB.rightX &&
    recB.bottomY < recA.topY < recB.topY
  ) {
    count++;
  }
  //recB
  if (
    recA.leftX < recB.rightX < recA.rightX &&
    recA.bottomY < recB.topY < recA.topY
  ) {
    count++;
  }

  //Because these are rectangles, a minimum of two conditions must be met for it to overlap
  return count >= 2;
}

console.log(checkForOverlap([0, 0, 1, 1], [2, 2, 3, 3])); //false

console.log(checkForOverlap([0, 0, 2, 2], [1, 1, 3, 3])); //true

console.log(checkForOverlap([0, 0, 1, 1], [1, 0, 2, 1])); //false
