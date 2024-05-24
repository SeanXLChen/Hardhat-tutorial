// import testing libraries: https://www.chaijs.com/guide/styles/ 
const { expect } = require("chai");

// the `describe` scope encapsulates an entire test called `TestModifyVariable`
// the `it` says the behavior that should be expected from the test
describe("TestModifyVariable", function () {
    it("should change x to 1337", async function () {
      // this line creates an ethers ContractFactory abstraction: https://docs.ethers.org/v5/api/contract/contract-factory/
      const ModifyVariable = await ethers.getContractFactory("ModifyVariable");
  
      const contract = await ModifyVariable.deploy(10, 'Sean');  // deploy the contract with an initial value of 10 for x
  
      await contract.modifyToLeet(); // modify x from 10 to 1337 via this function!

      const newX = await contract.x(); // getter for state variable x

      expect(newX).to.equal(1337); // we expect the value of x to be 1337
    });

    // this test checks the state variable name is set to "Sean" 
    it("should check the name is set to 'Sean'", async function () {
      const ModifyVariable = await ethers.getContractFactory("ModifyVariable");
  
      const contract = await ModifyVariable.deploy(10, 'Sean');
  
      const storedName = await contract.name();
  
      expect(storedName).to.equal('Sean');
    });

    // this test checks name can be modify to "Sean's contract" when function modifyName is called
    it("should change name to 'Sean's contract'", async function () {
      const ModifyVariable = await ethers.getContractFactory("ModifyVariable");
  
      const contract = await ModifyVariable.deploy(10, 'Sean');
  
      await contract.modifyName("Sean's contract");
  
      const newName = await contract.name();
  
      expect(newName).to.equal("Sean's contract");
    });
  });