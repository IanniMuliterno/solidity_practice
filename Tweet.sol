// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Twitter {

    uint16 constant max_length = 280;


    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
     }

           constructor() {
        owner = msg.sender;
     };   

     modifier onlyOwner {
        require(msg.sender == owner, "you are not the owner");
        _;
     }

     function changeName(string newOwner) public onlyOwner {
        owner = newOwner;
     }

    mapping (address => Tweet[]) public tweets;

    function creatTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= max_length,"twitter is too long");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    
    function getTweet (uint _i) public view returns (Tweet memory) {
    return tweets[msg.sender][_i];
    }

    function getalltweets() public view returns (Tweet[] memory) {
        return tweets[msg.sender];
    }

}
