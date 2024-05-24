// import testing libraries: https://www.chaijs.com/guide/styles/ 
const { expect } = require("chai");

// the `describe` scope encapsulates an entire test called `TestModifyVariable`
// the `it` says the behavior that should be expected from the test
describe("TestModifyVariable", function () {
    it("should change x to 1337", async function () {
      // this line creates an ethers ContractFactory abstraction: https://docs.ethers.org/v5/api/contract/contract-factory/
      const ModifyVariable = await ethers.getContractFactory("ModifyVariable");
  
      const contract = await ModifyVariable.deploy(10);  // deploy the contract with an initial value of 10 for x
  
      await contract.modifyToLeet(); // modify x from 10 to 1337 via this function!

      const newX = await contract.x(); // getter for state variable x

      expect(newX).to.equal(1337); // we expect the value of x to be 1337
    });
  });