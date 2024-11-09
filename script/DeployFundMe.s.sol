//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {FundMe} from "../src/FundMe.sol";
import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script{
    FundMe fundMe;
    

    function run() external returns (FundMe, HelperConfig){
        
        HelperConfig helperConfig = new HelperConfig();
        address ethUSDPriceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        fundMe = new FundMe(ethUSDPriceFeed);
        vm.stopBroadcast();
        return (fundMe, helperConfig);
    }
    
}