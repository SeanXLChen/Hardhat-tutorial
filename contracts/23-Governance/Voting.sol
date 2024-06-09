// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    address[] public members;
    uint public executeThreshold = 10;

    constructor(address[] memory _initialMembers) {
        // constructor can stay empty
        members = _initialMembers;
        members.push(msg.sender);
    }

    modifier onlyMembers {
        bool allowed = false;
        for(uint i = 0; i < members.length; i++) {
            if(members[i] == msg.sender) {
                allowed = true;
                break;
            }
        }
        require(allowed, "You are not a member");
        _;
    }

    enum VoteStates {Absent, Yes, No}

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping (address => VoteStates) voteStates;
        bool executed;
    }
    
    Proposal[] public proposals;

    event ProposalCreated(uint);
    event VoteCast(uint, address indexed);
    
    function newProposal(address _target, bytes calldata _data) external onlyMembers {
        emit ProposalCreated(proposals.length);
        Proposal storage proposal = proposals.push();
        proposal.target = _target;
        proposal.data = _data;
    }

    function castVote(uint _proposalId, bool _supports) external onlyMembers {
        Proposal storage proposal = proposals[_proposalId];

        // clear out previous vote 
        if(proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if(proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        // add new vote 
        if(_supports) {
            proposal.yesCount++;
        }
        else {
            proposal.noCount++;
        }

        // if the proposal has enough votes, execute it
        if(proposal.yesCount >= executeThreshold) {
            require(!proposal.executed, "Proposal has already been executed");
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
            proposal.executed = true;
        }

        // we're tracking whether or not someone has already voted 
        // and we're keeping track as well of what they voted
        proposal.voteStates[msg.sender] = _supports ? VoteStates.Yes : VoteStates.No;

        emit VoteCast(_proposalId, msg.sender);
    }
}