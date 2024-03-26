// SPDX-License-Identifier: MIT
// intuition
// 1. start a contract that is pausable and alows transfer
// 2. declare address owner, bool paused and mapping balance ok  
// 3. declare constructor ok
// 4. create a onlyOwner and notpaused modifier ok
// 5. create functions pause and unpause denpending on onlyOwner ok 
// 6. create a transfer function that depends on notpaused modifier ok

pragma solidity ^0.8.24;

contract pausableToken {

        address public owner;
        bool paused;
        mapping(address => uint) public balance;  

        constructor() {
            owner = msg.sender;
            paused = false;
            balance[owner] = 1000;
        }

        modifier onlyOwner {
            require(msg.sender == owner, "only the owner can do this");
        _;}

        modifier notPaused {
            require(paused == false, "contract must be running");
        _;}

        function pause() public onlyOwner {
            paused = true;
        }

        function unpause() public onlyOwner {
            paused = false;
        }

        function transfer(address to, uint256 amount) public notPaused {

            require(amount <= balance[msg.sender], "insufficient balance");
                
                balance[msg.sender] -= amount;
                balance[to] += amount;
            
        }




}