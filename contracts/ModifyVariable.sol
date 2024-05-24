//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ModifyVariable {
  uint public x;
  string public name;

  constructor(uint _x, string memory _name) {
    x = _x;
    name = _name;
  }

  function modifyToLeet() public {
    x = 1337;
  }

  function modifyName(string memory _name) public {
    name = _name;
  }

}