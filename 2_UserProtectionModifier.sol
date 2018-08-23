pragma solidity ^0.4.0;

contract UserProtectionContract{
    string word = 'Hello World';
    address owner;
    
    function HelloWorldContract(){
        //set the owner
        owner = msg.sender;
    }

    function getWord() constant returns(string){
        return word;
    }

    function setWord(string newWord) returns(string){
        if(owner != msg.sender){
            return "you dont have the ownership";
        }
        word = newWord;
        return "updated succedd";
    } 
 }