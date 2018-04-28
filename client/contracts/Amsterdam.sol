pragma solidity ^0.4.19;

contract Amsterdam is ownable {

  // custom types
  struct Entry {
    uint id;
    uint unlockTime;
    address owner;
    string ipfs;
    string title;
    string description;
  }
  
  struct PK {
      uint id;
      string key;
  }

  // state variables
  mapping (uint => Entry) public entries;
  mapping (string => PK) private privateKeys;
  uint counter;

  // Event declaration
  event EvtRelease(
    address indexed _owner,
    string _key,
    string _ipfs
    );
    
  function Amsterdam() public {
  }

  // add an entry to the blockchain
  function appendEntry(uint _unlockTime, string _ipfs, string _title, string _description, string _file) public {
    // a new entry
    counter++;

    // adding info to Entry struct
    entries[counter] = Entry(
        counter,
        _unlockTime,
        msg.sender,
        _ipfs,
        _title,
        _description
        );
        ]
        
    // encrypt the file and return the private key 
   encryptEntry(_file);
   
    // adding info to PK struct
    privateKeys[counter] = PK(
        counter,
        pk
    );
  }
  
  function encryptEntry(string _file) private returns(string x) {
      ***magic***
      return pk;
  }
  
  function release(uint _id) public {
    // check if it is time to release
    require(now >= entries[thisEntry.id].unlockTime)
    // trigger an event
    EvtRelease(entries[_id].owner, privateKeys[_id].key, entries[_id].ipfs);
  }

  function eventTest(uint _id) public {
    EvtRelease(entries[_id].owner, entries[_id].key, entries[_id].ipfs);
  }


  // some getter functions
  
  function getIPFS(uint _id) constant public returns (uint x) {
      return entries[_id].ipfs;
  }
  
  function getTotalEnteries() public view returns (uint x){
      return counter;
  }
  
  function getDescrip(uint _id) constant public returns (string x) {
    return entries[_id].descrip;
  }
  
  function getTitle(uint _id) constant public returns (string x) {
      return entries[_id].title;
  }

  function getUnlockTime(uint _id) constant public returns(uint x) {
      return entries[_id].unlockTime;
  }

}
