// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.5;

import {Script} from "forge-std/Script.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract UniswapDeployer is Script, StdCheats{
    function run() public {
        deployCodeTo(
            "UniswapV2Factory.sol:UniswapV2Factory",
            abi.encode(0x713b8F6E2e42C0481E8B2A4095A4f878BF932716),
            0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
        );

    }
}