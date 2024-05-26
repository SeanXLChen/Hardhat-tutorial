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
        users[msg.sender] = User({balance: 100, isActive: true});
    }

    function transfer(address receiveAddr, uint amount) public {
        // Ensure that both the sender and receiver are active users
        require(users[msg.sender].isActive, "Sender not an active account");
        require(users[receiveAddr].isActive, "Recipient not an active account");
        // Ensure that the sender has enough balance to transfer
        require(users[msg.sender].balance >= amount, "Not enough tokens");

        // Correctly updating balances within the mapping
        users[msg.sender].balance -= amount;
        users[receiveAddr].balance += amount;
    }
}
