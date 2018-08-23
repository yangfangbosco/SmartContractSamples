pragma solidity ^0.4.0;

contract UserProtectionContract{
    string word = 'Hello World';
    address owner;
    
    function HelloWorldContract(){
        //set the owner
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(owner != msg.sender){
            throw;
        }else{
            _;
        }
        
    }

    function setWord(string newWord) onlyOwner returns(string){
        word = newWord;
        return "updated succedd";
    } 
    
     function getWord() constant returns(string){
        return word;
    }
 }