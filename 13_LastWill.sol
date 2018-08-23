pragma solidity ^0.4.0;

contract LastWill{
    address owner;
    
    uint256 public lastTouch;
    
    address[] public childs;
    
    event Status(string msg, address user, uint256 time);
    
    function LastWill() payable{
        owner = msg.sender;
        lastTouch = block.timestamp;
        Status('Last Will Contract Created', msg.sender, block.timestamp);
    }
    
    function depositFunds() payable{
        Status('Funds deposited', msg.sender, block.timestamp);
    }
    
    function stillAlive(){
        lastTouch = block.timestamp;
        Status('stillAlive', msg.sender, block.timestamp);
    }
    
    function isDead(){
        Status('someone is checking if is dead or not', msg.sender, block.timestamp);
        if(block.timestamp > (lastTouch +120)){
            giveMoneyToChilds();
        }else{
            Status('I am still alive', msg.sender, block.timestamp);
        }
    }
    
    function giveMoneyToChilds(){
        Status('i am dead, take my money', msg.sender, block.timestamp);
        uint amountPerChild = this.balance/childs.length;
        for(uint i = 0; i < childs.length; i++){
            childs[i].transfer(amountPerChild);
        }
    }
    
    
    
    function addChilds(address childAddress) onlyOwner{
        Status('Child Added', childAddress, block.timestamp);
        childs.push(childAddress);
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
}