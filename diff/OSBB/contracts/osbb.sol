pragma solidity >=0.4.21 <0.6.0;
import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";

contract OSBB is Ownable {
    
    // Resident of OSBB
    struct User {
        bytes32 Name;
        uint8 Flat;
        uint8 Floor;
        address addr;
    }
    
    User[] usersArray;
    
    Issue[] issues;
    
    enum StatusOfIssue {
        newIssue,
        inProgress,
        done
    }
    
    // TODO
    function isUserResident (address userAddress) public view returns (bool) {
        return true;
    }
    
    function addUser (bytes32 name,
        uint8 flat,
        uint8 floor,
        address addr) public onlyOwner  {
            require(name.length > 0, "Incorrect Name");
            require(addr != address(0), "Wrong Address");
            
            usersArray.push(User({Name : name, Flat : flat, Floor : floor, addr : addr}));
    }

    
    struct Issue {
        string Description; // Description Of Issue
        StatusOfIssue Status; // Initial is "newIssue". OSBB admin updates it to inProgress and done. 
        // After done the user sould verify it
        bool DoneApprovedByUser; // User approves Issue after done
        uint CreationDate; // Creation date of issue
        uint DueDate; // Date when the issue supposed to be done(User updates it)
        uint CriticalLevel; // How critical is the issue(user updates it on creation)
    }


    constructor() public {
        // TODO: add resident Limit
    }
}
