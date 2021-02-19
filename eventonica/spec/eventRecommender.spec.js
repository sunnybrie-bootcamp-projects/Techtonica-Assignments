const ER_Classes = require("../node_modules/classes");

var testTonica = new ER_Classes.Eventonica();

describe("addEvent", function() {
  eventA = testTonica.addEvent("NAME", "DESCRIPTION", "CATEGORY", "1-1-2021");

  it("Getting new event's name...", function() {
    

    expect(eventA.eventName).toBe("NAME");
  });
});