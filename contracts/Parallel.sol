pragma solidity ^0.4.6;

contract Parallel {
    address creator;
    
    struct Land {
        address owner;
        uint price;
    }

    mapping (bytes8 => Land) public land;
    bytes8[] geohashes;
    event LandUpdated(bytes8 location);

    // Original Land Owner
    function Parallel() {creator = msg.sender;}

    function validate(bytes8 data) {
        if (data[7] != 0x0) {
            throw;
        }

        for(uint i=0; i<7; ++i) {
            if (!((data[i] >= 0x30 && data[i] <= 0x39) || (data[i] >= 0x61 && data[i] <= 0x7a))) {
                throw;
            }
        }
    }

    function toBytes7(bytes8 data) returns (bytes8) {                
        return data & 0xFFFFFFFFFFFFFF00;
    }

    // Get Land information at X,Y position.
    function getLand(bytes8 loc) returns (address, uint) {
        bytes8 location = toBytes7(loc);
        
        return (land[location].owner, land[location].price);
    }
    
    function getHashes() returns (bytes8[]) {
        return geohashes;
    } 

    // Claim unclaimed earth for free
    function claimLand(bytes8 loc) payable {      
        validate(loc);  
        bytes8 location = toBytes7(loc);

        uint price = land[location].price;
        address owner;

        // Make sure person doesn't already own tile.
        if (land[location].owner == msg.sender) {
            throw;
        }

        // If Unowned, claim it for free.
        owner = land[location].owner;
        if (land[location].owner == 0x0) {
            land[location].owner = msg.sender;
            land[location].price = 0; // Set Price to 0.
            geohashes.push(location);
            LandUpdated(location);
        } else {
            throw;
        }
    }

    // Set an already owned Land to whatever you'd like.
    function setLand(bytes8 location, uint price) {
        if (land[location].owner != msg.sender) {throw;} // Land not owned by you!
        else {
            land[location].price = price;
            LandUpdated(location);
        }
    }
}