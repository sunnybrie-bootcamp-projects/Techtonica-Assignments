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
          {dateString} {time}
        </div>
        <div className="individuals">
          <h3>Animal(s) Seen</h3>
          <ul>
            {props.individuals.map((ind) => {
              return (
                <li
                  className="ind"
                  style={{ backgroundImage: `url(${ind.image_url})` }}
                >
                  {/*<img className="repPhoto" src={ind.image_url} /> */}
                  <div className="overlay">
                    <p className="info">
                      <span className="nickname">{ind.nickname}</span>
                      <br />
                      <span className="speciesCommonName">
                        {ind.common_name}
                      </span>{" "}
                      <br />
                      <span className="healthstatus">
                        {ind.appeared_healthy ? `healthy` : `unhealthy`}
                      </span>
                    </p>
                  </div>
                </li>
              );
            })}
          </ul>
        </div>
        <div className="location">
          <h3>Location of Sighting</h3>
          <p>{props.location}</p>
        </div>
        <div className="sighter">
          <h3>Sighted By</h3>
          <p>{props.sighter_email}</p>
        </div>
      </div>
    );
}

export default Sighting;