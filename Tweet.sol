// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Tweet {

    mapping (address => string[]) public tweets;

    function creatTweet(string memory _tweet) public {

        tweets[msg.sender].push(_tweet);
    }

    
    function getTweet (address _owner,uint _i) public view returns (string memory) {
    return tweets[_owner][_i];
    }

    function getalltweets(address _owner) public view returns (string[] memory) {
        return tweets[_owner];
    }

}
