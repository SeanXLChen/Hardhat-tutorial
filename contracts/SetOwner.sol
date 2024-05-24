// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// this contract will set the owner to the address that deploys it
contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender; // msg.sender is the address that deploys the contract
    }
}