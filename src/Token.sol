// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.5;
import {ERC20} from "solmate/tokens/ERC20.sol";

contract Token is ERC20("Dalswap","DAL", 18) {
    constructor(){
        _mint(msg.sender, 1_000_000 * 10 ** 18);
    }

}
