// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Hero {
    bool public alerted;

    function alert() external {
        alerted = true;
    }

    function setAlerted(bool _alerted) external {
        alerted = _alerted;
    }
}