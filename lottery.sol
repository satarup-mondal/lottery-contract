// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7 <0.9.0; 

contract Lottery{
    address public manager; 
    address payable[] public players; 
    address payable public winner; 

    constructor(){
        manager=msg.sender; 
    }

    function participate() public payable{
        require(msg.value ==1 ether , "please pay 1 ehter only");
        players.push(payable(msg.sender));
    } 

    function getBalance() public view returns(uint){
        require(manager==msg.sender , "You are not the manager");
        return address(this).balance; 
    }

   function random() public view returns(uint256) {
    return uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players.length)));
    }

    function pickWinner() public{
        require(manager==msg.sender , "You are not the manager");
        require(players.length>=3 , "Players are less than 3") ; 


        uint r = random();
        uint index = r%players.length;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0); 
    }

}