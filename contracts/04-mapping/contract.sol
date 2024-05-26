// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Contract {
    mapping (address => bool) public members; // hash table of addresses

    function addMember(address addr) external {
        members[addr] = true;  // set this address to true
    }

    function removeMember(address addr) external {
        members[addr] = false;
    }

    function isMember(address addr) external view returns(bool) {
        return members[addr];
    }
}