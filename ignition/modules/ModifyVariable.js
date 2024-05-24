const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("ModifyVariableModule", (m) => {
    const deployer = m.getAccount(0);
    const contract = m.contract("ModifyVariable", [10, 'Sean'], { from: deployer });
    return { contract };  // Returns the contract for potential use in other modules
});