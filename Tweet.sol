// SPDX-License-Identifier: MIT
// add id to tweet struct to make every tweet unique ( in the createtweet function) ok 
// add a function to like the tweet ( two parameters, id and author)
// add a function to unlike the tweet ( like must be greater than 0)
// mark both functions external

pragma solidity 0.8.24;

contract Twitter {

    uint16 public  max_length = 10;


    struct Tweet {
        uint256 id; 
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
     }

      mapping (address => Tweet[]) public tweets;
      address public owner;

    constructor() {
        owner = msg.sender;
     }

     modifier onlyOwner {
        require(msg.sender == owner, "you are not the owner");
        _;
     }

     function changetweetlength(uint16 newleng) public onlyOwner {
        max_length = newleng;
     }

   
    function creatTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= max_length,"twitter is too long");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
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

    function like_t(address t_author, uint256 id) external  {
    require(tweets[t_author][id].id == id, "this tweet does not exists");
    tweets[t_author][id].likes++;
    }

    function unlike_t(address t_author, uint256 id) external  {
    require(tweets[t_author][id].id == id, "this tweet does not exists");    
    require(tweets[t_author][id].likes > 0, "this tweet does not have likes");
    tweets[t_author][id].likes--;
    }

}
