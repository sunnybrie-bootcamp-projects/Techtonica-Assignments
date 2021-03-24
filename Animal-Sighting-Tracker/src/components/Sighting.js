import React from 'react';

function Sighting(props){
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
    
    return (
      <div className="sighting">
        <div className="sightingdate">
          <p>
            {dateString} {time}
          </p>
        </div>
        <div className="individuals">
          <h3>Who:</h3>
          {props.individuals.map((ind) => {
            return (
              <p>
                <div className="nickname">
                  {ind.nickname}
                </div>
                <div className="speciesCommonName">
                  {ind.common_name}
                </div>
                <div className="healthstatus">
                  {ind.appeared_healthy ? `healthy` : `unhealthy`}
                </div>
              </p>
            );
          })}
        </div>
        <div className="location">
          <h3>At:</h3>
          <p>{props.location}</p>
        </div>
        <div className="sighter">
          <h3>By:</h3>
          <p>{props.sighter_email}</p>
        </div>
      </div>
    );
}

export default Sighting;