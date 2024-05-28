// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
        address voter;
        Choices choice;
    }

    // Vote public vote;

    Vote[] public votes;

	// function createVote(Choices choice) external {
	// 	vote = Vote({voter: msg.sender, choice: choice});
	// }

    // function createVote2(Choices choice) external view returns (Vote memory){
    //     Vote memory newVote = Vote({voter: msg.sender, choice: choice});
    //     return newVote;
    // }

    // Helper function to find the index of a voter's vote
    function findVoteIndex(address addr) private view returns (uint) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return i;
            }
        }
        revert("Voter has not voted");
    }

    function createVote3(Choices choice) external {
        require(!hasVoted(msg.sender), "You have already voted");
        votes.push(Vote({voter: msg.sender, choice: choice}));
    }

    function hasVoted(address addr) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == addr) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address addr) external view returns (Choices) {
        uint index = findVoteIndex(addr);
        return votes[index].choice;
    }

    function changeVote(Choices newChoice) external {
        uint index = findVoteIndex(msg.sender);
        votes[index].choice = newChoice;
    }
}