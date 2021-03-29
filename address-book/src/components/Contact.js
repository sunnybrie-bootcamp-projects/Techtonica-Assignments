import React from 'react';
import DeleteButton from './DeleteButton';

function Contact(props){
    let date = new Date(props.date);

    let dateString = date.toLocaleDateString("en-GB", {
      day: "numeric",
      month: "short",
      year: "numeric",
    });
    let time = date.toLocaleTimeString(undefined, {
      hour: "2-digit",
      minute: "2-digit",
    });

    let newEmail = props.email.split("");
    let insert = newEmail.indexOf('@');
    newEmail.splice((insert), 0, `\n`);
    newEmail.join("");

    return (
      <>
        <td className="name" headers="th-name">
          <p>{props.firstname} {props.lastname}</p>
        </td>
        <td className="phoneNumber" headers="th-phonenumber">
          <p>{props.phonenumber}</p>
        </td>
        <td className="email" headers='th-email'>
          <p>{newEmail}</p>
        </td>
      </>
    );
}

export default Contact;