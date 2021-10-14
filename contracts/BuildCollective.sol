pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract BuildCollective is Ownable {
  struct Company {
    string name;
    address owner;
    mapping(address => bool) members;
  }

  mapping(address => Company) public companies;

  function recordCompany(string memory name) public {
    companies[msg.sender] = Company(name, msg.sender);
    companies[msg.sender].members[msg.sender] = true;
  }

  function addUser(address member) public {
    Company storage company = companies[msg.sender];
    require(member != address(0));
    require(company.owner == msg.sender);
    company.members[member] = true;
  }
}
