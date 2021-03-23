import React from "react";
import Todo from "./Todo";
import "./App.css";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      todos: [{ text: "Walk dog", isCompleted: false }, { text: "Feed cat", isCompleted: false }],
    };
  }

  updateTodo(todo, changes){
    this.setState({ 
      todos: this.state.todos.map((existing) => {
        if(todo === existing){
          return {...existing, ...changes};
        }
        return existing;
      }),

    });
  }

  render() {
    const { todos } = this.state;
    return (
      <div className="App">
        <h1>Todos</h1>
        <div>
          {todos.length &&
            todos.map((todo, idx) => <Todo key={idx} todo={todo} updateTodo={this.updateTodo.bind(this)} />)}
        </div>
      </div>
    );
  }
}

export default App;
