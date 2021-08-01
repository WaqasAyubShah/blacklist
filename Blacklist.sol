pragma solidity ^0.5.0;

contract Blacklistit is Ownership{
  mapping(address=> bool) isBlacklisted;

  //to add user to black_list by adding this to an array...
  function blackList(address _user) public onlyOwner
  {
      require(!isBlacklisted[_user],"user is already blacklisted");
      isBlacklisted[_user] = true;
      //emit events as well....
  }

  function removeFromBlacklist(address _user) public onlyOwner{
      require(isBlacklisted[_user],"use is already whitelisted");
      isBlacklisted[_user] = false;
      //emit events as well....
  }
  function transfer(address _to, uint256 _value) public {
      require(isBlacklisted[_to], "Recipiant is blacklisted");
      //remaining transfer logic ...
  }
}
