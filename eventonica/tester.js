//CLASSES

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

  toggleFavorite(e){
    if(this.userFavorites.includes(e)){
      let removed = this.userFavorites.splice((this.userFavorites.indexOf(e)), 1);
    } else {
      this.userFavorites.push(e);
    };
  }

}

//GLOBAL TEST VARIABLES
var testTonica = new Eventonica();

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
User.allUsers[0].userFavorites = [Event.allEvents[0], Event.allEvents[2]];
testTonica.addUser("Jitterbug19", "lolbutts");
User.allUsers[1].userFavorites = [Event.allEvents[1], Event.allEvents[2]];
testTonica.addUser("TechfaceMcGee", "asdfghjkl");
User.allUsers[2].userFavorites = [Event.allEvents[0]];

var loggedIn = User.allUsers[0];


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

  //console.log(listTable); //TEST

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

  if((loggedIn.userFavorites).includes(currentEvent)){
    newFaveStatus.innerHTML = `<img src="graphics/favorite.png" class="Fave" onclick="loggedIn.toggleFavorite('${currentEvent}')">`;
  } else {
    newFaveStatus.innerHTML = `<img src="graphics/notfavorite.png" class="notFave" onclick="loggedIn.toggleFavorite('${currentEvent}')">`;
  };

  newRow.appendChild(newFaveStatus);

};

//calls initializeEvent on all events in allEvents array
function loadEventList() {
  eventList = document.getElementById("eventTable").tBodies.namedItem("eventList"); //Gets Event List Table from HTML
  console.log(`Loading event list...`); //Test
  console.log(eventList); //Test

  for (item of Event.allEvents) {
    initializeEvent(item, eventList);
  }
};

//Takes event info inputed from user, creates event, and calls initializeEvent
function getSubmittedEvent(){
  console.log(`Getting event submission...`); //TEST
  let testForm = document.getElementById("eventSubmission").elements; //Contains an array of the form elements
  //console.log(testForm); //TEST
  eventList = document.getElementById("eventTable").tBodies.namedItem("eventList");
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

function toggleFave(e){
  loggedIn.toggleFave(e);
};
// ------ FOR USERS ---

// Adds User to User Board
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
  console.log(Event.allEvents);//TEST

  let newFaves = document.createElement("td");
  newFaves.setAttribute("class", "faveEvents");
  newFaves.setAttribute("headers", "th-fave");
  
  let newList = document.createElement("ul");
  newList.setAttribute("class", "listOfFaves");
  
  currentUser.userFavorites.forEach((fave) => {

    let eName = `${fave.eventName}`;

    //console.log(`Event Found: ${eName}`); //TEST

    let newListItem = document.createElement("li");

    newListItem.innerHTML = `${eName}`;
    newList.appendChild(newListItem);
  });

  newFaves.appendChild(newList);
  newRow.appendChild(newFaves);
};

// Runs every user in allUsers through initializeUser
function loadUserList() {
  userList = document.getElementById("userTable").tBodies.namedItem("userList"); //Gets User List Table from HTML
  //console.log(`Loading user list...`); //Test
  //console.log(userList); //Test

  for (item of User.allUsers) {
    initializeUser(item, userList);
  }
};


//--- SITE EVENT LISTENERS ---
//Triggers loadEventList() function
window.addEventListener('DOMContentLoaded', function(){

  let whatPage = document.title;
  //console.log(whatPage); //TEST

  switch(whatPage){
    case "Eventonica Event Board":
      loadEventList();
      break;
    case "Eventonica Users":
      loadUserList();
      break;
    default:
      console.log(`ERROR: Can't determine page.`);
      break;


  };

  var submitButton = document.getElementById("submitEvent");
  console.log(submitButton);
  submitButton.addEventListener("click", getSubmittedEvent);
});




//---- FOR TESTING ----
