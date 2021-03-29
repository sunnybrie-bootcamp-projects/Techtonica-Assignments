import React, { useEffect, useState, useCallback } from "react";
import Contact from "./Contact";
import ContactAddForm from "./ContactAddForm";
import DeleteButton from "./DeleteButton";
import EditButton from "./EditButton";

function AddressBook() {
  const [tableData, setTable] = useState([]);
  const [needsUpdate, updateSwitch] = useState(false);
  const [updateContact, checkUpdate] = useState(false);

  const fetchData = async () => {
    try {
      let res = await fetch("http://localhost:9000/contacts");
      let contactResults = await res.json();
      //console.log("ADDRESS BOOK FETCH RESULTS: ", contactResults);
      
      setTable(contactResults);
    } catch (e) {
      //alert("Error: Data not fetched!", e);
      console.log("Error: Data not fetched!");
    }
  };

  useEffect(() => {
    fetchData();
    updateSwitch(false);
  }, [tableData]);

  return (
    <>
    <h1>My Address Book</h1>
      <table className="addressBook">
        <thead id="addressBookHeader" className="listHeader">
          <tr>
            <th id="th-name">
              <h3>Name</h3>
            </th>{" "}
            <th id="th-phonenumber">
              <h3>Phone Number</h3>
            </th>{" "}
            <th id="th-email">
              <h3>email</h3>
            </th>{" "}
            <th id="th-options">
              <h3>Options</h3>
            </th>
          </tr>
        </thead>
        <tbody id="contactList">
          {tableData ? (
            tableData.map((item, index) => {
              return (
                <tr className="contact">
                  {updateContact ? (
                    <></>
                  ) : (
                    <Contact
                      key={index * 3}
                      id={item.id}
                      firstname={item.first_name}
                      lastname={item.last_name}
                      phonenumber={item.phone_number}
                      email={item.email}
                    />
                  )}
                  <td header="th-options">
                    {/*
                      <EditButton
                        key={index * 3 + 1}
                        fetchData={() => fetchData}
                        updateContact={updateContact}
                        checkUpdate={() => checkUpdate}
                        id={item.id}
                        firstname={item.first_name}
                        lastname={item.last_name}
                        phonenumber={item.phone_number}
                        email={item.email}
                      />*/}
                    <DeleteButton
                      key={index * 3 + 2}
                      fetchData={() => fetchData}
                      id={item.id}
                    />
                  </td>
                </tr>
              );
            })
          ) : (
            <tr>
              <td>
                <p>Something went wrong... :c</p>
              </td>
            </tr>
          )}
        </tbody>
        <tfooter>♡</tfooter>
      </table>
      <ContactAddForm fetchData={() => fetchData} />
    </>
  );
}

export default AddressBook;
