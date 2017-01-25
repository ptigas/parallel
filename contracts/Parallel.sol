pragma solidity ^0.4.2;

contract Parallel {
    address creator;
    
    struct Land {
        address owner;
        uint price;
    }
    
    mapping (bytes8 => Land) public land;
    event LandUpdated(bytes8 location);

    // Original Land Owner
    function Parallel() {creator = msg.sender;}

    // Get Land information at X,Y position.
    function getLand(bytes8 location) returns (address, uint) {
        return (land[location].owner, land[location].price);
    }

    function toBytes7(bytes data) returns (bytes8) {
        uint64 subdata = 0;
        for (uint64 i = 0; i < 7; i++) {
            subdata += uint64(data[i]) * 2 ** (8 * (7 - 1 - i));
        }
        return bytes8(subdata);
    }

    // Claim unclaimed earth for free
    function claimLand(bytes loc) payable {        
        if (loc.length != 7) {throw;}
        
        bytes8 location = toBytes7(loc);

        uint price = land[location].price;
        address owner;

        // Make sure person doesn't already own tile.
        if (land[location].owner == msg.sender) {
            throw;
        }

        // If Unowned by the Bank, claim it for free.
        owner = land[location].owner;
        if (land[location].owner == 0x0) {
            land[location].owner = msg.sender;
            land[location].price = 0; // Set Price to 0.
            LandUpdated(location);
        } else {
            throw;
            owner = land[location].owner;

            // If the tile isn't for sale, don't sell it!
            if (price == 0) {
                throw;
            }

            // Pay for land.
            if (msg.value != price) {
                throw;
            }
            if (owner.send(price)) {
                land[location].owner = msg.sender;
                land[location].price = 0; // Set Price to 0.
                LandUpdated(location);
            }
            else {throw;}
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