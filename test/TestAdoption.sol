pragma solidity ^0.4.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
    }

    // Testing the retrieval of a single pet's owner
    function testGetAdopterAddressById() public {
        // Expected owner is "this" contract
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of ped ID 8 should be recorded");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[8], expected, "Ownner of pet ID 8 should be recorded");
    }
}