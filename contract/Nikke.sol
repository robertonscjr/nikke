pragma solidity ^0.5.0;                                                         
                                                                                
contract Nikke {
    address owner;
    uint amount = 0;
    uint private ownerBalance = 0;
    mapping(address => uint) public balance;
    
    function buy() public payable {
        require(msg.value != 0);
        
        balance[msg.sender] = msg.value;
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
        
        if (prize > 0) withdraw(prize);
        
        return prize;
    }
    
    function withdraw(uint8 percentage) private {
        uint amount_to_transfer = (amount * percentage) / 100;
        msg.sender.transfer(amount_to_transfer);
        amount -= amount_to_transfer;
    }
    
    function random() public view returns (uint8) {
        bytes32 seed = keccak256(abi.encodePacked(msg.sender, block.coinbase, block.difficulty, block.gaslimit, block.number, msg.sig, msg.data, block.timestamp, block.difficulty, tx.gasprice, tx.origin));
        
        return uint8(uint256(seed) % 100); //uint8(uint256(keccak256(block.timestamp, block.difficulty)) % 100);
    }
    
}
