// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sumFixedArray(uint[5] memory arr) external pure returns(uint) {
        uint total;
        for(uint i = 0; i < arr.length; i++){
            total += arr[i];
        }
        return total;
    }

    function sumDynamicArray(uint[] memory arr) external pure returns(uint) {
        uint total;
        for(uint i = 0; i < arr.length; i++){
            total += arr[i];
        }
        return total;
    }
}