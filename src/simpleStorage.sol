// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract simpleStorage {
    uint256 number;
//function take number as input
    function storeNumber(uint256 num) public {
        number = num;
    }
    function getStoreNumber() public view returns(uint256){
        return number;
    }
}