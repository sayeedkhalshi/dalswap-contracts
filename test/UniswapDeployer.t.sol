// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.5;

import {Test} from "forge-std/Test.sol";
import {UniswapDeployer} from "../script/UniswapDeployer.s.sol";
import {IUniswapV2Factory} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";


contract UniswapTests is Test {
    IUniswapV2Factory factory = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);

    function setUp() public {
        UniswapDeployer deployer = new UniswapDeployer();
        deployer.run();

    }


    function test_uniswapFactory() view public {
        assert(factory.feeToSetter() != address(0));
    }

}