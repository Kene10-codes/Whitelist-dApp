//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {
     // Max number of Whitelisted addresses allowed
     uint8 public maxWhitelistedAddresses;

     // Create a mapping of WhitelistedAddresses
     // If an address is whitelisted, we would set it to true, it is false by default for all other addresses.
     mapping(address => bool) public whitelistedAddresses;

     // numAddressWhitelisted would be used to keep track of how many addresses has been wjhitelisted
     uint8 public numAddressWhitelisted;

     // Setting the Max number of whitelisted addresses
     // User will put the value at the time of deployment
     constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddresses = _maxWhitelistedAddress;
     }

     // This function adds the address of the sender to thw whitelist
     function addAddressToWhitelist() public {
       // Check if the user has already been whitelisted
       require(!whitelistedAddresses[msg.sender], "The user has been whitelisted");
       // Check if the numAddressesWhitelisted < maxWhitelistedAddress
       require(numAddressWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
       // Add the address which called the function to the whitelisted address array
       whitelistedAddresses[msg.sender] = true;
       // Increase the number of whitelisted addresseses
       numAddressWhitelisted += 1;
     }
} 