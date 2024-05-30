// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Hero.sol";

contract Mage is Hero(50) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Spell);
        super.attack(enemy);  // calls the parent contract's attack function
    }
}

contract Warrior is Hero(200) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Brawl);
        super.attack(enemy);  // calls the parent contract's attack function
    }
}