// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SampleRevert {
    address payable public owner;

    constructor() payable {
        require(msg.value >= 1e18, "Please send at least 1 ETH!");
        owner = payable(msg.sender);
    } 

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw fund.");
        (bool s, ) = owner.call{value: address(this).balance}("");
        require(s, "Failed to send Ether");
    }
}