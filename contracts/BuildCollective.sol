pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "./Ownable.sol";

contract BuildCollective is Ownable {
  struct User {
    string username;
    uint256 balance;
    bool registered;
  }

  mapping(address => User) private users;

  event UserSignedUp(address indexed userAddress, User indexed user);

  function user(address userAddress) public view returns (User memory) {
    return users[userAddress];
  }

  function signUp(string memory username) public returns (User memory) {
    require(bytes(username).length > 0);
    users[msg.sender] = User(username, 0, true);
    emit UserSignedUp(msg.sender, users[msg.sender]);
  }

  function addBalance(uint256 amount) public returns (bool) {
    require(users[msg.sender].registered);
    users[msg.sender].balance += amount;
    return true;
  }
}
