const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("FaucetModule", (m) => {
  const deployer = m.getAccount(0); // Get the deployer account

  // Deploy the Faucet contract
  const faucet = m.contract("Faucet", [], {
    from: deployer,
  });

  // Return the contract instance for use in other modules or scripts
  return { faucet };
});