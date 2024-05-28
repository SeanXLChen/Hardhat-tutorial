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

    // memory array size is fixed
    function filterEvenMemoryArry(uint[] memory arr) external pure returns (uint[] memory) {
        uint[] memory evenArr = new uint[](arr.length);
        uint count;
        for (uint i; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenArr[count] = arr[i];
                count++;
            }
        }
        uint[] memory evenArrTrimmed = new uint[](count);
        for (uint i; i < count; i++) {
            evenArrTrimmed[i] = evenArr[i];
        }
        return evenArrTrimmed;
    }
}