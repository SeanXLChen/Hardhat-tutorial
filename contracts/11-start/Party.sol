// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Party {
    struct Attendee {
        address addr;
        bool hasRSVPed;
    }

    uint256 public fee;
    address public owner;
    Attendee[] public attendees;
    mapping(address => bool) public attendeeLookup;

    constructor(uint256 _fee) {
        fee = _fee;
        owner = msg.sender;
    }

    function rsvp() external payable {
        require(!attendeeLookup[msg.sender], "Party: already RSVP'd");
        require(msg.value == fee, "Party: fee not met");

        attendees.push(Attendee(msg.sender, true));
        attendeeLookup[msg.sender] = true;
    }

    function payBill(address payable venue, uint256 billAmount) external {
        require(msg.sender == owner, "Party: only owner can pay the bill");
        require(address(this).balance >= billAmount, "Party: insufficient funds to pay the bill");

        // Paying the bill to the venue
        (bool sent, ) = venue.call{value: billAmount}("");
        require(sent, "Party: failed to pay the bill");

        // Calculating the remaining balance
        uint256 remainingBalance = address(this).balance;
        uint256 refundAmount = remainingBalance / attendees.length;

        // Distributing the remaining balance among attendees
        for (uint i = 0; i < attendees.length; i++) {
            address payable attendeeAddress = payable(attendees[i].addr);
            (sent, ) = attendeeAddress.call{value: refundAmount}("");
            require(sent, "Party: failed to distribute funds");
        }
    }
}