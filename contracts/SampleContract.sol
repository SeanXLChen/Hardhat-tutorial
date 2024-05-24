// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// this contract will set the owner to the address that deploys it
contract SampleContract {
    address public owner;

    constructor() {
        owner = msg.sender; // msg.sender is the address that deploys the contract
    }

    // enable Function to receive any ether sent to this contract
    receive() external payable {
        // console.loa(msg.sender);
        // console.log(msg.value);
    }

    // fallback function (if no function is called, this function will be called)
    fallback() external {
        // do something
    }

    // function to send ether to the owner
    function tipOwner() external payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success);
    }
}