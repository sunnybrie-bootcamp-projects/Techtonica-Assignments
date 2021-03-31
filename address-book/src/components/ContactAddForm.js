import React, { useEffect, useState } from "react";

//Empty add form
const initialState = {
  name: {firstname:"first name", lastname: "last name"},
  phonenumber: "(###)###-####",
  email: "example@mail.com",
};

function reducer(state, action) {
  switch (action.type) {
    case "editFirstName":
      return { ...state, name: {...state.name, firstname: action.value}};

    case "editLastName":
      return { ...state, name: { ...state.name, lastname: action.value } };

    case "editPhoneNumber":
      return { ...state, phonenumber: action.value };

    case "editEmail":
      return { ...state, email: action.value };

    case "wipe":
      return { ...initialState };
    default:
      return state;
  }
}

//ADD FORM, CHILD OF ADDRESS BOOK
function ContactAddForm(props) {
  const [state, dispatch] = React.useReducer(reducer, initialState);

  const onSubmitForm = async (e) => {
    e.preventDefault();
    try {
      const body = state;
      console.log("Attempting to post...", JSON.stringify(body)); // TEST

      const response = await fetch("http://localhost:9000/contacts", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      }).catch((e) => {
        console.log(`POST didn't send...`); //TEST
      });

      const update = await response.json();
      console.log(`Server Response`, update); //TEST
      window.alert("Contact added!");

      //props.fetchData();
      dispatch({type: "wipe", value: {initialState}});

      window.location = "/";

    } catch (err) {
      console.error(err.message);
    }
  };

  return (
    <div className="contactAddForm">
      <form
        className="contactSubmission"
        id="contactSubmission"
        action="#contactSubmission"
        onSubmit={onSubmitForm}
      >
        <div className="topper">
          <h2 className="tableTitle">Add New Contact</h2>
        </div>
        <>
          <label for="in-Name">Name:</label>
          <input
            id="in-Name"
            type="text"
            value={state.name.firstname}
            onChange={(e) => {
              dispatch({
                type: "editFirstName",
                value: e.target.value,
                index: e.target.index,
              });
            }}
          />
          <input
            id="in-Name"
            type="text"
            value={state.name.lastname}
            onChange={(e) => {
              dispatch({
                type: "editLastName",
                value: e.target.value,
                index: e.target.index,
              });
            }}
          />
        </>

        <label for="in-Phonenumber">Phone #:</label>
        <input
          id="in-Phonenumber"
          type="text"
          value={state.phonenumber}
          onChange={(e) => {
            dispatch({
              type: "editPhoneNumber",
              value: e.target.value,
              index: e.target.index,
            });
          }}
        />

        <label for="in-Email">Email:</label>
        <input
          id="in-Email"
          type="text"
          value={state.Email}
          onChange={(e) => {
            dispatch({ type: "editEmail", value: e.target.value });
          }}
        />

        <input id="submitContact" type="submit" />
      </form>
    </div>
  );
}

export default ContactAddForm;