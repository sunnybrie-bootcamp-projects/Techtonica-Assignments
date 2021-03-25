import React, { useEffect, useState } from "react";

//Empty add form
const initialState = {
  name: ["Nickname",],
  appeared_healty: true,
  location: "Location Seen",
  email: "example@mail.com",
  date: new Date(),
};

function reducer(state, action) {
  switch (action.type) {
    case "editDate":
      return { ...state, date: action.value };

    case "editName":
      return { ...state, name: action.value };


    case "editLocation":
      return { ...state, location: action.value };

    case "editHealth":
      return { ...state, appeared_healthy: action.value };

    case "editEmail":
      return { ...state, email: action.value };
    case "wipe":
      return { ...initialState };
    default:
      return state;
  }
}

//ADD FORM, CHILD OF EVENTBOARD
function SightingAddForm(props) {
  const [state, dispatch] = React.useReducer(reducer, initialState);
  const [numSeen, plusMinus] = React.useState([""]);

  const onSubmitForm = async (e) => {
    e.preventDefault();
    try {
      const body = state;
      console.log("Attempting to post...", JSON.stringify(body)); // TEST

      const response = await fetch("http://localhost:9000/sightings", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
      response.catch((e) => {
        console.log(`POST didn't send...`); //TEST
      });

      const update = await response.json();
      console.log(`Server Response`, update); //TEST
      window.alert("Report submitted!");

      props.fetchData();
      dispatch({type: "wipe", value: {initialState}});

      window.location = "/";

    } catch (err) {
      console.error(err.message);
    }
  };

  return (
    <>
      <form
        className="sightingSubmission"
        id="sightingSubmission"
        action="#sightingSubmission"
        onSubmit={onSubmitForm}
      >
        <h2 className="tableTitle">Report Sighting</h2>
        <label for="in-Date">Date Seen:</label>
        <input
          id="in-Date"
          type="datetime-local"
          value={state.date}
          onChange={(e) => {
            dispatch({ type: "editDate", value: e.target.value });
          }}
        />
        {numSeen.map((value, index) => {
          return (
            <>
              <label key={index + 30} for="in-Name">
                Name:
              </label>
              <input
                key={index + 31}
                id="in-Name"
                type="text"
                value={state.name[index]}
                onChange={(e) => {
                  dispatch({
                    type: "editName",
                    value: state.name.map((n, i) => {
                      if (i === index) {
                        return e.target.value;
                      }

                      return n;
                    }),
                    index: e.target.index,
                  });
                }}
              />
            </>
          );
        })}

        <button onClick={() => plusMinus(numSeen.concat(["Nickname"]))}>
          +
        </button>
        {numSeen.length > 1 ? (
          <button
            onClick={() =>
              plusMinus(() => {
                numSeen.splice(numSeen.length - 2, 1);
                return numSeen;
              })
            }
          >
            -
          </button>
        ) : (
          <> </>
        )}

        <label for="in-Health"> Appeared Healthy? </label>
        <div
          id="in-Health"
          onChange={(e) => {
            dispatch({ type: "editHealth", value: e.target.value });
          }}
        >
          <input type="radio" value={true} name="gender" /> Yes
          <input type="radio" value={false} name="gender" /> No
        </div>

        <label for="in-Location">Location of Sighting:</label>
        <input
          id="in-Location"
          rows="10"
          cols="30"
          value={state.desc}
          onChange={(e) => {
            dispatch({ type: "editLocation", value: e.target.value });
          }}
        />

        <label for="in-Email">Your Email:</label>
        <input
          id="in-Email"
          type="text"
          value={state.Email}
          onChange={(e) => {
            dispatch({ type: "editEmail", value: e.target.value });
          }}
        />

        <input id="submitSighting" type="submit" />
      </form>
    </>
  );
}

export default SightingAddForm;