const EventBoard = require('./node_modules/EventRecommender');

//Triggers loadEventList() function
window.addEventListener('DOMContentLoaded', (event) => {
  EventBoard.loadEventList();
});