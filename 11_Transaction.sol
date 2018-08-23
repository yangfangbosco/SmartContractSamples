pragma solidity ^0.4.0;

contract Seminar{
    struct Person{
        string name;
        uint age;
        bool active;
    }
    uint256 fee;
    uint loss = 80;
    
    mapping(address=>Person) public attendants;
    
    function Registration(string _name, uint _age) payable{
        
            attendants[msg.sender] = Person({
                name: _name,
                age: _age,
                active:true
            });
        
    }
    function setRegistrationFee(uint256 _fee){
        fee = _fee;
    }
    
    function cancelRegistration(){
        attendants[msg.sender].active = false;
        msg.sender.transfer((fee*loss)/100);
    }
    
    function getFunds() constant returns(uint){
        return this.balance;
    }
    
}