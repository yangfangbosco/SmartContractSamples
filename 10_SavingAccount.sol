pragma solidity ^0.4.0;
contract Savings{
    address owner;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint amount);
    
    function Savings(){
        owner = msg.sender;
    }
    
    function depositFunds() payable{
        UserStatus('user has deposied some money', msg.sender, msg.value);
        
    
    }
    
    function kill() onlyOwner{
        suicide(owner);
    }
     
    function withdrawFunds(uint amount) onlyOwner{
        if(owner.send(amount)){
            UpdateStatus('User Withdraw some money');
        }
    }
    
    function getFunds() onlyOwner constant returns(uint){
        return this.balance;
    }
    
    modifier onlyOwner(){
        if(owner!=msg.sender){
            throw;
        }else{
            _;
        }
    }
}