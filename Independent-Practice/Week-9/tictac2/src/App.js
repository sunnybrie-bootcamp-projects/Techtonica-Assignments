//ADILENE, MANDY, BRIE

import React from "react";
//import reactDom from "react-dom";
import ReactDOM from "react-dom";

function InnerBox(props) {
  return (
    <button onClick={props.onClick}> {props.name} </button>
  );
}


const OuterBox = () => {
  const [value, changeValue] = React.useState(null); 

    return (
      <div className="App">
        <h1>Parent Component </h1>
        <p>
          The current value of this square is <b>: {value} </b>
        </p>  
        <InnerBox onClick={() => changeValue("X")} name="X" />
        <InnerBox onClick={() => changeValue("O")} name="O" />
      </div>
    );
}



ReactDOM.render(<OuterBox />, document.getElementById("root"));

export default OuterBox;