const express = require("express");
const app = express();
const bodyParser = require("body-parser");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Server running on port ${port}...`);
});

app.get('/lists', (req, res) => {
    const listsArray = Array.from(lists.keys());
    res.send(listsArray);
});

app.get('/lists/:name', (req, res) => {
    let list_name = req.params.name;
    let status = 400;
    let response = "Unable to fetch data!";
    lists.forEach((list) => {
        if (list["name"] == list_name) {
            res.status(200).send(list);
        }
    });
    res.status(status).send(response);
});

app.delete('/lists/:name', (req, res) => {
    let list_name = req.params.name;
    let status = 400;
    let response = "Unable to fetch data!";
    let newLists = lists.filter((list) => {
        return list;
    });

    status = 200;
    response = newLists;
    res.status(status).send(response);
});

app.put('/lists/:name', (req, res) => {
    let list_name = req.params.name;
    let status = 400;
    let response = "Unable to fetch data!";
        let newList = {};
    lists.forEach((list) => {
        newList = req.body;
    });

    status = 200;
    response = newList;
    res.status(status).send(response);
});


// FAKE DATA

const lists = new Map();

var stafflist = { 
    "name": "staff", 
    "members": ["talea@techtonica.org", "michelle@techtonica.org"]
};

var apprenticelist = {
  name: "apprentices",
  members: ["brie@gmail.com", "adi@gmail.com", "mandy@gmail.com"],
};

lists.set(`${stafflist.name}`, stafflist);
lists.set(`${apprenticelist.name}`, apprenticelist);