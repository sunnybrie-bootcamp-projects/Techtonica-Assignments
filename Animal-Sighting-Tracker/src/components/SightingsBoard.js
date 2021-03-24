import React, { useEffect, useState, useCallback } from "react";
import Sighting from "./Sighting";

function SightingsBoard() {
  const [tableData, setTable] = useState([]);
  const [needsUpdate, updateSwitch] = useState(false);
  const [reducedTableData, setReduced] = useState([]);

  const fetchData = async () => {
    try {
      let res = await fetch("http://localhost:9000/sightings");
      let sightingResults = await res.json();
      //console.log(sightingResults);

      setTable(sightingResults);
      setReduced(() => groupedSightings(sightingResults));
    } catch (e) {
      //alert("Error: Data not fetched!", e);
      console.log("Error: Data not fetched!");
    }
  };

  const groupedSightings = (origTable) => {
    let reduced = new Set();
    //END GOAL: reduced = [[{},{},{}], [{}], [{}, {}],]
    let idArr = new Set();

    origTable.forEach(sighting => {
      if(!(idArr.has(sighting.sighting_id))){
        idArr.add(sighting.sighting_id);
      };
    });

/*    function alreadyIncluded(id, compArr) {
      if (compArr.size === 0) {
        return false;
      }
      return compArr.filter((subArr) => subArr[0].species_id === id).length > 0;
    }
*/
    idArr.forEach((idNum) => {
      
        reduced.add(
          origTable.filter((subSighting) => {
            return subSighting.sighting_id === idNum;
          })
        );
      });

    console.log(`POST-FILTERED "reduced": `, reduced); //TEST

    //reduce reduced's subarrays
    function reduceFurther(sightingObj, indexObj) {
      if(!("individuals" in sightingObj)){
        sightingObj.individuals = [{
          nickname: indexObj.nickname,
          common_name: indexObj.common_name,
          appeared_healthy: indexObj.appeared_healthy,
        }];
      } else {
        sightingObj.individuals.push({
          nickname: indexObj.nickname,
          common_name: indexObj.common_name,
          appeared_healthy: indexObj.appeared_healthy,
        });
      };

      return sightingObj;
    }

    let reducedMore = new Set();

    reduced = reduced.forEach((sightings) => {
      let initialObject = {
        date_time: sightings[0].date_time,
        location: sightings[0].location,
        sighter_email: sightings[0].sighter_email,
      };

      reducedMore.add(sightings.reduce(reduceFurther, initialObject));
    });

    console.log(`POST REDUCED "reducedMore": `, [...reducedMore]); //TEST
    return [...reducedMore];
  };

  useEffect(() => {
    fetchData();
    updateSwitch(false);
  }, [tableData]);

  return (
    <div className="SightingsBoard">
      
        {reducedTableData ? (
          reducedTableData.map((item, index) => {
            return <Sighting 
                    key={index} 
                    date={item.date_time} 
                    individuals={item.individuals}
                    location={item.location} 
                    sighter_email={item.sighter_email} 
                    
                    />;
          })
        ) : (
          <p>Something went wrong... :c</p>
          )}
      
    </div>
  );
}

export default SightingsBoard;
