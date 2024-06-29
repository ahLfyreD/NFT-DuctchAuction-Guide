// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/DutchAuction.sol";


contract DeployDutchAuction is Script {
    function run() external {
        // Load environment variables
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        // Parameters for the constructor
        uint256 discountRate = 1000000;  // Example discount rate in wei (0.1 ETH)
        uint256 startingPrice = discountRate * 2 days; // Example price in wei (1 ETH)
        address nftAddress = 0x90a8825DA4C8cf6d7e14c765Fe2C411cE33fF117; // Example NFT contract address
        uint256 nftId = 1; // Example NFT ID

        // Start broadcasting the transaction
        vm.startBroadcast(privateKey);

        // Deploy the contract
        DutchAuction dutchAuction = new DutchAuction(
            startingPrice,
            discountRate,
            nftAddress,
            nftId
        );

        // Stop broadcasting the transaction
        vm.stopBroadcast();

        console.log("Dutch Auction contract deployed at:", address(dutchAuction));
    }
}