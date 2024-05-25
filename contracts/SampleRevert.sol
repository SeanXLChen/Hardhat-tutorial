// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SampleRevert {
    constructor() payable {  // payable constructor
        require(msg.value >= 1e18, "Contract requires at least 1 ether to be deployed"); 
    } 
}