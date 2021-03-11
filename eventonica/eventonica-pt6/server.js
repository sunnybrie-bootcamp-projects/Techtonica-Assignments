const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser());
app.set("view engine", "pug");

//ROUTES
const guestLanding = app.route('/guestlanding');
const indexPage = app.route('/');
const usersPage = app.route('/users');
const userDashboard = app.route('/dashboard');

app.listen(port, () => {
    console.log(`Server running on port ${port}...`);
});

//LANDING PAGE FOR GUESTS NOT LOGGED IN
guestLanding.get((req, res) => {
  const name = req.cookies.username;

  if (name) {
    res.redirect("/");
  } else {
    res.render("guestlanding", { name: req.cookies.username });
  }
});

guestLanding.post((req, res) => {
  res.cookie("username", req.body.username);
  res.redirect("/");
});

//INDEX FOR USERS
indexPage.get((req, res) => {
  const name = req.cookies.username;

  if (name) {
    res.render("index", { name: name });
  } else {
    res.redirect("/guestlanding");
  }
});


