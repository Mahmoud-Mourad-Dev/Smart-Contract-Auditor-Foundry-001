# Smart-Contract-Auditor-Foundry-001
```diff
-All private key in this course for educational purposes please dont share your private key in plaintext
```

To start a new project with Foundry, use the forge init command or forge init --force if folder no empty:
```solidity
forge init
```

In src folder create new smart contract file name simpleStorage.sol
```solidity
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
contract SimpleStorage {
    uint256 number;
//function take number as input
    function storeNumber(uint256 num) public {
        number = num;
    }
    function getStoreNumber() public view returns(uint256){
        return number;
    }
}
```
# Compile

To compile this contract with this command
```solidity
forge compile simpleStorage.sol
//or this command
forge build simpleStorage.sol
```
# Deploy

To deploy this contract
Forge can deploy smart contracts to a given network with the forge create command.
Forge CLI can deploy only one contract at a time
To deploy a contract, you must provide a RPC URL (env: ETH_RPC_URL) and the private key of the account that will deploy the contract

```solidity
forge create <path>:<contractname> --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> [OPTIONS]
```
Deploy to local anvil 

```solidity
forge create src/simpleStorage.sol:simpleStorage --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```
Use .env file to store -rpc-url & --private-key 
```
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL=http://127.0.0.1:8545
```
Command line to deploy from .env file
```solidity
source .env
forge create src/simpleStorage.sol:simpleStorage --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```
Write script to Deploy
In script folder make file simpleStorage.s.sol
```solidity
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
```
Command line to run script 
```solidity
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
```
You can use --broadcast with it 
```solidity
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d --broadcast
```
##Interact
How to interact with this smart contract 
Call function storeNumber to store this number 1000 
```solidity
cast send <CONTRACT_ADDRESS> "storeNumber(uint256)" <NUM> --rpc-url <RPC_URL> --private-key <PRIVATE_KEY>
```
```solidity
cast send 0x8464135c8F25Da09e49BC8782676a84730C318bC "storeNumber(uint256) " 1000 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff8
```
Command line to call function
```solidity
cast call <CONTRACT_ADDRESS> "getStoreNumber()(uint256)" --rpc-url <RPC_URL> --private-key <PRIVATE_KEY>
```
```solidity
cast call 0x8464135c8F25Da09e49BC8782676a84730C318bC "getStoreNumber()(uint256)" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff
80
```
# Test

Write test 
Test the smart contract: You'll test both storing and retrieving the number using Foundry's assertEq function to validate expected results.
Forge can run your tests with the forge test command. All tests are written in Solidity.
Forge will look for the tests anywhere in your source directory. Any contract with a function that starts with test is considered to be a test. Usually, tests will be placed in test/ by convention and end with .t.sol.

```solidity
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../src/simpleStorage.sol";
contract simpleStorageTest is Test{
    simpleStorage simpleStorageContract;
 // Deploy the simpleStorage contract before each test
    function setUp()public{
        simpleStorageContract = new simpleStorage();
    
    }
 // Test that the initial value is zero
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
```




