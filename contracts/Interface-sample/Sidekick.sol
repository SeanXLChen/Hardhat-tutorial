// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Interface for the Hero contract
interface IHero {
    function alert() external;
    function setAlerted(bool _alerted) external;
}

contract Sidekick {
    function sendAlert(address heroAddress) external {  // hero is the address of the Hero contract
        IHero(heroAddress).alert(); // Call the alert function of the Hero contract
    }

    function setHeroAlerted(address heroAddress, bool _alerted) external {
        bytes4 signature = bytes4(keccak256("setAlerted(bool)"));  // first 4 bytes of keccak256 hash is the function signature
        (bool success, ) = heroAddress.call(abi.encodeWithSelector(signature, _alerted));  // Call the setAlerted function of the Hero contract
        require(success, "Failed to call setAlerted");
    }
}
