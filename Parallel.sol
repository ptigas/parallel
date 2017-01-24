pragma solidity ^0.4.2;

contract Parallel {
    address creator;
    struct Land {
        address owner;
        uint price;
    }
    
    mapping (string => Land) public land;
    event TileUpdated(uint location);

    // Original Land Owner
    function PixelMap() {creator = msg.sender;}

    // Get Land information at X,Y position.
    function getLand(string location) returns (address, uint) {
        return (land[location].owner,
                land[location].price);
    }

    // Claim unclaimed earth for free
    function claimLand(string location) payable {
        
        if (location.length != 6) {throw;}
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
    function setLand(string location, uint price) {
        if (land[location].owner != msg.sender) {throw;} // Land not owned by you!
        else {
            land[location].price = price;
            LandUpdated(location);
        }
    }
}