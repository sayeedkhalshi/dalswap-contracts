// SPDX-License-Identifier: MIT
pragma solidity >=0.8.5;

import {Script} from "forge-std/Script.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract UniswapInteractor is Script {
    address public factory;
    address public router;
    address public wethAddress;
    address public tokenA;
    address public tokenB;



    function run() public {
        vm.startBroadcast();

        // Approve Router to spend TokenA and TokenB
        approveToken(tokenA, router, type(uint256).max);
        approveToken(tokenB, router, type(uint256).max);

        // Create Pair
        createPair();

        // Add Liquidity
        uint256 amountADesired = 1000 * 10**18; // Example amounts
        uint256 amountBDesired = 2000 * 10**18;
        addLiquidity(amountADesired, amountBDesired);

        vm.stopBroadcast();
    }

    function approveToken(address token, address spender, uint256 amount) internal {
        (bool success, ) = token.call(abi.encodeWithSignature("approve(address,uint256)", spender, amount));
        require(success, "Token approval failed");
    }

    function createPair() internal {
        // Assuming the factory has a function createPair(address tokenA, address tokenB) -> address pair
        (bool success, bytes memory result) = factory.call(abi.encodeWithSignature("createPair(address,address)", tokenA, tokenB));
        require(success, "Failed to create pair");
    }

    function addLiquidity(uint256 amountADesired, uint256 amountBDesired) internal {
        // Assuming the router has a function addLiquidityETH{address token, uint amountTokenDesired, uint amountTokenMin, uint amountETHMin, address to, uint deadline}(uint amountETH, bytes calldata permit)
        // Adjust parameters as needed for your router contract
        (bool success, ) = router.call(abi.encodeWithSignature("addLiquidityETH(address,uint256,uint256,uint256,address,uint256)", tokenA, amountADesired, 0, 0, address(this), block.timestamp + 3600));
        require(success, "Failed to add liquidity");
    }

    // Add more functions as needed for verifying pool creation, liquidity addition, etc.
}
