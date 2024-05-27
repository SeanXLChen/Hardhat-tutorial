// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public holder;
    uint public salePrice;  // Price of the collectible; 0 means not for sale
    event Deployed(address indexed owner);  // Declare an event

    event Transfer(address indexed oldOwner, address indexed newOwner);

    event ForSale(uint price, uint timestamp);

    event Purchase(uint purchaseAmount, address indexed buyer);

    constructor() {
        holder = msg.sender; // the deployer of the contract is the owner
        emit Deployed(msg.sender); // emit the event when the contract is deployed
    }

    function transfer(address recipient) external {
        require(holder == msg.sender, "Caller has to be the owner");
        holder = recipient;
        emit Transfer(msg.sender, recipient);
    }

    function markPrice(uint askingPrice) external {
        require(holder == msg.sender, "Caller has to be the owner");
        salePrice = askingPrice;
        emit ForSale(askingPrice, block.timestamp); // block.timestamp is the current block timestamp
    }

    function purchase() external payable {
        require(salePrice > 0, "Collectible not for sale");
        require(msg.value >= salePrice, "Sent value must match the sale price");
        require(holder != msg.sender, "Owner cannot purchase their own collectible");

        // trnasfer msg.value to the holder
        (bool success, ) = payable(holder).call{value: msg.value}("");
        require(success, "Transfer failed.");

        // Transfer ownership
        address oldHolder = holder;
        holder = msg.sender;
        salePrice = 0;  // Mark the collectible as not for sale

        emit Transfer(oldHolder, msg.sender);
        emit Purchase(msg.value, msg.sender);
    }
}