import React from "react";
//import reactDom from "react-dom";
import ReactDOM from "react-dom";

/*<outerBox>
	<innerBox prop=x callbackFunction(()=>return ifSelected/>


	<innerBox prop=o, callbackFunction(()=>return ifSelected/>
</outerBox>
*/

class InnerBox extends React.Component {
  render() {
    return (
      <button onClick={this.props.onClick}>Button{this.props.name} </button>
    );
  }
}

class OuterBox extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: null,
    };
  }

  changeValue(XO) {
    this.setState({
      value: XO,
    });
  }

  render() {
    const X = "X";
    const O = "O";
    return (
      <div className="App">
        <h1>Parent Component </h1>
        <p>
          The current value of this square is <b>: {this.state.value} </b>
        </p>

        <InnerBox onClick={() => this.changeValue("X")} name="X" />
        <InnerBox onClick={() => this.changeValue("O")} name="O" />
      </div>
    );
  }
}

ReactDOM.render(<OuterBox />, document.getElementById("root"));
