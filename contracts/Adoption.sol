pragma solidity ^0.4.17;

contract Adoption {
    address[16] public adopters;

    // Create an event when an adoption occurs
    event Adopt(
        address indexed _adopter,
        uint _petId
    );

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);
        adopters[petId] = msg.sender;

        // Emit the event when an adoption occurs
        Adopt(msg.sender, petId);
        return petId;
    }
    // Retrieving the adopters
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }
}
