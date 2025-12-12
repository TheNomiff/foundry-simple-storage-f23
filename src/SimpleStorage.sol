// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // Solidity versions

contract SimpleStorage {
    uint256 public favoriteNumber;

    struct Person {
        uint256 favNumber;
        string name;
    }

    // Dynamic array
    Person[] public listOfPeople; // []

    mapping(string => uint256) public nameOfFavoritesNumbers;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, name));
        nameOfFavoritesNumbers[name] = _favoriteNumber;
    }
}
