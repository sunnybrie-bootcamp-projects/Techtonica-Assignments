import React from 'react';

function DeleteButton (props){

    const deleteContact = async (e) => {
        e.preventDefault();
        try {

        const response = await fetch(`http://localhost:9000/delete/:${props.id}`, {
            method: "GET",
            headers: { "Content-Type": "application/json" },
        }).catch((e) => {
            console.log(`Get request failed...`, e.message); //TEST
        });

        const update = await response.json();
        console.log(`Server Response`, update); //TEST
        window.alert("Contact deleted!");

        props.fetchData();

        window.location = "/";

        } catch (err) {
        console.error(err.message);
        }
  };


    return (
        <button className="deleteButton" onClick={deleteContact}>Delete</button>
    )
}

export default DeleteButton;