pragma solidity ^0.4.17;

contract Course {
string fname;
uint age;

event setInstructorEvent(uint _age);

function setInstructor (string _fname,uint _age) public {
    fname = _fname;
    age = _age;
     //trigger the event
    setInstructorEvent(age);
}

function getInstructor() public view returns(string,uint) {
    return (fname,age);
}

}