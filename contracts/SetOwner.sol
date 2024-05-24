// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// this contract will set the owner to the address that deploys it
contract SetOwner {
    address public owner;

    constructor() {
        owner = msg.sender; // msg.sender is the address that deploys the contract
    }

    // enable Function to receive any ether sent to this contract
    receive() external payable {
        // console.loa(msg.sender);
        // console.log(msg.value);
    }
}