// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract2 {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		        // Ensure that a user can only be created once per address
        require(!users[msg.sender].isActive, "User already exists.");
		
		// Initialize the user directly within the mapping for msg.sender
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
	}

}