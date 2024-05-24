// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// this contract will set the owner to the address that deploys it
contract SampleContract {
    address public owner;
    address payable public charityAddress;  // need to use payable keyword to send ether to this address

    constructor(address payable _charityAddress) {
        owner = msg.sender; // msg.sender is the address that deploys the contract
        charityAddress = _charityAddress;
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

    // no need to use the payable keyword here, since we are not sending any ether
    function donate() external {
        // Ensure only the owner can call this function
        require(msg.sender == owner, "Only the owner can initiate the donation.");

        // Send all the contract's balance to the charity address
        (bool success, ) = charityAddress.call{ value: address(this).balance }("");
        require(success, "Failed to send Ether");
    }
}