import React from 'react';

function Sighting(props){

    return (
      <div className="sighting">
        <div id="sightingdate">{props.date}</div>
        <div id="individuals">
          <div id="nickname">
            <p>{props.nickname}</p>
          </div>
          <div id="healthstatus">{props.appeared_health}</div>
        </div>
        <div id="location">{props.location}</div>
        <div id="sighter">{props.sighter_email}</div>
      </div>
    );
}

export default Sighting;