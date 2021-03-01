/*
window.onload = function(){
    var script = document.createElement("script");
    script.src = "https://code.jquery.com/jquery-3.4.1.min.js";
    script.type = "text/javascript";
    document.getElementsByTagName("head")[0].appendChild(script);
};

*/

var eventsList = [];

class Event {

    constructor(name){
        this.eventName = `<eventname> ${name} </eventname>`;
        this.tickets = [];

        eventsList.push(this);
    }

    addAvailableTicket = function(type, price){
        this.tickets.push({type: type, price: price});
    }

    searchTickets = function(min, max){
        return this.tickets.filter(ticket => {return (ticket.price >= min && ticket.price <= max);});
    }
};

function getEvents() {
    let html = '';
    html += `<thead>
        <tr>
            <td><h2>Upcoming Events</h2></td>
        </tr>
    </thead>
                `;

    $.each(eventsList, function(){
        html += `<tr>
            <td>${this.eventName}</td>`;

        $.each(this.tickets, function(){
          html += `<td class="ticket" style="display:table-cell">${this.type}: $<span class="ticketprice">${this.price}</span></td>`; 
        });

        html += `
        </tr>`;
        
    });

    $("#event-list").html(html);
};

function searchAllTickets() {
  console.log(`Searching tickets...`); //TEST

  let minPrice = document.getElementById(
    "min-price"
  ).value;
  let maxPrice = document.getElementById(
    "max-price"
  ).value;;

  console.log(`minPrice: ${minPrice}`); //TEST
  console.log(`maxPrice: ${maxPrice}`); //TEST

  withinRange = function (val, min, max) {
    return (val >= min && val <= max);
  };

  $.each($(".ticket"), function () {
    let checkVal = $(this).find("span").innerHTML;

    if (!withinRange(checkVal, minPrice, maxPrice)) {
      $(this).style = "display:none";
    }
  });
};





var pinkConcert = new Event("P!nk Concert!");
pinkConcert.addAvailableTicket("Kids", 10);
pinkConcert.addAvailableTicket("Regular", 40);
pinkConcert.addAvailableTicket("VIP", 70);

var cookingForDogs = new Event("Cooking For Dogs");
cookingForDogs.addAvailableTicket("Kids", 10);
cookingForDogs.addAvailableTicket("Regular", 40);
cookingForDogs.addAvailableTicket("VIP", 70);

var fiftyCentFNB = new Event("Fifty Cent, feat. Nickelback");
fiftyCentFNB.addAvailableTicket("Regular", 0.45);

var pineappleTT = new Event("Ted Talk: Why You Shouldn't Understand Pineapples");
pineappleTT.addAvailableTicket("Kids", 0);
pineappleTT.addAvailableTicket("Regular", 5);
pineappleTT.addAvailableTicket("VIP", 40);

$(document.getElementsByTagName("body")).ready(getEvents());