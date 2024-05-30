// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Ownable.sol";

contract Collectible is Ownable {
	uint public price;

	function markPrice(uint _price) external onlyOwner {
		price = _price;
	}
}