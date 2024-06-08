// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint num1, uint num2) public pure returns(bool) {
        if (num1 % num2 == 0) {
            return true;
        }
        else {
            return false;
        }
    }

    function isPrime(uint num) public pure returns(bool) {
        // prime number only divisible by itself or 1
        if (num <= 2) {
            return true;
        }
        for (uint i = 2; i < num; i++) {
            if (dividesEvenly(num, i)) {
                return false;
            }
        }
        return true;
    }
}