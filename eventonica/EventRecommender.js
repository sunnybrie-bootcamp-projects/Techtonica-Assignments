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
testTonica.addUser("TechfaceMcGee", "asdfghjkl");

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
