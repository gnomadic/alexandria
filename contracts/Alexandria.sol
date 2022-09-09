// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./Stacks.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Alexandria {
    using Counters for Counters.Counter;

    mapping(uint256 => Stacks) public stacks;

    // this contract supports:
    // creating stack as factory - every stack is it's own contract
}
