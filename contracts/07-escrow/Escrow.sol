// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved;
    uint public balance;

    event Approved(uint amount);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        isApproved = false;
        balance = msg.value;
    }

    function approve() external {
        require(msg.sender == arbiter, "Caller has to be the arbiter");
        require(!isApproved, "Funds have already been approved");
        isApproved = true;
        (bool success, ) = payable(beneficiary).call{value: balance}("");
        require(success, "Transfer failed.");
        emit Approved(balance);
    }
}
