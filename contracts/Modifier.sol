// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Modifier {
	address owner;
	uint configA;
	uint configB;
	uint configC;

	constructor() {
		owner = msg.sender;
	}

	function setA(uint _configA) public onlyOwner {
		configA = _configA;
	}

	function setB(uint _configB) public onlyOwner {
		configB = _configB;
	}

	function setC(uint _configC) public onlyOwner {
		configC = _configC;
	}

    // decorator function to check if the caller is the owner
	modifier onlyOwner {
		require(msg.sender == owner, "Only owner can call this function");
        _;  // this is where the function body is inserted
        console.log("Function executed successfully");
	}
}