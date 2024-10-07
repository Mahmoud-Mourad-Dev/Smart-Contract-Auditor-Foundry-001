//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
import "forge-std/Script.sol";
import "../src/simpleStorage.sol";

contract DeploySimpleStorage is Script{

function run() external{
    vm.startBroadcast();
    new simpleStorage();
    vm.stopBroadcast();

}    
}