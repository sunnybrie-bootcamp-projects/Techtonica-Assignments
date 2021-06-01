//Tutorial: https://www.youtube.com/watch?v=zrLf4KMs71E
//api key = AIzaSyAliQLgQboCLp-60MEPwa0QHEQ8tqw0GK4
const { google } = require("googleapis");

const { OAuth2 } = google.auth;

const oAuth2Client = new OAuth2(
  "104333319674-qmpthkcdkmcj7v2n3j67at8d145llrqd.apps.googleusercontent.com",
  "5x9v56w3zmKSKGeZDnea_Xka"
);

oAuth2Client.setCredentials({
  access_token:
    "ya29.a0AfH6SMDKebS7vZfXG7eRoqum86iXjiq4Q4O2zFU4JKyMeS_SAwvuqUD3K40DwJyGJEFPawmLgzoBO5wd533nX9u0QsvMejiu8uKoE2qIJrwhX3wznjdMKP4sOLpINEgZkdEBkAPxNA647CNy4sQtmRCtNg5J",
  scope:
    "https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/calendar.events",
  token_type: "Bearer",
  expires_in: 3599,
  refresh_token:
    "1//04ZCtol4RyYmlCgYIARAAGAQSNwF-L9IrKwh76eg6926ZXHSdg7iohBO4VKnClz3n3jyvASATo0yj0t2hW7ilrtayGOtaJJX2Oy8",
});

const SCOPES = [
  "https://www.googleapis.com/auth/calendar",
  "https://www.googleapis.com/auth/calendar.events",
];

function getNewToken(oAuth2Client) {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: "offline",
    scope: SCOPES,
  });

  console.log("Authorize this app by visiting this url:", authUrl);
}

getNewToken(oAuth2Client);

//CALENDAR FUNCTIONS *******************************
const calendar = google.calendar({ version: "v3", auth: oAuth2Client });

//Fake Event Set Up
const eventStartTime = new Date();
eventStartTime.setDate(eventStartTime.getDate() + 2);

const eventEndTime = new Date();
eventEndTime.setDate(eventEndTime.getDate() + 2);
eventEndTime.setMinutes(eventEndTime.getMinutes() + 45);

const myEvent = {
  summary: `Brie's Fake Meeting`,
  location: "285 California St St, San Francisco, CA 94111",
  description: "Just an event I made to test the google api.",
  start: {
    dateTime: eventStartTime,
    timeZone: "America/Los_Angeles",
  },
  end: {
    dateTime: eventEndTime,
    timeZone: "America/Los_Angeles",
  },
  colorId: 1,
};

//Query to add event
/*
calendar.freebusy.query({
    resource: {
        timeMin: eventStartTime,
        timeMax: eventEndTime,
        timeZone: 'America/Los_Angeles',
        items: [{ id: 'primary' }],
    }
}, (err, res) => {
    if(err) return console.error('Free Busy Query Error: ', err)

    const eventsArr = res.data.calendars.primary.busy; 

    if(eventsArr.length === 0) 
        return calendar.events.insert(
            { calendarId: 'primary', resource: myEvent }, 
            err => {
                if(err) return console.error('Calendar Event Creation Error: ', err)

                return console.log('Calendar Event Created.');
            }
        )

        return console.log("Sorry, I'm busy.");
});
*/

//Dummy search window
const windStartTime = new Date();
windStartTime.setDate(windStartTime.getDate() - 8);

const windEndTime = new Date();
windEndTime.setDate(windEndTime.getDate() + 8);

//Query to display my events for the week

function execute() {
  return calendar.events
    .list({
      calendarId: "sunny.codetester@gmail.com",
      maxResults: 5,
      showDeleted: false,
      singleEvents: true,
      timeZone: "America/Los_Angeles",
      timeMin: windStartTime,
      timeMax: windEndTime,
    })
    .then(
      function (response) {
        // Handle the results here (response.result has the parsed body).
        //console.log("Response", response);
        console.log(response.data.items);
      },
      function (err) {
        console.error("Execute error", err);
      }
    );
}

// ****   GITHUB COPY PASTE ****
/*
// Create a new calender instance.
const calendar = google.calendar({ version: 'v3', auth: oAuth2Client })

// Create a new event start date instance for temp uses in our calendar.
const eventStartTime = new Date()
eventStartTime.setDate(eventStartTime.getDate() + 2)

// Create a new event end date instance for temp uses in our calendar.
const eventEndTime = new Date()
eventEndTime.setDate(eventEndTime.getDate() + 2)
eventEndTime.setMinutes(eventEndTime.getMinutes() + 45)

// Create a dummy event for temp uses in our calendar
const event = {
  summary: `Meeting with David`,
  location: `3595 California St, San Francisco, CA 94118`,
  description: `Meet with David to talk about the new client project and how to integrate the calendar for booking.`,
  colorId: 1,
  start: {
    dateTime: eventStartTime,
    timeZone: "America/Los_Angeles",
  },
  end: {
    dateTime: eventEndTime,
    timeZone: "America/Los_Angeles",
  },
}

// Check if we a busy and have an event on our calendar for the same time.
calendar.freebusy.query(
  {
    resource: {
      timeMin: eventStartTime,
      timeMax: eventEndTime,
      timeZone: "America/Los_Angeles",
      items: [{ id: 'primary' }],
    },
  },
  (err, res) => {
    // Check for errors in our query and log them if they exist.
    if (err) return console.error('Free Busy Query Error: ', err)

    // Create an array of all events on our calendar during that time.
    const eventArr = res.data.calendars.primary.busy

    // Check if event array is empty which means we are not busy
    if (eventArr.length === 0)
      // If we are not busy create a new calendar event.
      return calendar.events.insert(
        { calendarId: 'primary', resource: event },
        err => {
          // Check for errors and log them if they exist.
          if (err) return console.error('Error Creating Calender Event:', err)
          // Else log that the event was created.
          return console.log('Calendar event successfully created.')
        }
      )

    // If event array is not empty log that we are busy.
    return console.log(`Sorry I'm busy...`)
  }
)
*/
