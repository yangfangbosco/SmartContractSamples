pragma solidity ^0.4.0;

contract PayableContract {
    
    function PayableContract() payable{
        
    }
    function recieveFunds() payable{
        
    }
    
    function getBalence() constant returns(uint){
        return this.balance;
    }
}