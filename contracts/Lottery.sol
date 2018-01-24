pragma solidity ^0.4.17;

contract Lottery {
    
    address public manager;
    address[] public players;
    
    function Lottery() public {
        manager = msg.sender;
    }
    
    function enter() public payable {
        require(msg.value > 0.1 ether);
        
        players.push(msg.sender);
    }
    
    function random() private view returns(uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length; // Pick Winner
        players[index].transfer(this.balance); // Transfer contract balance to winner
        players = new address[](0); // Empty Players Array
    }
    
    modifier restricted() {
         require(msg.sender == manager); // Enfore Manager can only click the pickWinner function
        _; // Run the rest of the code inside the function
    }
    
    function getPlayers() public view returns (address[]) {
        return players;
    }
    
}