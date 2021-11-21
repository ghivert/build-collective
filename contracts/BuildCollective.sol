pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "./Ownable.sol";

contract BuildCollective is Ownable {
  // ===========
  // || UTILS ||
  // ===========

  function compareString(string memory a, string memory b) public returns (bool) {
    return keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b)));
  }

  // ==========
  // || USER ||
  // ==========

  struct User {
    string username;
    uint256 balance;
    bool registered;
  }

  function compareUsers(User memory a, User memory b) public returns (bool) {
    return compareString(a.username, b.username)
    && a.balance == b.balance
    && a.registered == b.registered
    ;
  }

  mapping(address => User) private users;

  event UserSignedUp(address indexed userAddress, User indexed user);

  function user(address userAddress) public view returns (User memory) {
    return users[userAddress];
  }

  // TEST ONLY
  function createUser(address userAddress, User memory u) public returns (User memory){
    users[userAddress] = u;
  }

  function signUp(string memory username) public returns (User memory) {
    require(bytes(username).length > 0);
    if(users[msg.sender].registered == false){
      users[msg.sender] = User(username, 0, true);
    }
    emit UserSignedUp(msg.sender, users[msg.sender]);
  }

  function addBalance(uint256 amount) public returns (bool) {
    require(users[msg.sender].registered);
    users[msg.sender].balance += amount;
    return true;
  }

  // =============
  // || COMPANY ||
  // =============

  struct Company {
    string name;
    User owner;
    // User[] members;
    uint256 balance;
    bool registered;
  }

  function compareCompanies(Company memory a, Company memory b) public returns (bool) {
    return compareString(a.name, b.name)
    && compareUsers(a.owner, b.owner)
    && a.balance == b.balance
    && a.registered == b.registered;
  }

  mapping(string => Company) private companies;
  mapping(address => Company) private members;

  event CompanyCreated(string indexed companyName, User indexed owner, Company indexed comp);

  function company(string memory companyName) public view returns (Company memory) {
    return companies[companyName];
  }

  function memberOf(address userAddress) public view returns (Company memory) {
    return members[userAddress];
  }

  function createCompany(string memory companyName) public returns (Company memory) {
    require(bytes(companyName).length > 0);
    require(users[msg.sender].registered); // If user aldready registred

    if(companies[companyName].registered == false){
      companies[companyName].name = companyName;
      companies[companyName].owner = users[msg.sender];
      companies[companyName].balance = 0;
      companies[companyName].registered = true;
    }
    emit CompanyCreated(companyName, users[msg.sender], companies[companyName]);

    return companies[companyName];
  }

  function addCompanyMember(string memory companyName, address newMember) public returns (Company memory){
    require(users[msg.sender].registered); // If user aldready registred
    require(users[newMember].registered); // If user aldready registred
    require(companies[companyName].registered); // If company aldready registred
    require(compareString(companies[companyName].owner.username, users[msg.sender].username)); // If user is company's owner

    members[newMember] = companies[companyName];
  }



}
