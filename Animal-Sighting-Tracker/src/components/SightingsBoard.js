import React, { useEffect, useState, useCallback } from "react";
import Sighting from "./Sighting";
import SightingAddForm from "./SightingAddForm";

function SightingsBoard() {
  const [tableData, setTable] = useState([]);
  const [needsUpdate, updateSwitch] = useState(false);

  const fetchData = async () => {
    try {
      let res = await fetch("http://localhost:9000/sightings");
      let sightingResults = await res.json();
      //console.log(sightingResults);

      setTable(sightingResults);
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
    <div className="SightingsBoard">
      <h1>Recent Sightings</h1>
      <SightingAddForm fetchData={() => fetchData} />
      {tableData ? (
        tableData.map((item, index) => {
          return (
            <Sighting
              key={index}
              date={item.date_time}
              individuals={item.individuals}
              location={item.location}
              sighter_email={item.sighter_email}
            />
          );
        })
      ) : (
        <p>Something went wrong... :c</p>
      )}
    </div>
  );
}

export default SightingsBoard;
