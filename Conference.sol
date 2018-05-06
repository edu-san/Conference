pragma solidity ^0.4.17;

contract Conference {
    //state variables
    address owner;
    string title;
    string location;
    uint starttime;
    uint endtime;
    address speakeraddress;
    string speakername;

    address attendee;
    string attendeeName;

    uint256 constant REGISTRATION_PRICE = 500000000000000000;

    event AddTalkEvent(string _title,uint _starttime,uint _endtime);
    event RegisterEvent(address indexed attendeeaddress,string attendeName);
    
    function Conference() public {
        owner = msg.sender;
    }

    function addTalk(
        string _title,
        string _location,
        uint _starttime,
        uint _endtime,
        address _speakeraddress,
        string _speakername) public {
        
        if(msg.sender != owner){
            return;
        }
        title = _title;
        location = _location;
        starttime = _starttime;
        endtime = _endtime;
        speakeraddress = _speakeraddress;
        speakername = _speakername;

        //trigger the event
        AddTalkEvent(title,starttime,endtime);

    }

    function Register(string _name) public payable {

        require(msg.value == REGISTRATION_PRICE); 
        require(msg.sender != attendee);

        attendee = msg.sender;
        attendeeName = _name;

        RegisterEvent(attendee,attendeeName);
    }

    function isRegistered(address _acount) public view returns(bool){
        if((attendee != _acount) || (_acount == 0x0)) {
            return false;
        }
        return true;
    }

    function getTalk() public view returns (
        string _title,
        string _location,
        uint _starttime,
        uint _endtime,
        address _speakeraddress,
        string _speakername
    ) {
        return (title,location,starttime,endtime,speakeraddress,speakername);
    }

}