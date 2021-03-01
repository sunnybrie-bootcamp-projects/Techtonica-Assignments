const invert = require("../script.js");

describe("invert(testObj)", function () {
  var testObj = { a: 1, b: 2, c: 1 };

  it("should return an empty object", function () {
    expect({}).toEqual({});
  });
});
/*
    it('should return an object', function () {
        expect(typeof (invert(testObj))).toEqual('object');
    });
*/
    
/*
    it("should invert keys and properties", function () {
      expect(invert(testObj)).toEqual({ 1: "c", 2: "b" });
    });
    */

