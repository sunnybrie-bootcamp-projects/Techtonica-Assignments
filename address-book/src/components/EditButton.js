import React, { useEffect, useState } from "react";



function EditButton(props) {
  //Starting Edit Form
  const initialState = {
    name: { firstname: props.firstname, lastname: props.lastname },
    phonenumber: props.phonenumber,
    email: props.email,
  };

  const initialRender = (`
    <button
      className="pre-editButton"
      onClick={() => checkUpdate(!props.updateContact)}
    >
      Edit
    </button>`
  );

  function reducer(state, action) {
    switch (action.type) {
      case "editFirstName":
        return { ...state, name: { ...state.name, firstname: action.value } };

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

  const [state, dispatch] = React.useReducer(reducer, initialState);
  const [renderState, updateRender] = React.useState(initialRender);
  const {updateContact, checkUpdate} = props;

  const editContact = async (e) => {
    e.preventDefault();
    try {
        const body = state;
        const response = await fetch(`http://localhost:9000/edit/:${props.id}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body),
        }).catch((e) => {
            console.log(`Get request failed...`, e.message); //TEST
        });

        const update = await response.json();
        console.log(`Server Response`, update); //TEST
        window.alert("Contact changed!");

        props.fetchData();

        window.location = "/";
    } catch (err) {
      console.error(err.message);
    }
  }

  const forRender = (optionCheck) => { 
        return ((optionCheck) ? 
            (
                <button className="pre-editButton" onClick={() => checkUpdate(!props.updateContact)}>
                    Edit
                </button>
            )   :
            (
                <div className="contact">
                    <form
                        className="contactEdit"
                        id="contactEdit"
                        action="#contactEdit"
                        onSubmit={editContact}
                    >
                        <div className="name">
                            <h3>First Name - Last Name</h3>
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
                        </div>
                        <div className="phoneNumber">
                            <h3>PhoneNumber</h3>
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
                        </div>
                        <div className="email">
                            <h3>Email</h3>
                            <input
                                id="in-Email"
                                type="text"
                                value={state.Email}
                                onChange={(e) => {
                                    dispatch({ type: "editEmail", value: e.target.value });
                                }}
                            />
                        </div>
                
                        <button 
                            className="editButton" 
                            onClick={editContact}
                        >
                        Edit
                        </button>
                        <button className="cancel-editButton" onClick={() => checkUpdate(!props.updateContact)}>
                            Edit
                        </button>
                    </form>
                </div>
            )
        )
    }
    
    useEffect(() => {
        updateRender(forRender(updateContact));
    })

  return (
    {renderState}
  )
}

export default EditButton;
