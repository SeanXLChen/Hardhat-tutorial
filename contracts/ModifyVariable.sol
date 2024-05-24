//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ModifyVariable {
  uint public x;

  constructor(uint _x) {
    x = _x;
  }

  function modifyToLeet() public {
    x = 1337;
  }

}