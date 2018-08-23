pragma solidity ^0.4.0;

contract CoinFlip{
    address owner;
    uint payPercentage = 90;
    
    event Status(string msg, address user, uint amount);
    
    function CoinFlip() payable{
        owner = msg.sender;
    }
    
    function FilpCoin() payable{
        if((block.timestamp % 2) == 1){
            if(this.balance < (msg.value *payPercentage/100)){
                Status('Congratulations, you won, sorry we didn;t have enough money', msg.sender, this.balance);
                msg.sender.transfer(this.balance);
            }else{
                Status('Congratulations, you won', msg.sender, msg.value *payPercentage/100);
                msg.sender.transfer(msg.value *payPercentage/100);
            }
        }else{
            Status('we are sorry, you lose', msg.sender, msg.value);
        }
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
    
    function kill() onlyOwner{
        suicide(owner);
    }
}