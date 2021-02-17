const myER = require("../EventRecommender");

var testTonica = new myER.Eventonica();

describe("addEvent", function() {
  eventA = testTonica.addEvent("NAME", "DESCRIPTION", "CATEGORY", "1-1-2021");

  it("Getting new event's name...", function() {
    

    expect(eventA.eventName).toBe("NAME");
  });
});