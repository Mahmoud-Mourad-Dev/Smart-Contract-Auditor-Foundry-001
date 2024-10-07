//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../src/simpleStorage.sol";
contract simpleStorageTest is Test{
    simpleStorage simpleStorageContract;
    function setUp()public{
        simpleStorageContract = new simpleStorage();
    
    }

    function testIntailStateEqualZero() public{
        uint256 number = simpleStorageContract.getStoreNumber();
        assertEq(number,0);
    }

    function testStoreNumber()public {
        simpleStorageContract.storeNumber(42);
        uint256 Number = simpleStorageContract.getStoreNumber();
        assertEq(Number,42);
    }

}