// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Interface for the Hero contract
interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address heroAddress) external {  // hero is the address of the Hero contract
        IHero(heroAddress).alert(); // Call the alert function of the Hero contract
    }
}
