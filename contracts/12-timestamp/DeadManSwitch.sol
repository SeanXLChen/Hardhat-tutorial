// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//遗嘱执行合约
contract Switch {
    address public beneficiary;
    address public owner;
    uint public startTime;

    constructor(address _beneficiary) payable {
        beneficiary = _beneficiary;
        startTime = block.timestamp;
        owner = msg.sender;
    }

    function withdraw() external {
        require(msg.sender == beneficiary, "You are not the beneficiary");
        require(block.timestamp >= startTime + 52 weeks, "The time has not come");
        (bool sent, ) = payable(beneficiary).call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    function extend() external {
        require(msg.sender == owner, "You are not the owner");
        startTime = block.timestamp;
    }
}