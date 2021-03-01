function getData() {
  console.log("Function getData is executed");
  fetch("https://jsonplaceholder.typicode.com/todos/1", {
    headers: { "Content-Type": "application/json" },
  })
    .then((res) => res.json())
    .then((data) => {
      console.log("data", data);
      let element = document.getElementById("data");
      element.textContent = data.title;
    });
}
