// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import { Script } from "forge-std/Script.sol";

abstract contract BaseScript is Script {
    /// @dev The address of the contract deployer.
    address internal deployer;

    constructor() {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        deployer = vm.rememberKey(privateKey);
    }

    modifier broadcaster() {
        vm.startBroadcast(deployer);
        _;
        vm.stopBroadcast();
    }
}
