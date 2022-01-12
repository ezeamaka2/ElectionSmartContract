//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Election {
    enum Status {
        notVoted,
        hasVoted
    }

    struct Candidate {
        string name;
        string party;
        uint256 age;
        uint256 voteCounts;
    }

    struct Voter {
        bool authorised;
        bool voted;
        Status voterStatus;
        string votedFor;
    }

    address payable public owner;
    string public electionName;

    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    uint256 public totalVotes;

    modifier onlyOwner() {
        require(owner == msg.sender, "You can not add a candidate");
        _;
    }

    modifier OnlyAuthorise() {
        require(
            !voters[msg.sender].voted,
            "You are not allowed to voted twice"
        );
        assert(voters[msg.sender].voterStatus != Status.hasVoted);
        require(voters[msg.sender].authorised, "You are autorised to vote");
        _;
    }

    constructor(string memory _name) {
        owner = payable(msg.sender);
        electionName = _name;
    }

    function addCandidate(
        string memory _name,
        string memory _party,
        uint256 _age
    ) public onlyOwner {
        candidates.push(Candidate(_name, _party, _age, 0));
    }

    function getNumberOfCandidate() public view returns (uint256) {
        return candidates.length;
    }

    function registerVoter(address _person) public onlyOwner {
        voters[_person].authorised = true;
        voters[_person].voterStatus = Status.notVoted;
        voters[_person].votedFor = "none";
    }

    function vote(uint256 _candidateIndex) public OnlyAuthorise {
        voters[msg.sender].voted = true;
        voters[msg.sender].votedFor = candidates[_candidateIndex].name;
        voters[msg.sender].voterStatus = Status.hasVoted;

        candidates[_candidateIndex].voteCounts++;

        totalVotes++;
    }

    function CountTotalVotes() internal view returns (uint256 _totalVotes) {
        uint256 winningVoteCount = 0;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCounts > winningVoteCount) {
                winningVoteCount = candidates[i].voteCounts;
                _totalVotes = i;
            }
        }
    }

    function SeeWinner() public view returns (string memory, uint256) {
        return (
            candidates[CountTotalVotes()].name,
            candidates[CountTotalVotes()].voteCounts
        );
    }

    function endVoting() public payable onlyOwner {
        selfdestruct(owner);
    }
}
