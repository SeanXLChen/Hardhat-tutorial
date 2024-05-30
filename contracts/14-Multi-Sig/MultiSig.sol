// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    // The addresses of the owners of the wallet
    address[] public owners;

    // The number of approvals required for a transfer
    uint public required;

    // The number of transactions
    uint public transactionCount;

    // transaction structure to hold the transaction details
    struct Transaction {
        address to;
        uint value;
        bool executed;
        uint approvals;
        bytes data;
    }

    // mapping to hold the transactions
    mapping(uint => Transaction) public transactions;

    // mapping to hold the confirmations for a transaction
    mapping(uint => mapping(address => bool)) public confirmations;

    // modifier to check if the sender is an owner
    modifier onlyOwner() {
        bool isOwner = false;
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                isOwner = true;
            }
        }
        require(isOwner == true, "Only owner can call this function");
        _;
    }

    // constructor to set the owners and required approvals
    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Owners required");
        require(_required > 0 && _required <= _owners.length, "Required should be between 1 and the number of owners");
        owners = _owners;
        required = _required;
    }

    // function to add a transaction 
    function addTransaction(address _to, uint _value, bytes calldata _data) internal returns (uint) {
        transactions[transactionCount] = Transaction(_to, _value, false, 0, _data);
        transactionCount++;
        return transactionCount - 1;
    }

    // function to approve a transaction
    function confirmTransaction(uint _txIndex) public onlyOwner {
        require(confirmations[_txIndex][msg.sender] == false, "Transaction already confirmed");
        confirmations[_txIndex][msg.sender] = true;
        transactions[_txIndex].approvals++;
        if (isConfirmed(_txIndex) == true) {
            executeTransaction(_txIndex);
        }
    }

    // function to submit a transaction (only owner)
    function submitTransaction(address _to, uint _value, bytes calldata _data) public onlyOwner {
        uint txIndex = addTransaction(_to, _value, _data);
        confirmTransaction(txIndex);
    }
    
    // get confirmation count for a transaction
    function getConfirmationsCount(uint _txIndex) public view returns (uint) {
        return transactions[_txIndex].approvals;
    }

    // function to receive the funds
    receive() external payable {
    }

    function isConfirmed(uint _txIndex) public view returns (bool) {
        return transactions[_txIndex].approvals >= required;
    }

    function executeTransaction(uint _txIndex) public onlyOwner {
        require(transactions[_txIndex].executed == false, "Transaction already executed");
        require(isConfirmed(_txIndex) == true, "Transaction not confirmed");
        (bool sent, ) = transactions[_txIndex].to.call{value: transactions[_txIndex].value}(transactions[_txIndex].data);
        require(sent, "Failed to send Ether");
        transactions[_txIndex].executed = true;
    }
}