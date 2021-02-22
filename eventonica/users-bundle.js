(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
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


},{"./node_modules/classes":2}],2:[function(require,module,exports){
class Eventonica {
  addEvent(name, description, category, date) {
    return new Event(name, description, category, date);
  }

  updateEvent(efindKey, efindValue, echangeKey, echangeValue) {
    let eventFound = allEvents.find(
      (e) => e[searchKeyChecker("event", efindKey)] == efindValue
    );

    if (eventFound != undefined) {
      eventFound[echangeKey] = echangeValue;
    } else {
      console.log("Updates failed. Event not found.");
    }
  }

  deleteEvent(efindKey, efindValue) {
    let eventFound = Event.allEvents.findIndex(
      (e) => e[searchKeyChecker("event", efindKey)] == efindValue
    );

    console.log(`Deleting event...
    Searching for: "${searchKeyChecker("event", efindKey)}"
    With Value:  ${efindValue}
    Event Found at Index: ${eventFound}
    Event: ${Event.allEvents[eventFound]}`); //TEST

    if (eventFound !== -1) {
      Event.allEvents.splice(eventFound, 1); //Deletes event

      let updateId = Event.allEvents.slice(eventFound); //Gets list of all events needing new id's
      updateId.forEach((e) => e.id--); //Updates all event id's
      Event._nextId--; //resets Id number
    } else {
      console.log("Deletion failed. Event not found.");
    }
  }

  findEventsByDate(checkDate) {
    let compDate1 = new Date(checkDate);
    compDate1 = compDate1.toDateString();

    console.log(`Searching by date...`); //TEST

    let searchResults = [];

    Event.allEvents.forEach((e) => {
      console.log(e.eventDate);
      let compDate2 = e.eventDate.toDateString();

      console.log(`Comparing dates...
        ${compDate1} | ${compDate2}`); //TEST

      if (compDate1 == compDate2) {
        searchResults.push(e);
      }
    });

    console.log(`Found: `); //TEST
    console.log(searchResults); //TEST

    return searchResults;
  }

  findEventsbyCategory(checkCat) {
    let compCat1 = checkCat;

    console.log(`Searching by category...`); //TEST

    let searchResults = [];

    Event.allEvents.forEach((e) => {
      console.log(e.eventDate);
      let compCat2 = e.eventCategory;

      console.log(`Comparing categories...
        ${compCat1} | ${compCat2}`); //TEST

      if (compCat1 == compCat2) {
        searchResults.push(e);
      }
    });

    console.log(`Found: `); //TEST
    console.log(searchResults); //TEST

    return searchResults;
  }

  addUser(newName, newPassword) {
    new User(newName, newPassword);
  }

  updateUser(ufindKey, ufindValue, uchangeKey, uchangeValue) {
    let userFound = User.allUsers.find(
      (u) => u[searchKeyChecker("user", ufindKey)] == ufindValue
    );

    if (userFound != -1) {
      userFound[uchangeKey] = uchangeValue;
    } else {
      console.log("Updates failed. User not found.");
    }
  }

  deleteUser(ufindKey, ufindValue) {
    let userFound = allUsers.findIndex(
      (u) => u[searchKeyChecker("user", ufindKey)] == ufindValue
    );

    console.log(`Deleting user...
    Searching for: "${searchKeyChecker("user", ufindKey)}"
    With Value:  ${ufindValue}
    User Found at Index: ${userFound}
    User: ${User.allUsers[userFound]}`); //TEST

    if (userFound != undefined) {
      allUsers.splice(userFound, 1); //Deletes user

      let updateId = allUsers.slice(userFound); //Gets list of all users needing new id's
      updateId.forEach((u) => u.id--); //Updates all user id's
      User._nextId--; //resets Id number
    } else {
      console.log("Deletion failed. User not found.");
    }
  }
}

class Event {
  static allEvents = [];
  static _nextId = 100;

  constructor(name, description, category, date) {
    this.id = Event._nextId++;
    this.eventName = name;
    this.eventDescription = description;
    this.eventCategory = category;
    this.eventDate = new Date(date);

    Event.allEvents.push(this); // keep track of all created instances
  }

  //SEARCH EVENTS BY DATE
  static findByDate(checkDate) {
    let compDate1 = checkDate.toDateString();

    dateReducer = function (acc, ind) {
      let compDate2 = ind.eventDate.toDateString();
      if (compDate1 == compDate2) {
        acc.push(ind);
      }
    };

    let searchResults = Event.allEvents.filter(dateReducer, []);

    return searchResults;
  }

  //SEARCH EVENTS BY CATEGORY
  static findByCategory(checkCat) {
    let compCat1 = checkCat;

    catReducer = function (acc, ind) {
      let compDate2 = ind.eventCategory;
      if (compCat1 == compCat2) {
        acc.push(ind);
      }
    };

    let searchResults = Event.allEvents.filter(catReducer, []);

    return searchResults;
  }
}

class User {
  static allUsers = [];
  static _nextId = 200;

  constructor(name, password) {
    this.id = User._nextId++;

    this.userName = name;
    this.userPassword = password;
    this.userDateJoined = new Date();
    this.userFavorites = [];

    if (this.id % 2 == 0) {
      this.avatar = `<img src="graphics/defaultavatar2.png" class="userAvatar">`;
    } else {
      this.avatar = `<img src="graphics/defaultavatar1.png" class="userAvatar">`;
    }

    User.allUsers.push(this); // keep track of all created instances
  }
}

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



module.exports = {Eventonica, Event, User};
},{}]},{},[1]);
