// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint num) public pure returns(bool){
        if ((num % 2) == 1) {
            return false;
        }
        else {
            return true;
        }
    } 
}