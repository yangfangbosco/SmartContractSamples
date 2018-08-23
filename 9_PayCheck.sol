pragma solidity ^0.4.0;

contract PayCheck {
    address owner;
    address[] employees;
    uint totalReceived = 0;
    
     function PayCheck() payable{
        totalReceived += msg.value;
        owner = msg.sender;
    }
    
    function withdraw() {
        uint amountAllocated; 
        amountAllocated = totalReceived/employees.length;
        totalReceived -= amountAllocated;
        msg.sender.transfer(amountAllocated);
    }
       
    
    function addEmployees(address employeeAddress){
        if(owner!=msg.sender){
            throw;
        }else{
            employees.push(employeeAddress);
        }
    }
    
    function checkBalance() constant returns (uint){
        return this.balance;
    }
    
    function addBalance() payable{
        totalReceived += msg.value;
    }
    
    
}