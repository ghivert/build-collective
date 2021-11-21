pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "truffle/DeployedAddresses.sol";
import "../contracts/BuildCollective.sol";

contract TestBuildCollective is BuildCollective {
  BuildCollective bc = BuildCollective(DeployedAddresses.BuildCollective());

  event LogUser(User indexed usr);
  event LogCompany(Company indexed comp);

  // This user address
  address localUserAdress = address(this);

  // The user we want here
  User public uwwh = User("user0", 0, true);

  function testUser() public {
    bc.signUp("user0");
    User memory u = bc.user(localUserAdress);

    assert(keccak256(abi.encodePacked(uwwh.username)) == keccak256(abi.encodePacked(u.username)));
    assert(keccak256(abi.encodePacked(uwwh.balance)) == keccak256(abi.encodePacked(u.balance)));
    assert(keccak256(abi.encodePacked(uwwh.registered)) == keccak256(abi.encodePacked(u.registered)));
  }

  function testAddBalance() public{
    User memory u = bc.user(localUserAdress);
    bc.addBalance(200);
    User memory v = bc.user(localUserAdress);

    assert( u.balance + 200 ==  v.balance);
  }

  // Company

  function testCompanyCreation() public{
    Company memory expectedComp = Company("comp0", bc.user(localUserAdress), 0, true);
    bc.createCompany("comp0");
    Company memory c = bc.company("comp0");

    assert(
      bc.compareCompanies(expectedComp, c)
    );
  }

  function testAddCompanyMember() public{
    address addr = address(uint160(uint(keccak256(abi.encodePacked(blockhash(block.number))))));
    bc.createUser(addr, User("user1", 0, true));
    bc.addCompanyMember("comp0", addr);
    assert(compareCompanies(bc.company("comp0"), bc.memberOf(addr)));
  }
}
