// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SuiTipJar {
    address public owner;
    string public constant MISSION = "Build on Sui";
    
    event Tipped(address indexed from, uint256 amount);
    
    constructor() {
        owner = msg.sender;
    }
    
    function tip() external payable {
        require(msg.value > 0, "Tip something");
        emit Tipped(msg.sender, msg.value);
    }
    
    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}

