const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("CounterModule", (m) => {
    const deployer = m.getAccount(0);
    const counter = m.contract("Counter", [], { from: deployer });
    return { counter };
});