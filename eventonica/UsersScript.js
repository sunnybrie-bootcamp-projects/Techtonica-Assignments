const myClasses = require("./node_modules/classes");
const _Eventonica = myClasses.Eventonica;
const _Event = myClasses.Event;
const _User = myClasses.User;

//OBJECT DECLARATIONS FOR TESTING PURPOSES
var testTonica = new _Eventonica();

testTonica.addEvent(
  "Pet Festival",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent laoreet dapibus tincidunt. Aliquam eu tempus erat. Proin id dui laoreet, semper massa ut, elementum arcu. Duis convallis neque nunc, gravida iaculis metus ornare quis. Donec et nisi nec leo sagittis tempus. Aenean pulvinar lacus a nulla vestibulum gravida. Aliquam ut imperdiet lacus. Curabitur dignissim enim massa, vel dignissim nisl gravida id. Quisque felis lacus, elementum eu eleifend a, auctor eget purus. Vestibulum a consequat nisl. Nam odio dolor, tincidunt eget blandit ut, pellentesque quis magna. Nam gravida ligula nunc, et cursus risus convallis ac. Nulla viverra pellentesque mauris at elementum. Mauris cursus, quam vel gravida euismod, enim diam porta tellus, consectetur gravida est risus id lacus. Nulla porttitor at orci sed placerat. Vestibulum malesuada, purus vitae placerat ultrices, nunc metus porta urna, non ornare nibh est elementum elit.",
  "Charity Fundraiser",
  "6-29-2021"
);
testTonica.addEvent(
  "Lizzo Concert",
  "Nulla quam sem, rutrum et tempus eget, varius ut odio. Quisque eu mi ut ligula congue maximus sit amet eget felis. Maecenas sit amet aliquam purus. Pellentesque augue turpis, venenatis a diam eget, auctor vulputate libero. Duis hendrerit leo sed lorem sodales, a imperdiet massa aliquam. Etiam vehicula sodales orci vestibulum porta. Donec ut nisl eros. Nunc ac luctus felis, pulvinar tincidunt sem. Curabitur feugiat metus libero, eu aliquet eros convallis ut.",
  "concert",
  "4-1-2021"
);
testTonica.addEvent(
  "Tech Art Show",
  "Aenean auctor, felis in interdum tincidunt, enim mauris consectetur metus, non dapibus turpis odio vel purus. Praesent ligula diam, efficitur id lectus at, varius rhoncus felis. Praesent aliquet leo ac vehicula tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus nec orci felis. Donec rhoncus a purus at condimentum. In venenatis maximus metus non sagittis.",
  "Gallery",
  "4-12-2021"
);

testTonica.addUser("Blue", "bananas123");
_User.allUsers[0].userFavorites = [100, 102];
testTonica.addUser("Jitterbug19", "lolbutts");
_User.allUsers[1].userFavorites = [101, 102];
testTonica.addUser("TechfaceMcGee", "asdfghjkl");
_User.allUsers[2].userFavorites = [100];

//--- MINOR FUNCTONS ---

//Corrects search syntax
function searchKeyChecker(whichClass, check) {
  //console.log(`Checking search key...
  //whichClass: ${whichClass} | check: ${check}`); //TEST
  let trueKey = whichClass;

  switch (check) {
    case "id":
      //console.log(`Interpreted case: id... ${check}?`); //TEST
      trueKey = "id";
      break;

    case "name":
      //console.log(`Interpreted case: Name... ${check}?`); //TEST
      trueKey += "Name";
      break;

    default:
      break;                                   
  };

  //console.log(`Got... ${trueKey}?`); //TEST

  return trueKey;
};

//Return getDay() and getMonth() Date methods as strings
function getDayString(date) {
  let dayNum = date.getDay();
  const weekArr = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  return weekArr[dayNum];
};

function getMonthString(date) {
  let monthNum = date.getMonth();
  const monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  return monthsArr[monthNum];
};


// ------ FOR USERS ---
function initializeUser(currentUser, listTable){
  console.log(`Initializing User...`)//TEST
  console.log(currentUser); //TEST

  let newRow = document.createElement("tr");
  newRow.setAttribute("class", "userListItem");

  console.log(listTable);

  listTable.appendChild(newRow);

  //Users id
  let newID = document.createElement("td");
  newID.setAttribute("class", "userid");
  newID.setAttribute("headers", "th-userid");
  newID.innerHTML = `${currentUser.id}`;
  newRow.appendChild(newID);

  //Users profile (name and avatar)
  let newProfile = document.createElement("td");
  newProfile.setAttribute("class", "profile");
  newProfile.setAttribute("headers", "th-profile");
  newProfile.innerHTML = `<profilepic>${currentUser.avatar}</profilepic>
                        <h4 class="userName">${currentUser.userName}</h4>`;
  newRow.appendChild(newProfile);

  //Date User Joined
  let newDate = document.createElement("td");
  let uDate = currentUser.userDateJoined; //to spare typing it out over and over
  newDate.setAttribute("class", "date");
  newDate.setAttribute("headers", "th-date");
  newDate.innerHTML = `<h4 class="eventDay">${getDayString(uDate)}</h4>
  <h4 class="eventDate">${uDate.getDate()}</h4>
  <h4 class="eventMonth">${getMonthString(uDate)}</h4>
  <h4 class="eventMonth">${uDate.getFullYear()}</h4>`;
  newRow.appendChild(newDate);

  //Users Favorites
  console.log(`Adding User Favorites...`); //TEST
  console.log(_Event.allEvents);//TEST

  let newFaves = document.createElement("td");
  newFaves.setAttribute("class", "faveEvents");
  newFaves.setAttribute("headers", "th-fave");
  
  let newList = document.createElement("ul");
  newList.setAttribute("class", "listOfFaves");
  
  currentUser.userFavorites.forEach((faveID) => {
    let nliEvent = _Event.allEvents.find((e) => {
      return e.id == faveID;
    });

    let eName = `${nliEvent.eventName}`;

    console.log(`Event Found: ${eName}`); //TEST
    console.log(nliEvent); //TEST
    console.log(eName); //TEST

    let newListItem = document.createElement("li");

    newListItem.innerHTML = `${eName}`;
    newList.appendChild(newListItem);
  });

  newFaves.appendChild(newList);
  newRow.appendChild(newFaves);
};

function loadUserList() {
  userList = document.getElementById("userTable").tBodies.namedItem("userList"); //Gets User List Table from HTML
  //console.log(`Loading user list...`); //Test
  //console.log(userList); //Test

  for (item of _User.allUsers) {
    initializeUser(item, userList);
  }
};

window.addEventListener("DOMContentLoaded", (event) => {
  loadUserList();
});

