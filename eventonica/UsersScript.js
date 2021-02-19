const myClasses = require("./node_modules/classes");
const _Eventonica = myClasses.Eventonica;
const _Event = myClasses.Event;
const _User = myClasses.User;


// ------ FOR USERS ---
function initializeUser(currentUser, listTable){
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

  //Users Favorites
  let newFaves = document.createElement("td");
  newFaves.setAttribute("class", "faveEvents");
  newFaves.setAttribute("headers", "th-fave");
  
  let newList = document.createElement("ul");
  newList.setAttribute("class", "listOfFaves");
  
  currentUser.userFavorites.forEach(fave => {
    let newListItem = document.createElement("li");
    newListItem.innerHTML = `${fave}`;
    newList.appendChild(newListItem);
  });

  newFaves.appendChild(newList);
  newRow.appendChild(newFaves);
};

function loadUserList() {
  userList = document.getElementById("userTable").tBodies.namedItem("userList"); //Gets User List Table from HTML
  console.log(`Loading user list...`); //Test
  console.log(userList); //Test

  for (item of _User.allUsers) {
    initializeUser(item, userList);
  }
};

window.addEventListener("DOMContentLoaded", (event) => {
  loadUserList();
});

var testTonica = new _Eventonica();

testTonica.addUser("Blue", "bananas123");
testTonica.addUser("Jitterbug19", "lolbutts");
testTonica.addUser("TechfaceMcGee", "asdfghjkl");