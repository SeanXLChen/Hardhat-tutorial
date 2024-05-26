// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function relay(address hero, bytes memory data) external {
        // send all of the data as calldata to the hero
        (bool success, bytes memory returnData) = hero.call(data);
        require(success, "Call failed");

        // Optionally, you could return the data or emit it in an event
    }

    // wrong relay that will trigger hero's fallback function
    function wrongRelay(address hero) external {
        (bool success, ) = hero.call(abi.encodeWithSelector(bytes4(keccak256("fakeFunction()"))));
        require(success, "Failed to call fallback function");
    }
}
