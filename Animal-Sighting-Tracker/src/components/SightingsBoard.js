import React, { useEffect, useState, useCallback } from "react";
import Sighting from "./Sighting";

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
      alert("Error: Data not fetched!", e);
      console.log("Error: Data not fetched!");
    }
  };

  useEffect(() => {
    fetchData();
    updateSwitch(false);
  }, [tableData]);

  return (
    <div className="SightingsBoard">
      <ul>
        {tableData ? (
          tableData.map((item, index) => {
            return <li> <Sighting key={index} props={item} /> </li>;
          })
        ) : (
          <p>Something went wrong... :c</p>
          )}
      </ul>
    </div>
  );
}

export default SightingsBoard;
