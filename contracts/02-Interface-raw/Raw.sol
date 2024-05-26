// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// this way we don't need to define interface
contract Raw {
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success);
    }
}