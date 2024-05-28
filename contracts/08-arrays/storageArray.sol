// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] memory arr) external {
        for (uint i; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenNumbers.push(arr[i]);
            }
        }
    }
}