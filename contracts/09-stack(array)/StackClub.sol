// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    // dynamic array of addresses
    address[] public members;

    // constructor, add deployer as the first member
    constructor() {
        members.push(msg.sender);
    }

    // external function to add a member
    function addMember(address addr) external {
        require(isMember(msg.sender), "Caller is not a member");
        members.push(addr);
    }

    // public view function to verify if an address is a member
    function isMember(address addr) public view returns(bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == addr) {
                return true;
            }
        }
        return false;
    }

    // external function to remove a member
    function removeLastMember() external {
        require(isMember(msg.sender), "Caller is not a member");
        members.pop();
    }
}