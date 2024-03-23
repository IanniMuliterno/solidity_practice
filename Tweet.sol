// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Twitter {

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
     }

    mapping (address => Tweet[]) public tweets;

    function creatTweet(string memory _tweet) public {

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    
    function getTweet (address _owner,uint _i) public view returns (Tweet memory) {
    return tweets[_owner][_i];
    }

    function getalltweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

}
