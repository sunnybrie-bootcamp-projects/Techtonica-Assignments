(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
const myClasses = require('./node_modules/classes');
const _Eventonica = myClasses.Eventonica;
const _Event = myClasses.Event;
const _User = myClasses.User;

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




// --- HTML DOM MANIPULATION FUNCTIONS ---
// ------ FOR EVENTS ---

//Adds new event to event board
function initializeEvent(currentEvent, listTable){
  let newRow = document.createElement("tr");
  newRow.setAttribute("class", "eventListItem");

  console.log(listTable);

  listTable.appendChild(newRow);

  let newDate = document.createElement("td");
  let eDate = currentEvent.eventDate; //to spare typing it out over and over
  newDate.setAttribute("class", "date");
  newDate.setAttribute("headers", "th-date");
  newDate.innerHTML = `<h4 class="eventDay">${getDayString(eDate)}</h4>
  <h4 class="eventDate">${eDate.getDate()}</h4>
  <h4 class="eventMonth">${getMonthString(eDate)}</h4>`;
  newRow.appendChild(newDate);

  let newDescription = document.createElement("td");
  newDescription.setAttribute("class", "description");
  newDescription.setAttribute("headers", "th-description");
  newDescription.innerHTML = `<h4 class="eventName">${currentEvent.eventName}</h4>
  <p class="eventDescription">${currentEvent.eventDescription}</p>`;
  newRow.appendChild(newDescription);

  let newCategory = document.createElement("td");
  newCategory.setAttribute("class", "category");
  newCategory.setAttribute("headers", "th-category");
  newCategory.innerHTML = `${currentEvent.eventCategory}`;
  newRow.appendChild(newCategory);

  let newFaveStatus = document.createElement("td");
  newFaveStatus.setAttribute("class", "fave");
  newFaveStatus.setAttribute("headers", "th-fave");
  newFaveStatus.innerHTML = `<img src="graphics/notfavorite.png" class="notFave">`;
  newRow.appendChild(newFaveStatus);

};

//calls initializeEvent on all events in allEvents array
function loadEventList() {
  eventList = document.getElementById("eventTable").tBodies.namedItem("eventList"); //Gets Event List Table from HTML
  console.log(`Loading event list...`); //Test
  console.log(eventList); //Test

  for (item of _Event.allEvents) {
    initializeEvent(item, eventList);
  }
};

//Takes event info inputed from user, creates event, and calls initializeEvent
function getSubmittedEvent(){
  console.log(`Getting event submission...`); //TEST
  let testForm = document.getElementById("eventSubmission").elements; //Contains an array of the form elements
  //console.log(testForm); //TEST
  let deliveryBox = new Object; 

  for (item of testForm) {
    console.log(`${item.id}`); //TEST
    console.log(`${item}`); //TEST
    console.log(`${item.value}`); //TEST

    if(`${item.id}`.includes("Date")){
      deliveryBox.date = `${item.value}`;
    }else
    if(`${item.id}`.includes("Name")){
      deliveryBox.name = `${item.value}`;
    }else
    if(`${item.id}`.includes("Description")){
      deliveryBox.description = `${item.value}`;
    }else
    if(`${item.id}`.includes("Category")){
      deliveryBox.category = `${item.value}`;
    }else{
      console.log("Value not registered");
    };
          
  };

  console.log(deliveryBox); //TEST
  let newestEvent = testTonica.addEvent(deliveryBox.name, deliveryBox.description, deliveryBox.category, deliveryBox.date);
  initializeEvent(newestEvent, eventList);
};

//Triggers loadEventList() function
window.addEventListener('DOMContentLoaded', (event) => {
  loadEventList();
});


//---- FOR TESTING ----

//------ DECLARED OBJECTS ---
var testTonica = new _Eventonica();

testTonica.addEvent("Pet Festival", "Pet adoption festival!", "festival", "6-29-2021");
testTonica.addEvent("Lizzo Concert", "F*ck yeah, Lizzo!", "concert", "4-1-2021");
testTonica.addEvent("Tech Art Show", "Art in tech", "Gallery", "4-12-2021");


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
