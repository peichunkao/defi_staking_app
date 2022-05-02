pragma solidity >= 0.5.0;

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricated() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint completed) public restricated {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricated {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}