pragma solidity ^0.4.0;

contract Math{
    function add(int a, int b) returns(int){
        return a+b;
    }
    function times(int a, int b) returns(int){
        return a*b;
    }
}

contract Calculator{
    Math math = Math(0x5faf852d0bae90ae3adb58f68deae7fcfc065a6d);
    
    function twoPlusFour() returns(int){
        return math.add(2,4);
    }
    function twoTimeFour() returns(int){
        return math.times(2,4);
    }
}