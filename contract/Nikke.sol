pragma solidity ^0.4.0;                                                         
                                                                                
contract Nikke {
    address owner;
    mapping(address => uint) public balance;
    uint amount = 0;
    
    function buy() public payable {
        balance[msg.sender] = msg.value / 10;
        amount += msg.value;
    }
    
    function play() public returns (uint8) {
        require(balance[msg.sender] > 0);
        
        uint8 probability = random();
        uint8 prize = 0;
        
        balance[msg.sender]--;
        
        if(0 <= probability && probability <= 1) prize = 21;
        if(1 < probability && probability <= 2) prize = 8;
        if(2 < probability && probability <= 5) prize = 3;
        if(5 < probability && probability <= 13) prize = 1;
        if(13 < probability && probability <= 50) balance[msg.sender]++;
        
        if (prize > 0) withdraw(prize);
        
        return prize;
    }
    
    function withdraw(uint8 percentage) private {
        uint amount_to_transfer = amount * (percentage / 100);
        msg.sender.transfer(amount_to_transfer);
        amount -= amount_to_transfer;
    }

    function random() private view returns (uint8) {
        return uint8(uint256(keccak256(block.timestamp, block.difficulty)) % 100);
    }
}                                                                               
