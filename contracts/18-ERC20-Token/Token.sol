// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint public totalSupply = 1000 * 10 ** 18;
    string public name = "Xiaolai Coin";
    string public symbol = "XLC";
    uint8 public decimals = 18;

    mapping(address => uint) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address account) external view returns (uint) {
        return balances[account];
    }

    event Transfer(address indexed from, address indexed to, uint value);

    function transfer(address to, uint amount) external {
        require(to != msg.sender, "You can't transfer to yourself");
        require(balances[msg.sender] >= amount, "Not enough tokens");
        // transfer
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }
}