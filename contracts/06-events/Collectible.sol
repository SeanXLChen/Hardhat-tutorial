// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public holder;
    event Deployed(address owner);  // declare an event

    event Transfer(address oldOwner, address newOwner);

    constructor() {
        emit Deployed(msg.sender); // emit the event when the contract is deployed
        holder = msg.sender;
    }

    function transfer(address recipient) external {
        require(holder == msg.sender, "Caller has to be the owner");
        holder = recipient;
        emit Transfer(msg.sender, recipient);
    }
}